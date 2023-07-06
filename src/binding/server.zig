const std = @import("std");

const shared = @import("shared.zig");

pub const LogLevel = enum(u3) {
    verbose,
    info,
    warning,
    err,
    fatal,
};

pub fn logMessage(level: LogLevel, message: [:0]const u8) void {
    return raw.logMessage(@intFromEnum(level), message);
}
pub fn logAppend(level: LogLevel, message: [:0]const u8) void {
    return raw.logAppend(@intFromEnum(level), message);
}

pub fn stopServer(code: i32) void {
    return raw.stopServer(code);
}

pub fn kick(pid: u16) void {
    return raw.kick(pid);
}
pub fn banAddress(ip_address: [:0]const u8) void {
    return raw.banAddress(ip_address);
}
pub fn unbanAddress(ip_address: [:0]const u8) void {
    return raw.unbanAddress(ip_address);
}

/// It is recommended to use std.fs.accessAbsolute and/or related functions instead.
pub fn doesFilePathExist(file_path: [:0]const u8) bool {
    return raw.doesFilePathExist(file_path);
}
/// It is recommended to use std.ascii.lowerString instead.
pub fn getCaseInsensitiveFilename(folder_path: [:0]const u8, filename: [:0]const u8) [:0]const u8 {
    return std.mem.span(raw.getCaseInsensitiveFilename(folder_path, filename).?);
}
pub fn getDataPath() [:0]const u8 {
    return std.mem.span(raw.getDataPath().?);
}
pub fn getMillisecondsSinceServerStart() c_uint {
    return raw.getMillisecondsSinceServerStart();
}
pub fn getServerVersion() [:0]const u8 {
    return std.mem.span(raw.getServerVersion().?);
}
pub fn getProtocolVersion() [:0]const u8 {
    return std.mem.span(raw.getProtocolVersion().?);
}
pub fn getAvgPing(pid: u16) i32 {
    return raw.getAvgPing(pid);
}
/// This function can return "UNASSIGNED_SYSTEM_ADDRESS".
pub fn getIP(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getIP(pid).?);
}
pub fn getMaxPlayers() u32 {
    return raw.getMaxPlayers();
}
pub fn getPort() u16 {
    return raw.getPort();
}
pub fn hasPassword() bool {
    return raw.hasPassword();
}
pub fn getDataFileEnforcementState() bool {
    return raw.getDataFileEnforcementState();
}
pub fn getScriptErrorIgnoringState() bool {
    return raw.getScriptErrorIgnoringState();
}

pub fn setGameMode(game_mode: [:0]const u8) void {
    return raw.setGameMode(game_mode);
}
pub fn setHostname(name: [:0]const u8) void {
    return raw.setHostname(name);
}
pub fn setServerPassword(password: [:0]const u8) void {
    return raw.setServerPassword(password);
}
pub fn setDataFileEnforcementState(state: bool) void {
    return raw.setDataFileEnforcementState(state);
}
pub fn setScriptErrorIgnoringState(state: bool) void {
    return raw.setScriptErrorIgnoringState(state);
}
pub fn setRuleString(key: [:0]const u8, value: [:0]const u8) void {
    return raw.setRuleString(key, value);
}
pub fn setRuleValue(key: [:0]const u8, value: f64) void {
    return raw.setRuleValue(key, value);
}

pub fn addDataFileRequirement(data_filename: [:0]const u8, checksum_string: [:0]const u8) void {
    return raw.addDataFileRequirement(data_filename, checksum_string);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_LogMessage(level: c_ushort, message: [*:0]const u8) callconv(.C) void;
    pub const logMessage = libtes3mp_LogMessage;
    extern "libTES3MP-core" fn libtes3mp_LogAppend(level: c_ushort, message: [*:0]const u8) callconv(.C) void;
    pub const logAppend = libtes3mp_LogAppend;

    extern "libTES3MP-core" fn libtes3mp_StopServer(code: c_int) callconv(.C) void;
    pub const stopServer = libtes3mp_StopServer;

    extern "libTES3MP-core" fn libtes3mp_Kick(pid: c_ushort) callconv(.C) void;
    pub const kick = libtes3mp_Kick;
    extern "libTES3MP-core" fn libtes3mp_BanAddress(ip_address: [*:0]const u8) callconv(.C) void;
    pub const banAddress = libtes3mp_BanAddress;
    extern "libTES3MP-core" fn libtes3mp_UnbanAddress(ip_address: [*:0]const u8) callconv(.C) void;
    pub const unbanAddress = libtes3mp_UnbanAddress;

    extern "libTES3MP-core" fn libtes3mp_DoesFilePathExist(file_path: [*:0]const u8) callconv(.C) bool;
    pub const doesFilePathExist = libtes3mp_DoesFilePathExist;
    extern "libTES3MP-core" fn libtes3mp_GetCaseInsensitiveFilename(folder_path: [*:0]const u8, filename: [*:0]const u8) callconv(.C) ?[*:0]const u8;
    pub const getCaseInsensitiveFilename = libtes3mp_GetCaseInsensitiveFilename;
    extern "libTES3MP-core" fn libtes3mp_GetDataPath() callconv(.C) ?[*:0]const u8;
    pub const getDataPath = libtes3mp_GetDataPath;
    extern "libTES3MP-core" fn libtes3mp_GetMillisecondsSinceServerStart() callconv(.C) c_uint;
    pub const getMillisecondsSinceServerStart = libtes3mp_GetMillisecondsSinceServerStart;
    extern "libTES3MP-core" fn libtes3mp_GetServerVersion() callconv(.C) ?[*:0]const u8;
    pub const getServerVersion = libtes3mp_GetServerVersion;
    extern "libTES3MP-core" fn libtes3mp_GetProtocolVersion() callconv(.C) ?[*:0]const u8;
    pub const getProtocolVersion = libtes3mp_GetProtocolVersion;
    extern "libTES3MP-core" fn libtes3mp_GetAvgPing(pid: c_ushort) callconv(.C) c_int;
    pub const getAvgPing = libtes3mp_GetAvgPing;
    extern "libTES3MP-core" fn libtes3mp_GetIP(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getIP = libtes3mp_GetIP;
    extern "libTES3MP-core" fn libtes3mp_GetMaxPlayers() callconv(.C) c_uint;
    pub const getMaxPlayers = libtes3mp_GetMaxPlayers;
    extern "libTES3MP-core" fn libtes3mp_GetPort() callconv(.C) c_ushort;
    pub const getPort = libtes3mp_GetPort;
    extern "libTES3MP-core" fn libtes3mp_HasPassword() callconv(.C) bool;
    pub const hasPassword = libtes3mp_HasPassword;
    extern "libTES3MP-core" fn libtes3mp_GetDataFileEnforcementState() callconv(.C) bool;
    pub const getDataFileEnforcementState = libtes3mp_GetDataFileEnforcementState;
    extern "libTES3MP-core" fn libtes3mp_GetScriptErrorIgnoringState() callconv(.C) bool;
    pub const getScriptErrorIgnoringState = libtes3mp_GetScriptErrorIgnoringState;

    extern "libTES3MP-core" fn libtes3mp_SetGameMode(game_mode: [*:0]const u8) callconv(.C) void;
    pub const setGameMode = libtes3mp_SetGameMode;
    extern "libTES3MP-core" fn libtes3mp_SetHostname(name: [*:0]const u8) callconv(.C) void;
    pub const setHostname = libtes3mp_SetHostname;
    extern "libTES3MP-core" fn libtes3mp_SetServerPassword(password: [*:0]const u8) callconv(.C) void;
    pub const setServerPassword = libtes3mp_SetServerPassword;
    extern "libTES3MP-core" fn libtes3mp_SetDataFileEnforcementState(state: bool) callconv(.C) void;
    pub const setDataFileEnforcementState = libtes3mp_SetDataFileEnforcementState;
    extern "libTES3MP-core" fn libtes3mp_SetScriptErrorIgnoringState(state: bool) callconv(.C) void;
    pub const setScriptErrorIgnoringState = libtes3mp_SetScriptErrorIgnoringState;
    extern "libTES3MP-core" fn libtes3mp_SetRuleString(key: [*:0]const u8, value: [*:0]const u8) callconv(.C) void;
    pub const setRuleString = libtes3mp_SetRuleString;
    extern "libTES3MP-core" fn libtes3mp_SetRuleValue(key: [*:0]const u8, value: f64) callconv(.C) void;
    pub const setRuleValue = libtes3mp_SetRuleValue;

    extern "libTES3MP-core" fn libtes3mp_AddDataFileRequirement(data_filename: [*:0]const u8, checksum_string: [*:0]const u8) callconv(.C) void;
    pub const addDataFileRequirement = libtes3mp_AddDataFileRequirement;
};
