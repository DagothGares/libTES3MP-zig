const std = @import("std");

pub const FactionChangeAction = enum(u2) {
    Rank,
    Expulsion,
    Reputation,
};

pub fn clearFactionChanges(pid: c_ushort) void {
    return impl_ClearFactionChanges(pid);
}
pub fn getFactionChangesSize(pid: c_ushort) c_uint {
    return impl_GetFactionChangesSize(pid);
}
pub fn getFactionChangesAction(pid: c_ushort) FactionChangeAction {
    return @enumFromInt(FactionChangeAction, impl_GetFactionChangesAction(pid));
}
pub fn getFactionId(pid: c_ushort, index: c_uint) [:0]const u8 {
    std.debug.assert(getFactionChangesSize(pid) > index);

    return std.mem.span(impl_GetFactionId(pid, index).?);
}
pub fn getFactionRank(pid: c_ushort, index: c_uint) c_int {
    std.debug.assert(getFactionChangesSize(pid) > index);

    return impl_GetFactionRank(pid, index);
}
pub fn getFactionExpulsionState(pid: c_ushort, index: c_uint) bool {
    std.debug.assert(getFactionChangesSize(pid) > index);

    return impl_GetFactionExpulsionState(pid, index);
}
pub fn getFactionReputation(pid: c_ushort, index: c_uint) c_int {
    std.debug.assert(getFactionChangesSize(pid) > index);

    return impl_GetFactionReputation(pid, index);
}
pub fn setFactionChangesAction(pid: c_ushort, action: FactionChangeAction) void {
    return impl_SetFactionChangesAction(pid, @intFromEnum(action));
}
pub fn setFactionId(faction_id: [:0]const u8) void {
    return impl_SetFactionId(faction_id);
}
pub fn setFactionRank(rank: c_uint) void {
    return impl_SetFactionRank(rank);
}
pub fn setFactionExpulsionState(expulsion_state: bool) void {
    return impl_SetFactionExpulsionState(expulsion_state);
}
pub fn setFactionReputation(reputation: c_int) void {
    return impl_SetFactionReputation(reputation);
}
pub fn addFaction(pid: c_ushort) void {
    return impl_AddFaction(pid);
}
pub fn sendFactionChanges(pid: c_ushort, for_everyone: bool, skip_attached_player: bool) void {
    return impl_SendFactionChanges(pid, for_everyone, skip_attached_player);
}

extern "libTES3MP-core" fn impl_ClearFactionChanges(c_ushort) void;
extern "libTES3MP-core" fn impl_GetFactionChangesSize(c_ushort) c_uint;
extern "libTES3MP-core" fn impl_GetFactionChangesAction(c_ushort) u8;
extern "libTES3MP-core" fn impl_GetFactionId(c_ushort, c_uint) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetFactionRank(c_ushort, c_uint) c_int;
extern "libTES3MP-core" fn impl_GetFactionExpulsionState(c_ushort, c_uint) bool;
extern "libTES3MP-core" fn impl_GetFactionReputation(c_ushort, c_uint) c_int;
extern "libTES3MP-core" fn impl_SetFactionChangesAction(c_ushort, u8) void;
extern "libTES3MP-core" fn impl_SetFactionId([*:0]const u8) void;
extern "libTES3MP-core" fn impl_SetFactionRank(c_uint) void;
extern "libTES3MP-core" fn impl_SetFactionExpulsionState(bool) void;
extern "libTES3MP-core" fn impl_SetFactionReputation(c_int) void;
extern "libTES3MP-core" fn impl_AddFaction(c_ushort) void;
extern "libTES3MP-core" fn impl_SendFactionChanges(c_ushort, bool, bool) void;
