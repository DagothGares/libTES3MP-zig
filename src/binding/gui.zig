const std = @import("std");

const shared = @import("shared.zig");

pub const QuickKeyType = enum(u2) {
    item,
    item_magic,
    magic,
    unassigned,
};

pub fn messageBox(pid: u16, id: i32, label: [:0]const u8) void {
    return raw.messageBox(pid, id, label);
}
pub fn customMessageBox(pid: u16, id: i32, label: [:0]const u8, buttons: [:0]const u8) void {
    return raw.customMessageBox(pid, id, label, buttons);
}
pub fn inputDialog(pid: u16, id: i32, label: [:0]const u8, note: [:0]const u8) void {
    return raw.inputDialog(pid, id, label, note);
}
pub fn passwordDialog(pid: u16, id: i32, label: [:0]const u8, note: [:0]const u8) void {
    return raw.passwordDialog(pid, id, label, note);
}
pub fn listBox(pid: u16, id: i32, label: [:0]const u8, items: [:0]const u8) void {
    return raw.listBox(pid, id, label, items);
}

pub fn clearQuickKeyChanges(pid: u16) void {
    return raw.clearQuickKeyChanges(pid);
}

pub fn getQuickKeyChangesSize(pid: u16) u32 {
    return raw.getQuickKeyChangesSize(pid);
}

pub fn getQuickKeySlot(pid: u16, index: u32) u32 {
    shared.triggerSafetyCheck(getQuickKeyChangesSize(pid), index);

    return @intCast(raw.getQuickKeySlot(pid, index));
}
pub fn getQuickKeyType(pid: u16, index: u32) QuickKeyType {
    shared.triggerSafetyCheck(getQuickKeyChangesSize(pid), index);

    return @enumFromInt(raw.getQuickKeyType(pid, index));
}
pub fn getQuickKeyItemId(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getQuickKeyChangesSize(pid), index);

    return std.mem.span(raw.getQuickKeyItemId(pid, index).?);
}

pub fn addQuickKey(pid: u16, slot: u16, key_type: QuickKeyType, itemId: [:0]const u8) void {
    return raw.addQuickKey(pid, slot, @intFromEnum(key_type), itemId);
}

pub fn sendQuickKeyChanges(pid: u16) void {
    return raw.sendQuickKeyChanges(pid);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_MessageBox(pid: c_ushort, id: c_int, label: [*:0]const u8) callconv(.C) void;
    pub const messageBox = libtes3mp_MessageBox;
    extern "libTES3MP-core" fn libtes3mp_CustomMessageBox(pid: c_ushort, id: c_int, label: [*:0]const u8, buttons: [*:0]const u8) callconv(.C) void;
    pub const customMessageBox = libtes3mp_CustomMessageBox;
    extern "libTES3MP-core" fn libtes3mp_InputDialog(pid: c_ushort, id: c_int, label: [*:0]const u8, note: [*:0]const u8) callconv(.C) void;
    pub const inputDialog = libtes3mp_InputDialog;
    extern "libTES3MP-core" fn libtes3mp_PasswordDialog(pid: c_ushort, id: c_int, label: [*:0]const u8, note: [*:0]const u8) callconv(.C) void;
    pub const passwordDialog = libtes3mp_PasswordDialog;
    extern "libTES3MP-core" fn libtes3mp_ListBox(pid: c_ushort, id: c_int, label: [*:0]const u8, items: [*:0]const u8) callconv(.C) void;
    pub const listBox = libtes3mp_ListBox;

    extern "libTES3MP-core" fn libtes3mp_ClearQuickKeyChanges(pid: c_ushort) callconv(.C) void;
    pub const clearQuickKeyChanges = libtes3mp_ClearQuickKeyChanges;

    extern "libTES3MP-core" fn libtes3mp_GetQuickKeyChangesSize(pid: c_ushort) callconv(.C) c_uint;
    pub const getQuickKeyChangesSize = libtes3mp_GetQuickKeyChangesSize;

    extern "libTES3MP-core" fn libtes3mp_GetQuickKeySlot(pid: c_ushort, index: c_uint) callconv(.C) c_int;
    pub const getQuickKeySlot = libtes3mp_GetQuickKeySlot;
    extern "libTES3MP-core" fn libtes3mp_GetQuickKeyType(pid: c_ushort, index: c_uint) callconv(.C) c_int;
    pub const getQuickKeyType = libtes3mp_GetQuickKeyType;
    extern "libTES3MP-core" fn libtes3mp_GetQuickKeyItemId(pid: c_ushort, index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getQuickKeyItemId = libtes3mp_GetQuickKeyItemId;

    extern "libTES3MP-core" fn libtes3mp_AddQuickKey(pid: c_ushort, slot: c_ushort, key_type: c_int, itemId: [*:0]const u8) callconv(.C) void;
    pub const addQuickKey = libtes3mp_AddQuickKey;

    extern "libTES3MP-core" fn libtes3mp_SendQuickKeyChanges(pid: c_ushort) callconv(.C) void;
    pub const sendQuickKeyChanges = libtes3mp_SendQuickKeyChanges;
};
