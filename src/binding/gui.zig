const std = @import("std");

pub fn messageBox(pid: c_ushort, gui_id: c_int, label: [:0]const u8) void {
    return impl_MessageBox(pid, gui_id, label);
}
pub fn customMessageBox(pid: c_ushort, gui_id: c_int, label: [:0]const u8, buttons: [:0]const u8) void {
    return impl_CustomMessageBox(pid, gui_id, label, buttons);
}
pub fn inputDialog(pid: c_ushort, gui_id: c_int, label: [:0]const u8, note: [:0]const u8) void {
    return impl_InputDialog(pid, gui_id, label, note);
}
pub fn passwordDialog(pid: c_ushort, gui_id: c_int, label: [:0]const u8, note: [:0]const u8) void {
    return impl_PasswordDialog(pid, gui_id, label, note);
}
pub fn listBox(pid: c_ushort, gui_id: c_int, label: [:0]const u8, items: [:0]const u8) void {
    return impl_ListBox(pid, gui_id, label, items);
}
pub fn clearQuickKeyChanges(pid: c_ushort) void {
    return impl_ClearQuickKeyChanges(pid);
}
pub fn getQuickKeyChangesSize(pid: c_ushort) c_uint {
    return impl_GetQuickKeyChangesSize(pid);
}
pub fn addQuickKey(pid: c_ushort, slot: c_ushort, quick_key_type: c_int, item_id: [:0]const u8) void {
    return impl_AddQuickKey(pid, slot, quick_key_type, item_id);
}
pub fn getQuickKeySlot(pid: c_ushort, index: c_uint) c_int {
    std.debug.assert(getQuickKeyChangesSize(pid) > index);

    return impl_GetQuickKeySlot(pid, index);
}
pub fn getQuickKeyType(pid: c_ushort, index: c_uint) c_int {
    std.debug.assert(getQuickKeyChangesSize(pid) > index);

    return impl_GetQuickKeyType(pid, index);
}
pub fn getQuickKeyItemId(pid: c_ushort, index: c_uint) callconv(.C) u8 {
    std.debug.assert(getQuickKeyChangesSize(pid) > index);

    return impl_GetQuickKeyItemId(pid, index);
}
pub fn sendQuickKeyChanges(pid: c_ushort) void {
    return impl_SendQuickKeyChanges(pid);
}

extern "libTES3MP-core" fn impl_MessageBox(c_ushort, c_int, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_CustomMessageBox(c_ushort, c_int, [*:0]const u8, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_InputDialog(c_ushort, c_int, [*:0]const u8, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_PasswordDialog(c_ushort, c_int, [*:0]const u8, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_ListBox(c_ushort, c_int, [*:0]const u8, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_ClearQuickKeyChanges(c_ushort) callconv(.C) void;
extern "libTES3MP-core" fn impl_GetQuickKeyChangesSize(c_ushort) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_AddQuickKey(c_ushort, c_ushort, c_int, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_GetQuickKeySlot(c_ushort, c_uint) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetQuickKeyType(c_ushort, c_uint) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetQuickKeyItemId(c_ushort, c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_SendQuickKeyChanges(c_ushort) callconv(.C) void;
