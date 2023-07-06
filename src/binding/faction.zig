const std = @import("std");

const shared = @import("shared.zig");

pub const FactionChangeAction = enum(u2) {
    rank,
    expulsion,
    reputation,
};

pub fn clearFactionChanges(pid: u16) void {
    return raw.clearFactionChanges(pid);
}

pub fn getFactionChangesSize(pid: u16) u32 {
    return raw.getFactionChangesSize(pid);
}
pub fn getFactionChangesAction(pid: u16) FactionChangeAction {
    return @enumFromInt(raw.getFactionChangesAction(pid));
}

pub fn getFactionId(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getFactionChangesSize(pid), index);

    return std.mem.span(raw.getFactionId(pid, index).?);
}
pub fn getFactionRank(pid: u16, index: u32) i32 {
    shared.triggerSafetyCheck(getFactionChangesSize(pid), index);

    return raw.getFactionRank(pid, index);
}
pub fn getFactionExpulsionState(pid: u16, index: u32) bool {
    shared.triggerSafetyCheck(getFactionChangesSize(pid), index);

    return raw.getFactionExpulsionState(pid, index);
}
pub fn getFactionReputation(pid: u32, index: u32) i32 {
    shared.triggerSafetyCheck(getFactionChangesSize(pid), index);

    return raw.getFactionReputation(pid, index);
}

pub fn setFactionChangesAction(pid: u16, action: FactionChangeAction) void {
    return raw.setFactionChangesAction(pid, @intFromEnum(action));
}
pub fn setFactionId(faction_id: [:0]const u8) void {
    return raw.setFactionId(faction_id);
}
pub fn setFactionRank(rank: u32) void {
    return raw.setFactionRank(rank);
}
pub fn setFactionExpulsionState(expulsion_state: bool) void {
    return raw.setFactionExpulsionState(expulsion_state);
}
pub fn setFactionReputation(reputation: c_int) void {
    return raw.setFactionReputation(reputation);
}

pub fn addFaction(pid: u16) void {
    return raw.addFaction(pid);
}

pub fn sendFactionChanges(
    pid: u16,
    send_to_other_players: bool,
    skip_attached_player: bool,
) void {
    return raw.sendFactionChanges(pid, send_to_other_players, skip_attached_player);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_ClearFactionChanges(pid: c_ushort) callconv(.C) void;
    pub const clearFactionChanges = libtes3mp_ClearFactionChanges;

    extern "libTES3MP-core" fn libtes3mp_GetFactionChangesSize(pid: c_ushort) callconv(.C) c_uint;
    pub const getFactionChangesSize = libtes3mp_GetFactionChangesSize;
    extern "libTES3MP-core" fn libtes3mp_GetFactionChangesAction(pid: c_ushort) callconv(.C) u8;
    pub const getFactionChangesAction = libtes3mp_GetFactionChangesAction;

    extern "libTES3MP-core" fn libtes3mp_GetFactionId(
        pid: c_ushort,
        index: c_uint,
    ) callconv(.C) ?[*:0]const u8;
    pub const getFactionId = libtes3mp_GetFactionId;
    extern "libTES3MP-core" fn libtes3mp_GetFactionRank(
        pid: c_ushort,
        index: c_uint,
    ) callconv(.C) c_int;
    pub const getFactionRank = libtes3mp_GetFactionRank;
    extern "libTES3MP-core" fn libtes3mp_GetFactionExpulsionState(
        pid: c_ushort,
        index: c_uint,
    ) callconv(.C) bool;
    pub const getFactionExpulsionState = libtes3mp_GetFactionExpulsionState;
    extern "libTES3MP-core" fn libtes3mp_GetFactionReputation(
        pid: c_ushort,
        index: c_uint,
    ) callconv(.C) c_int;
    pub const getFactionReputation = libtes3mp_GetFactionReputation;

    extern "libTES3MP-core" fn libtes3mp_SetFactionChangesAction(
        pid: c_ushort,
        action: u8,
    ) callconv(.C) void;
    pub const setFactionChangesAction = libtes3mp_SetFactionChangesAction;
    extern "libTES3MP-core" fn libtes3mp_SetFactionId(faction_id: [*:0]const u8) callconv(.C) void;
    pub const setFactionId = libtes3mp_SetFactionId;
    extern "libTES3MP-core" fn libtes3mp_SetFactionRank(rank: c_uint) callconv(.C) void;
    pub const setFactionRank = libtes3mp_SetFactionRank;
    extern "libTES3MP-core" fn libtes3mp_SetFactionExpulsionState(
        expulsion_state: bool,
    ) callconv(.C) void;
    pub const setFactionExpulsionState = libtes3mp_SetFactionExpulsionState;
    extern "libTES3MP-core" fn libtes3mp_SetFactionReputation(reputation: c_int) callconv(.C) void;
    pub const setFactionReputation = libtes3mp_SetFactionReputation;

    extern "libTES3MP-core" fn libtes3mp_AddFaction(pid: c_ushort) callconv(.C) void;
    pub const addFaction = libtes3mp_AddFaction;

    extern "libTES3MP-core" fn libtes3mp_SendFactionChanges(
        pid: c_ushort,
        send_to_other_players: bool,
        skip_attached_player: bool,
    ) callconv(.C) void;
    pub const sendFactionChanges = libtes3mp_SendFactionChanges;
};
