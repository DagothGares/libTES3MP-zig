const std = @import("std");

const shared = @import("shared.zig");

pub const ResurrectionType = enum(u2) {
    regular,
    imperial_shrine,
    tribunal_temple,
};

pub const MiscChangeType = enum(u1) {
    mark_location,
    selected_spell,
};

pub fn clearAlliedPlayersForPlayer(pid: u16) void {
    return raw.clearAlliedPlayersForPlayer(pid);
}

pub fn getMiscellaneousChangeType(pid: u16) MiscChangeType {
    return @enumFromInt(raw.getMiscellaneousChangeType(pid));
}

pub fn getMarkCell(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getMarkCell(pid).?);
}
pub fn getMarkPosX(pid: u16) f64 {
    return raw.getMarkPosX(pid);
}
pub fn getMarkPosY(pid: u16) f64 {
    return raw.getMarkPosY(pid);
}
pub fn getMarkPosZ(pid: u16) f64 {
    return raw.getMarkPosZ(pid);
}
pub fn getMarkRotX(pid: u16) f64 {
    return raw.getMarkRotX(pid);
}
pub fn getMarkRotZ(pid: u16) f64 {
    return raw.getMarkRotZ(pid);
}
pub fn getSelectedSpellId(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getSelectedSpellId(pid).?);
}

pub fn doesPlayerHavePlayerKiller(pid: u16) bool {
    return raw.doesPlayerHavePlayerKiller(pid);
}
pub fn getPlayerKillerPid(pid: u16) u32 {
    std.debug.assert(doesPlayerHavePlayerKiller(pid));

    return @intCast(raw.getPlayerKillerPid(pid));
}
pub fn getPlayerKillerRefId(pid: u16) [:0]const u8 {
    std.debug.assert(!doesPlayerHavePlayerKiller(pid));

    return std.mem.span(raw.getPlayerKillerRefId(pid).?);
}
pub fn getPlayerKillerRefNum(pid: u16) u32 {
    std.debug.assert(!doesPlayerHavePlayerKiller(pid));

    return raw.getPlayerKillerRefNum(pid);
}
pub fn getPlayerKillerMpNum(pid: u16) u32 {
    std.debug.assert(!doesPlayerHavePlayerKiller(pid));

    return raw.getPlayerKillerMpNum(pid);
}
pub fn getPlayerKillerName(pid: u16) [:0]const u8 {
    std.debug.assert(!doesPlayerHavePlayerKiller(pid));

    return std.mem.span(raw.getPlayerKillerName(pid).?);
}

pub fn getDrawState(pid: u16) u32 {
    return raw.getDrawState(pid);
}
pub fn getSneakState(pid: u16) bool {
    return raw.getSneakState(pid);
}

pub fn setMarkCell(pid: u16, cell_description: [:0]const u8) void {
    return raw.setMarkCell(pid, cell_description);
}
pub fn setMarkPos(pid: u16, x: f64, y: f64, z: f64) void {
    return raw.setMarkPos(pid, x, y, z);
}
pub fn setMarkRot(pid: u16, x: f64, z: f64) void {
    return raw.setMarkRot(pid, x, z);
}
pub fn setSelectedSpellId(pid: u16, spell_id: [:0]const u8) void {
    return raw.setSelectedSpellId(pid, spell_id);
}

pub fn addAlliedPlayerForPlayer(pid: u16, allied_player_pid: u16) void {
    return raw.addAlliedPlayerForPlayer(pid, allied_player_pid);
}

pub fn sendMarkLocation(pid: u16) void {
    return raw.sendMarkLocation(pid);
}
pub fn sendSelectedSpell(pid: u16) void {
    return raw.sendSelectedSpell(pid);
}
pub fn sendAlliedPlayers(pid: u16, send_to_other_players: bool) void {
    return raw.sendAlliedPlayers(pid, send_to_other_players);
}

pub fn jail(
    pid: u16,
    jail_days: i32,
    ignore_teleportation: bool,
    ignore_skill_increases: bool,
    progress_text: [:0]const u8,
    end_text: [:0]const u8,
) void {
    return raw.jail(
        pid,
        jail_days,
        ignore_teleportation,
        ignore_skill_increases,
        progress_text,
        end_text,
    );
}
pub fn resurrect(pid: u16, resurrectType: ResurrectionType) void {
    return raw.resurrect(pid, @intFromEnum(resurrectType));
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_ClearAlliedPlayersForPlayer(pid: c_ushort) callconv(.C) void;
    pub const clearAlliedPlayersForPlayer = libtes3mp_ClearAlliedPlayersForPlayer;

    extern "libTES3MP-core" fn libtes3mp_GetMiscellaneousChangeType(pid: c_ushort) callconv(.C) u8;
    pub const getMiscellaneousChangeType = libtes3mp_GetMiscellaneousChangeType;

    extern "libTES3MP-core" fn libtes3mp_GetMarkCell(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getMarkCell = libtes3mp_GetMarkCell;
    extern "libTES3MP-core" fn libtes3mp_GetMarkPosX(pid: c_ushort) callconv(.C) f64;
    pub const getMarkPosX = libtes3mp_GetMarkPosX;
    extern "libTES3MP-core" fn libtes3mp_GetMarkPosY(pid: c_ushort) callconv(.C) f64;
    pub const getMarkPosY = libtes3mp_GetMarkPosY;
    extern "libTES3MP-core" fn libtes3mp_GetMarkPosZ(pid: c_ushort) callconv(.C) f64;
    pub const getMarkPosZ = libtes3mp_GetMarkPosZ;
    extern "libTES3MP-core" fn libtes3mp_GetMarkRotX(pid: c_ushort) callconv(.C) f64;
    pub const getMarkRotX = libtes3mp_GetMarkRotX;
    extern "libTES3MP-core" fn libtes3mp_GetMarkRotZ(pid: c_ushort) callconv(.C) f64;
    pub const getMarkRotZ = libtes3mp_GetMarkRotZ;
    extern "libTES3MP-core" fn libtes3mp_GetSelectedSpellId(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getSelectedSpellId = libtes3mp_GetSelectedSpellId;

    extern "libTES3MP-core" fn libtes3mp_DoesPlayerHavePlayerKiller(pid: c_ushort) callconv(.C) bool;
    pub const doesPlayerHavePlayerKiller = libtes3mp_DoesPlayerHavePlayerKiller;
    extern "libTES3MP-core" fn libtes3mp_GetPlayerKillerPid(pid: c_ushort) callconv(.C) c_int;
    pub const getPlayerKillerPid = libtes3mp_GetPlayerKillerPid;
    extern "libTES3MP-core" fn libtes3mp_GetPlayerKillerRefId(
        pid: c_ushort,
    ) callconv(.C) ?[*:0]const u8;
    pub const getPlayerKillerRefId = libtes3mp_GetPlayerKillerRefId;
    extern "libTES3MP-core" fn libtes3mp_GetPlayerKillerRefNum(pid: c_ushort) callconv(.C) c_uint;
    pub const getPlayerKillerRefNum = libtes3mp_GetPlayerKillerRefNum;
    extern "libTES3MP-core" fn libtes3mp_GetPlayerKillerMpNum(pid: c_ushort) callconv(.C) c_uint;
    pub const getPlayerKillerMpNum = libtes3mp_GetPlayerKillerMpNum;
    extern "libTES3MP-core" fn libtes3mp_GetPlayerKillerName(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getPlayerKillerName = libtes3mp_GetPlayerKillerName;

    extern "libTES3MP-core" fn libtes3mp_GetDrawState(pid: c_ushort) callconv(.C) c_uint;
    pub const getDrawState = libtes3mp_GetDrawState;
    extern "libTES3MP-core" fn libtes3mp_GetSneakState(pid: c_ushort) callconv(.C) bool;
    pub const getSneakState = libtes3mp_GetSneakState;

    extern "libTES3MP-core" fn libtes3mp_SetMarkCell(
        pid: c_ushort,
        cell_description: [*:0]const u8,
    ) callconv(.C) void;
    pub const setMarkCell = libtes3mp_SetMarkCell;
    extern "libTES3MP-core" fn libtes3mp_SetMarkPos(
        pid: c_ushort,
        x: f64,
        y: f64,
        z: f64,
    ) callconv(.C) void;
    pub const setMarkPos = libtes3mp_SetMarkPos;
    extern "libTES3MP-core" fn libtes3mp_SetMarkRot(pid: c_ushort, x: f64, z: f64) callconv(.C) void;
    pub const setMarkRot = libtes3mp_SetMarkRot;
    extern "libTES3MP-core" fn libtes3mp_SetSelectedSpellId(
        pid: c_ushort,
        spell_id: [*:0]const u8,
    ) callconv(.C) void;
    pub const setSelectedSpellId = libtes3mp_SetSelectedSpellId;

    extern "libTES3MP-core" fn libtes3mp_AddAlliedPlayerForPlayer(
        pid: c_ushort,
        allied_player_pid: c_ushort,
    ) callconv(.C) void;
    pub const addAlliedPlayerForPlayer = libtes3mp_AddAlliedPlayerForPlayer;

    extern "libTES3MP-core" fn libtes3mp_SendMarkLocation(pid: c_ushort) callconv(.C) void;
    pub const sendMarkLocation = libtes3mp_SendMarkLocation;
    extern "libTES3MP-core" fn libtes3mp_SendSelectedSpell(pid: c_ushort) callconv(.C) void;
    pub const sendSelectedSpell = libtes3mp_SendSelectedSpell;
    extern "libTES3MP-core" fn libtes3mp_SendAlliedPlayers(
        pid: c_ushort,
        send_to_other_players: bool,
    ) callconv(.C) void;
    pub const sendAlliedPlayers = libtes3mp_SendAlliedPlayers;

    extern "libTES3MP-core" fn libtes3mp_Jail(
        pid: c_ushort,
        jail_days: c_int,
        ignore_teleportation: bool,
        ignore_skill_increases: bool,
        progress_text: [*:0]const u8,
        end_text: [*:0]const u8,
    ) callconv(.C) void;
    pub const jail = libtes3mp_Jail;
    extern "libTES3MP-core" fn libtes3mp_Resurrect(pid: c_ushort, type: c_uint) callconv(.C) void;
    pub const resurrect = libtes3mp_Resurrect;
};
