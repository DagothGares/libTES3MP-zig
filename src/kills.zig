const std = @import("std");

const Allocator = std.mem.Allocator;

const impl = @import("binding.zig").worldstate;

len: u32,
/// You will not get bounds checking with this unless you slice it to [0..len]!
ref_ids: [*][:0]const u8,
/// You will not get bounds checking with this unless you slice it to [0..len]!
counts: [*]i32,

const Self = @This();

/// Fetches the current kill changes for the latest read-only worldstate.
///
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
///
/// If 'dupe' is true, the caller owns both the returned slice and its contents.
/// If 'dupe' is false, the caller owns the returned slice, but not its contents,
/// and the contents will become invalid after the initial callback returns.
pub fn fetch(allocator: Allocator, dupe: bool) Allocator.Error!Self {
    const len = impl.getKillChangesSize();

    const ref_ids = try allocator.alloc([:0]const u8, len);
    errdefer {
        if (dupe) {
            for (ref_ids) |ref_id| {
                allocator.free(ref_id);
            }
        }
        allocator.free(ref_ids);
    }
    for (ref_ids, 0..) |*ref_id, i| {
        const new = impl.getKillRefId(i);
        ref_id.* = if (dupe) try allocator.dupe(u8, new) else new;
    }

    const counts = try allocator.alloc(c_int, len);
    errdefer allocator.free(counts);
    for (counts, 0..) |*count, i| {
        count.* = impl.getKillNumber(i);
    }

    return .{
        .len = len,
        .ref_ids = ref_ids,
        .counts = counts,
    };
}

/// If is_dupe is true, also frees all ref_id strings.
pub fn deinit(self: *Self, allocator: Allocator, is_dupe: bool) void {
    if (is_dupe) {
        for (self.ref_ids[0..self.len]) |ref_id| {
            allocator.free(ref_id);
        }
    }

    allocator.free(self.ref_ids[0..self.len]);
    allocator.free(self.kill_counts[0..self.len]);

    self.* = undefined;
}

pub fn push(self: Self, pid: c_ushort, for_everyone: bool, skip_attached_player: bool) void {
    impl.clearKillChanges();

    for (self.ref_ids[0..self.len], self.kill_counts[0..self.len]) |ref_id, count| {
        impl.addKill(ref_id, count);
    }

    impl.sendWorldKillCount(pid, for_everyone, skip_attached_player);
}
