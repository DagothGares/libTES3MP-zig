/// https://i.ytimg.com/vi/9lyKxKn_WsE/hqdefault.jpg
pub inline fn triggerSafetyCheck(len: usize, index: usize) void {
    if (@import("std").debug.runtime_safety) {
        const slice: []const u0 = @as([*]const u0, @ptrCast(&[0]u0{}))[0..len];

        // std.mem.doNotOptimizeAway on a u0 triggers an assert in std.math.ceilPowerOfTwoPromote,
        // so I've taken the liberty of inlining the code by hand.
        const value = @as(u8, slice[index]);
        asm volatile (""
            :
            : [value] "r" (value),
        );
    }
}
