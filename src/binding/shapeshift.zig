const std = @import("std");

const shared = @import("shared.zig");

pub fn getScale(pid: u16) f64 {
    return raw.getScale(pid);
}
pub fn isWerewolf(pid: u16) bool {
    return raw.isWerewolf(pid);
}
pub fn getCreatureRefId(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getCreatureRefId(pid).?);
}
pub fn getCreatureNameDisplayState(pid: u16) bool {
    return raw.getCreatureNameDisplayState(pid);
}

pub fn setScale(pid: u16, scale: f64) void {
    return raw.setScale(pid, scale);
}
pub fn setWerewolfState(pid: u16, is_werewolf: bool) void {
    return raw.setWerewolfState(pid, is_werewolf);
}
pub fn setCreatureRefId(pid: u16, ref_id: [:0]const u8) void {
    return raw.setCreatureRefId(pid, ref_id);
}
pub fn setCreatureNameDisplayState(pid: u16, display_state: bool) void {
    return raw.setCreatureNameDisplayState(pid, display_state);
}

pub fn sendShapeshift(pid: u16) void {
    return raw.sendShapeshift(pid);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_GetScale(pid: c_ushort) callconv(.C) f64;
    pub const getScale = libtes3mp_GetScale;
    extern "libTES3MP-core" fn libtes3mp_IsWerewolf(pid: c_ushort) callconv(.C) bool;
    pub const isWerewolf = libtes3mp_IsWerewolf;
    extern "libTES3MP-core" fn libtes3mp_GetCreatureRefId(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getCreatureRefId = libtes3mp_GetCreatureRefId;
    extern "libTES3MP-core" fn libtes3mp_GetCreatureNameDisplayState(pid: c_ushort) callconv(.C) bool;
    pub const getCreatureNameDisplayState = libtes3mp_GetCreatureNameDisplayState;

    extern "libTES3MP-core" fn libtes3mp_SetScale(pid: c_ushort, scale: f64) callconv(.C) void;
    pub const setScale = libtes3mp_SetScale;
    extern "libTES3MP-core" fn libtes3mp_SetWerewolfState(pid: c_ushort, is_werewolf: bool) callconv(.C) void;
    pub const setWerewolfState = libtes3mp_SetWerewolfState;
    extern "libTES3MP-core" fn libtes3mp_SetCreatureRefId(pid: c_ushort, ref_id: [*:0]const u8) callconv(.C) void;
    pub const setCreatureRefId = libtes3mp_SetCreatureRefId;
    extern "libTES3MP-core" fn libtes3mp_SetCreatureNameDisplayState(pid: c_ushort, display_state: bool) callconv(.C) void;
    pub const setCreatureNameDisplayState = libtes3mp_SetCreatureNameDisplayState;

    extern "libTES3MP-core" fn libtes3mp_SendShapeshift(pid: c_ushort) callconv(.C) void;
    pub const sendShapeshift = libtes3mp_SendShapeshift;
};
