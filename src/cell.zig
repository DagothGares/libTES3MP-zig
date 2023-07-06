const std = @import("std");
const Allocator = std.mem.Allocator;

const impl = @import("binding.zig").cell;

pub const CellStateChange = struct {
    state_type: impl.CellState,
    description: [:0]const u8,

    const Self = @This();
    /// Fetches the latest recorded cell state changes for a player.
    ///
    /// If 'dupe' is true, the caller owns both the returned slice and the string contents.
    /// If 'dupe' is false, the caller owns the returned slice, but not the string contents,
    /// and the contents will become invalid after the initial callback returns.
    pub fn fetch(pid: u16, allocator: Allocator, dupe: bool) Allocator.Error![]Self {
        const len = impl.getCellStateChangesSize(pid);

        const state_changes = try allocator.alloc(Self, len);
        var capacity: u32 = 0;
        errdefer {
            if (dupe) {
                for (state_changes[0..capacity]) |sc| {
                    allocator.free(sc.description);
                }
            }
            allocator.free(state_changes);
        }

        for (state_changes) |*sc| {
            const new_desc = impl.raw.getCellStateDescription(pid, capacity);
            sc = .{
                .state_type = impl.raw.getCellStateType(pid, capacity),
                .description = if (dupe) try allocator.dupe(u8, new_desc) else new_desc,
            };

            capacity += 1;
        }

        return state_changes;
    }
};

// TODO: Region?
