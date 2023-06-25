const std = @import("std");

const Allocator = std.mem.Allocator;

const impl = @import("binding.zig").worldstate;

const Variable = union(impl.VariableType) {
    Short: u16,
    Long: u32,
    Float: f32,

    /// It is unclear if this type is implemented,
    /// and what the difference is from a standard long.
    Int: void,
    /// It is unclear if this type is implemented.
    String: void,
};

len: u32,
/// You will not get bounds checking with this unless you slice it to [0..len]!
ids: [*][:0]const u8,
/// You will not get bounds checking with this unless you slice it to [0..len]!
variables: [*]Variable,

const Self = @This();

/// Fetches the current client globals for the latest read-only worldstate.
///
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
///
/// If 'dupe' is true, the caller owns both the returned slice and its contents.
/// If 'dupe' is false, the caller owns the returned slice, but not its contents,
/// and the contents will become invalid after the initial callback returns.
pub fn fetch(allocator: Allocator, dupe: bool) Allocator.Error!Self {
    const len = impl.getClientGlobalsSize();

    const ids = try allocator.alloc([:0]const u8, len);
    errdefer {
        if (dupe) {
            for (ids) |id| {
                allocator.free(id);
            }
        }
        allocator.free(ids);
    }
    for (ids, 0..) |*id, i| {
        const new = impl.getClientGlobalId(i);
        id.* = if (dupe) try allocator.dupe(u8, new) else new;
    }

    const variables = try allocator.alloc(Variable, len);
    errdefer allocator.free(variables);
    for (variables, 0..) |*variable, i| {
        const var_type = impl.getClientGlobalVariableType(i);
        variable.* = switch (var_type) {
            .Short => @intCast(u16, impl.getClientGlobalIntValue(i)),
            .Long => impl.getClientGlobalIntValue(i),
            .Float => impl.getClientGlobalFloatValue(i),
        };
    }

    return .{
        .len = len,
        .ids = ids,
        .variables = variables,
    };
}

pub fn deinit(self: *Self, allocator: Allocator, dupe: bool) void {
    if (dupe) {
        for (self.ids[0..self.len]) |id| {
            allocator.free(id);
        }
    }
    allocator.free(self.ids);
    allocator.free(self.variables);

    self.* = undefined;
}

pub fn push(
    names: [][:0]const u8,
    variables: []Variable,
    pid: c_ushort,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    impl.clearClientGlobals();

    for (names, variables) |name, variable| {
        impl.addClientGlobalVariable(name, variable);
    }

    impl.sendClientScriptGlobal(pid, for_everyone, skip_attached_player);
}
