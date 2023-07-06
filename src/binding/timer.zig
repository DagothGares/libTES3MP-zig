const std = @import("std");
const builtin = @import("builtin");

pub const OpaqueFn = opaque {};
// std.builtin.vaList is broken on Windows x86_64
pub const va_list = switch (builtin.os.tag) {
    .windows => std.os.windows.va_list,
    else => std.builtin.VaList,
};

pub fn createTimer(callback: *const OpaqueFn, msec: c_int) c_int {
    return raw.createTimer(callback, msec);
}

// I don't quite understand how this function is supposed to work, and vaList is broken on Windows anyway.
//pub fn createTimerEx(
//    callback: *const OpaqueFn,
//    msec: i32,
//    types: [*:0]const u8, // How is this supposed to be filled out?
//    ...,
//) callconv(.C) i32 {
//    // since vaList is broken on windows, these builtins might not work either
//    var args = @cVaStart();
//    defer @cVaEnd(&args);
//    var copy = @cVaCopy(&args);
//
//    return raw.createTimerEx(callback, msec, types, &copy);
//}
pub fn startTimer(timer_id: i32) void {
    return raw.startTimer(timer_id);
}
pub fn stopTimer(timer_id: i32) void {
    return raw.stopTimer(timer_id);
}
pub fn restartTimer(timer_id: i32, msec: i32) void {
    return raw.restartTimer(timer_id, msec);
}
pub fn freeTimer(timer_id: i32) void {
    return raw.freeTimer(timer_id);
}
pub fn isTimerElapsed(timer_id: i32) bool {
    return raw.isTimerElapsed(timer_id);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_CreateTimer(callback: *const OpaqueFn, msec: c_int) callconv(.C) c_int;
    pub const createTimer = libtes3mp_CreateTimer;
    extern "libTES3MP-core" fn libtes3mp_CreateTimerEx(callback: *const OpaqueFn, msec: c_int, types: [*:0]const u8, args: ?va_list) callconv(.C) c_int;
    pub const createTimerEx = libtes3mp_CreateTimerEx;
    extern "libTES3MP-core" fn libtes3mp_StartTimer(timer_id: c_int) callconv(.C) void;
    pub const startTimer = libtes3mp_StartTimer;
    extern "libTES3MP-core" fn libtes3mp_StopTimer(timer_id: c_int) callconv(.C) void;
    pub const stopTimer = libtes3mp_StopTimer;
    extern "libTES3MP-core" fn libtes3mp_RestartTimer(timer_id: c_int, msec: c_int) callconv(.C) void;
    pub const restartTimer = libtes3mp_RestartTimer;
    extern "libTES3MP-core" fn libtes3mp_FreeTimer(timer_id: c_int) callconv(.C) void;
    pub const freeTimer = libtes3mp_FreeTimer;
    extern "libTES3MP-core" fn libtes3mp_IsTimerElapsed(timer_id: c_int) callconv(.C) bool;
    pub const isTimerElapsed = libtes3mp_IsTimerElapsed;
};
