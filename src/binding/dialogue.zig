const std = @import("std");

const shared = @import("shared.zig");

pub fn clearTopicChanges(pid: u16) void {
    return raw.clearTopicChanges(pid);
}
pub fn getTopicChangesSize(pid: u16) u32 {
    return raw.getTopicChangesSize(pid);
}
pub fn addTopic(pid: u16, topic_id: [:0]const u8) void {
    return raw.addTopic(pid, topic_id);
}
pub fn getTopicId(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getTopicChangesSize(pid), index);

    return std.mem.span(raw.getTopicId(pid, index).?);
}
pub fn sendTopicChanges(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendTopicChanges(pid, skip_attached_player, send_to_other_players);
}

pub fn playAnimation(pid: u16, group_name: [:0]const u8, mode: i32, count: i32, persist: bool) void {
    return raw.playAnimation(pid, group_name, mode, count, persist);
}
pub fn playSpeech(pid: u16, sound: [:0]const u8) void {
    return raw.playSpeech(pid, sound);
}

const raw = struct {
    pub extern "libTES3MP-core" fn libtes3mp_ClearTopicChanges(pid: c_ushort) callconv(.C) void;
    pub const clearTopicChanges = libtes3mp_ClearTopicChanges;
    pub extern "libTES3MP-core" fn libtes3mp_GetTopicChangesSize(pid: c_ushort) callconv(.C) c_uint;
    pub const getTopicChangesSize = libtes3mp_GetTopicChangesSize;
    pub extern "libTES3MP-core" fn libtes3mp_AddTopic(pid: c_ushort, topic_id: [*:0]const u8) callconv(.C) void;
    pub const addTopic = libtes3mp_AddTopic;
    pub extern "libTES3MP-core" fn libtes3mp_GetTopicId(pid: c_ushort, index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getTopicId = libtes3mp_GetTopicId;
    pub extern "libTES3MP-core" fn libtes3mp_SendTopicChanges(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendTopicChanges = libtes3mp_SendTopicChanges;

    pub extern "libTES3MP-core" fn libtes3mp_PlayAnimation(pid: c_ushort, group_name: [*:0]const u8, mode: c_int, count: c_int, persist: bool) callconv(.C) void;
    pub const playAnimation = libtes3mp_PlayAnimation;
    pub extern "libTES3MP-core" fn libtes3mp_PlaySpeech(pid: c_ushort, sound: [*:0]const u8) callconv(.C) void;
    pub const playSpeech = libtes3mp_PlaySpeech;
};
