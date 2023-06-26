const std = @import("std");

pub fn clearTopicChanges(pid: c_ushort) void {
    return impl_ClearTopicChanges(pid);
}
pub fn getTopicChangesSize(pid: c_ushort) c_uint {
    return impl_GetTopicChangesSize(pid);
}
pub fn addTopic(pid: c_ushort, topic_id: [:0]const u8) void {
    return impl_AddTopic(pid, topic_id);
}
pub fn getTopicId(pid: c_ushort, index: c_uint) [:0]const u8 {
    std.debug.assert(getTopicChangesSize(pid) > index);

    return std.mem.span(impl_GetTopicId(pid).?);
}
pub fn sendTopicChanges(pid: c_ushort, for_everyone: bool, skip_attached_player: bool) void {
    return impl_SendTopicChanges(pid, for_everyone, skip_attached_player);
}

extern "libTES3MP-core" fn impl_ClearTopicChanges(c_ushort) void;
extern "libTES3MP-core" fn impl_GetTopicChangesSize(c_ushort) c_uint;
extern "libTES3MP-core" fn impl_AddTopic(c_ushort, [*:0]const u8) void;
extern "libTES3MP-core" fn impl_GetTopicId(c_ushort, c_uint) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_SendTopicChanges(c_ushort, bool, bool) void;
