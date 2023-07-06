const std = @import("std");

const shared = @import("shared.zig");

const EnforcedLogLevel = enum(i4) {
    none = -1,
    verbose = 0,
    info,
    warning,
    err,
    fatal,
};

pub fn setDifficulty(pid: u16, difficulty: i32) void {
    return raw.setDifficulty(pid, difficulty);
}
pub fn setEnforcedLogLevel(pid: u16, enforced_log_level: EnforcedLogLevel) void {
    return raw.setEnforcedLogLevel(pid, @intFromEnum(enforced_log_level));
}
pub fn setPhysicsFramerate(pid: u16, physics_framerate: f64) void {
    return raw.setPhysicsFramerate(pid, physics_framerate);
}

pub fn setConsoleAllowed(pid: u16, state: bool) void {
    return raw.setConsoleAllowed(pid, state);
}
pub fn setBedRestAllowed(pid: u16, state: bool) void {
    return raw.setBedRestAllowed(pid, state);
}
pub fn setWildernessRestAllowed(pid: u16, state: bool) void {
    return raw.setWildernessRestAllowed(pid, state);
}
pub fn setWaitAllowed(pid: u16, state: bool) void {
    return raw.setWaitAllowed(pid, state);
}

pub fn setGameSettingValue(pid: u16, setting: [:0]const u8, value: [:0]const u8) void {
    return raw.setGameSettingValue(pid, setting, value);
}
pub fn clearGameSettingValues(pid: u16) void {
    return raw.clearGameSettingValues(pid);
}

pub fn setVRSettingValue(pid: u16, setting: [:0]const u8, value: [:0]const u8) void {
    return raw.setVRSettingValue(pid, setting, value);
}
pub fn clearVRSettingValues(pid: u16) void {
    return raw.clearVRSettingValues(pid);
}

pub fn sendSettings(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendSettings(pid, send_to_other_players, skip_attached_player);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_SetDifficulty(pid: c_ushort, difficulty: c_int) callconv(.C) void;
    pub const setDifficulty = libtes3mp_SetDifficulty;
    extern "libTES3MP-core" fn libtes3mp_SetEnforcedLogLevel(pid: c_ushort, enforced_log_level: c_int) callconv(.C) void;
    pub const setEnforcedLogLevel = libtes3mp_SetEnforcedLogLevel;
    extern "libTES3MP-core" fn libtes3mp_SetPhysicsFramerate(pid: c_ushort, physics_framerate: f64) callconv(.C) void;
    pub const setPhysicsFramerate = libtes3mp_SetPhysicsFramerate;

    extern "libTES3MP-core" fn libtes3mp_SetConsoleAllowed(pid: c_ushort, state: bool) callconv(.C) void;
    pub const setConsoleAllowed = libtes3mp_SetConsoleAllowed;
    extern "libTES3MP-core" fn libtes3mp_SetBedRestAllowed(pid: c_ushort, state: bool) callconv(.C) void;
    pub const setBedRestAllowed = libtes3mp_SetBedRestAllowed;
    extern "libTES3MP-core" fn libtes3mp_SetWildernessRestAllowed(pid: c_ushort, state: bool) callconv(.C) void;
    pub const setWildernessRestAllowed = libtes3mp_SetWildernessRestAllowed;
    extern "libTES3MP-core" fn libtes3mp_SetWaitAllowed(pid: c_ushort, state: bool) callconv(.C) void;
    pub const setWaitAllowed = libtes3mp_SetWaitAllowed;

    extern "libTES3MP-core" fn libtes3mp_SetGameSettingValue(pid: c_ushort, setting: [*:0]const u8, value: [*:0]const u8) callconv(.C) void;
    pub const setGameSettingValue = libtes3mp_SetGameSettingValue;
    extern "libTES3MP-core" fn libtes3mp_ClearGameSettingValues(pid: c_ushort) callconv(.C) void;
    pub const clearGameSettingValues = libtes3mp_ClearGameSettingValues;

    extern "libTES3MP-core" fn libtes3mp_SetVRSettingValue(pid: c_ushort, setting: [*:0]const u8, value: [*:0]const u8) callconv(.C) void;
    pub const setVRSettingValue = libtes3mp_SetVRSettingValue;
    extern "libTES3MP-core" fn libtes3mp_ClearVRSettingValues(pid: c_ushort) callconv(.C) void;
    pub const clearVRSettingValues = libtes3mp_ClearVRSettingValues;

    extern "libTES3MP-core" fn libtes3mp_SendSettings(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendSettings = libtes3mp_SendSettings;
};
