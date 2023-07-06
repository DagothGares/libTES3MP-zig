const std = @import("std");

const shared = @import("shared.zig");

pub const JournalItemType = enum(u1) {
    entry,
    index,
};

pub fn clearJournalChanges(pid: u16) void {
    return raw.clearJournalChanges(pid);
}

pub fn getJournalChangesSize(pid: u16) c_uint {
    return raw.getJournalChangesSize(pid);
}

pub fn addJournalEntry(
    pid: u16,
    quest: [:0]const u8,
    index: u32,
    actor_ref_id: [:0]const u8,
) void {
    return raw.addJournalEntry(pid, quest, index, actor_ref_id);
}
pub fn addJournalEntryWithTimestamp(
    pid: u16,
    quest: [:0]const u8,
    index: u32,
    actor_ref_id: [:0]const u8,
    days_passed: u32,
    month: u32,
    day: u32,
) void {
    return raw.addJournalEntryWithTimestamp(
        pid,
        quest,
        index,
        actor_ref_id,
        days_passed,
        month,
        day,
    );
}
pub fn addJournalIndex(pid: u16, quest: [:0]const u8, index: u32) void {
    return raw.addJournalIndex(pid, quest, index);
}

pub fn setReputation(pid: u16, value: i32) void {
    return raw.setReputation(pid, value);
}

pub fn getJournalItemQuest(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getJournalChangesSize(pid), index);

    return std.mem.span(raw.getJournalItemQuest(pid, index).?);
}
pub fn getJournalItemIndex(pid: u16, index: u32) i32 {
    shared.triggerSafetyCheck(getJournalChangesSize(pid), index);

    return raw.getJournalItemIndex(pid, index);
}
pub fn getJournalItemType(pid: u16, index: u32) JournalItemType {
    shared.triggerSafetyCheck(getJournalChangesSize(pid), index);

    return @enumFromInt(raw.getJournalItemType(pid, index));
}
pub fn getJournalItemActorRefId(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getJournalChangesSize(pid), index);

    return std.mem.span(raw.getJournalItemActorRefId(pid, index).?);
}

pub fn getReputation(pid: u16) i32 {
    return raw.getReputation(pid);
}

pub fn sendJournalChanges(
    pid: u16,
    send_to_other_players: bool,
    skip_attached_player: bool,
) void {
    return raw.sendJournalChanges(pid, send_to_other_players, skip_attached_player);
}
pub fn sendReputation(
    pid: u16,
    send_to_other_players: bool,
    skip_attached_player: bool,
) void {
    return raw.sendReputation(pid, send_to_other_players, skip_attached_player);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_ClearJournalChanges(pid: c_ushort) void;
    pub const clearJournalChanges = libtes3mp_ClearJournalChanges;

    extern "libTES3MP-core" fn libtes3mp_GetJournalChangesSize(pid: c_ushort) c_uint;
    pub const getJournalChangesSize = libtes3mp_GetJournalChangesSize;

    extern "libTES3MP-core" fn libtes3mp_AddJournalEntry(pid: c_ushort, quest: [*:0]const u8, index: c_uint, actor_ref_id: [*:0]const u8) void;
    pub const addJournalEntry = libtes3mp_AddJournalEntry;
    extern "libTES3MP-core" fn libtes3mp_AddJournalEntryWithTimestamp(pid: c_ushort, quest: [*:0]const u8, index: c_uint, actor_ref_id: [*:0]const u8, days_passed: c_uint, month: c_uint, day: c_uint) void;
    pub const addJournalEntryWithTimestamp = libtes3mp_AddJournalEntryWithTimestamp;
    extern "libTES3MP-core" fn libtes3mp_AddJournalIndex(pid: c_ushort, quest: [*:0]const u8, index: c_uint) void;
    pub const addJournalIndex = libtes3mp_AddJournalIndex;

    extern "libTES3MP-core" fn libtes3mp_SetReputation(pid: c_ushort, value: c_int) void;
    pub const setReputation = libtes3mp_SetReputation;

    extern "libTES3MP-core" fn libtes3mp_GetJournalItemQuest(pid: c_ushort, index: c_uint) ?[*:0]const u8;
    pub const getJournalItemQuest = libtes3mp_GetJournalItemQuest;
    extern "libTES3MP-core" fn libtes3mp_GetJournalItemIndex(pid: c_ushort, index: c_uint) c_int;
    pub const getJournalItemIndex = libtes3mp_GetJournalItemIndex;
    extern "libTES3MP-core" fn libtes3mp_GetJournalItemType(pid: c_ushort, index: c_uint) c_int;
    pub const getJournalItemType = libtes3mp_GetJournalItemType;
    extern "libTES3MP-core" fn libtes3mp_GetJournalItemActorRefId(pid: c_ushort, index: c_uint) ?[*:0]const u8;
    pub const getJournalItemActorRefId = libtes3mp_GetJournalItemActorRefId;

    extern "libTES3MP-core" fn libtes3mp_GetReputation(pid: c_ushort) c_int;
    pub const getReputation = libtes3mp_GetReputation;

    extern "libTES3MP-core" fn libtes3mp_SendJournalChanges(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) void;
    pub const sendJournalChanges = libtes3mp_SendJournalChanges;
    extern "libTES3MP-core" fn libtes3mp_SendReputation(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) void;
    pub const sendReputation = libtes3mp_SendReputation;
};
