const std = @import("std");

const shared = @import("shared.zig");

pub const InventoryChangesAction = enum(u2) {
    set,
    add,
    remove,
};

pub const EquipmentSlot = @import("actor.zig").EquipmentSlot;

pub fn clearInventoryChanges(pid: u16) callconv(.C) void {
    return raw.clearInventoryChanges(pid);
}

pub fn getEquipmentSize() i32 {
    return raw.getEquipmentSize();
}
pub fn getEquipmentChangesSize(pid: u16) u32 {
    return raw.getEquipmentChangesSize(pid);
}
pub fn getInventoryChangesSize(pid: u16) u32 {
    return raw.getInventoryChangesSize(pid);
}
pub fn getInventoryChangesAction(pid: u16) u32 {
    return raw.getInventoryChangesAction(pid);
}

pub fn setInventoryChangesAction(pid: u16, action: InventoryChangesAction) void {
    return raw.setInventoryChangesAction(pid, @intFromEnum(action));
}

pub fn equipItem(
    pid: u16,
    slot: EquipmentSlot,
    ref_id: [:0]const u8,
    count: u32,
    charge: i32,
    enchantment_charge: f64,
) void {
    return raw.equipItem(pid, @intFromEnum(slot), ref_id, count, charge, enchantment_charge);
}
pub fn unequipItem(pid: u16, slot: EquipmentSlot) void {
    return raw.unequipItem(pid, @intFromEnum(slot));
}

pub fn addItemChange(
    pid: u16,
    ref_id: [:0]const u8,
    count: u32,
    charge: i32,
    enchantment_charge: f64,
    soul: [:0]const u8,
) void {
    return raw.addItemChange(pid, ref_id, count, charge, enchantment_charge, soul);
}

pub fn hasItemEquipped(pid: u16, ref_id: [:0]const u8) bool {
    return raw.hasItemEquipped(pid, ref_id);
}

pub fn getEquipmentChangesSlot(pid: u16, change_index: u32) EquipmentSlot {
    shared.triggerSafetyCheck(getEquipmentChangesSize(pid), change_index);

    return @enumFromInt(raw.getEquipmentChangesSlot(pid, change_index));
}
pub fn getEquipmentItemRefId(pid: u16, slot: EquipmentSlot) [:0]const u8 {
    return std.mem.span(raw.getEquipmentItemRefId(pid, @intFromEnum(slot)).?);
}
pub fn getEquipmentItemCount(pid: u16, slot: EquipmentSlot) i32 {
    return raw.getEquipmentItemCount(pid, @intFromEnum(slot));
}
pub fn getEquipmentItemCharge(pid: u16, slot: EquipmentSlot) i32 {
    return raw.getEquipmentItemCharge(pid, @intFromEnum(slot));
}
pub fn getEquipmentItemEnchantmentCharge(pid: u16, slot: EquipmentSlot) f64 {
    return raw.getEquipmentItemEnchantmentCharge(pid, @intFromEnum(slot));
}

pub fn getInventoryItemRefId(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getInventoryChangesSize(pid), index);

    return std.mem.span(raw.getInventoryItemRefId(pid, index).?);
}
pub fn getInventoryItemCount(pid: u16, index: u32) i32 {
    shared.triggerSafetyCheck(getInventoryChangesSize(pid), index);

    return raw.getInventoryItemCount(pid, index);
}
pub fn getInventoryItemCharge(pid: u16, index: u32) i32 {
    shared.triggerSafetyCheck(getInventoryChangesSize(pid), index);

    return raw.getInventoryItemCharge(pid, index);
}
pub fn getInventoryItemEnchantmentCharge(pid: u16, index: u32) f64 {
    shared.triggerSafetyCheck(getInventoryChangesSize(pid), index);

    return raw.getInventoryItemEnchantmentCharge(pid, index);
}
pub fn getInventoryItemSoul(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getInventoryChangesSize(pid), index);

    return std.mem.span(raw.getInventoryItemSoul(pid, index).?);
}

pub fn getUsedItemRefId(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getUsedItemRefId(pid).?);
}
pub fn getUsedItemCount(pid: u16) i32 {
    return raw.getUsedItemCount(pid);
}
pub fn getUsedItemCharge(pid: u16) i32 {
    return raw.getUsedItemCharge(pid);
}
pub fn getUsedItemEnchantmentCharge(pid: u16) f64 {
    return raw.getUsedItemEnchantmentCharge(pid);
}
pub fn getUsedItemSoul(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getUsedItemSoul(pid).?);
}

pub fn sendEquipment(pid: u16) void {
    return raw.sendEquipment(pid);
}
pub fn sendInventoryChanges(
    pid: u16,
    send_to_other_players: bool,
    skip_attached_player: bool,
) void {
    return raw.sendInventoryChanges(pid, send_to_other_players, skip_attached_player);
}
pub fn sendItemUse(pid: u16) void {
    return raw.sendItemUse(pid);
}

pub const raw = struct {
    extern fn libtes3mp_ClearInventoryChanges(pid: c_ushort) callconv(.C) void;
    pub const clearInventoryChanges = libtes3mp_ClearInventoryChanges;

    extern fn libtes3mp_GetEquipmentSize() callconv(.C) c_int;
    pub const getEquipmentSize = libtes3mp_GetEquipmentSize;
    extern fn libtes3mp_GetEquipmentChangesSize(pid: c_ushort) callconv(.C) c_uint;
    pub const getEquipmentChangesSize = libtes3mp_GetEquipmentChangesSize;
    extern fn libtes3mp_GetInventoryChangesSize(pid: c_ushort) callconv(.C) c_uint;
    pub const getInventoryChangesSize = libtes3mp_GetInventoryChangesSize;
    extern fn libtes3mp_GetInventoryChangesAction(pid: c_ushort) callconv(.C) c_uint;
    pub const getInventoryChangesAction = libtes3mp_GetInventoryChangesAction;

    extern fn libtes3mp_SetInventoryChangesAction(pid: c_ushort, action: u8) callconv(.C) void;
    pub const setInventoryChangesAction = libtes3mp_SetInventoryChangesAction;

    extern fn libtes3mp_EquipItem(pid: c_ushort, slot: c_ushort, ref_id: [*:0]const u8, count: c_uint, charge: c_int, enchantment_charge: f64) callconv(.C) void;
    pub const equipItem = libtes3mp_EquipItem;
    extern fn libtes3mp_UnequipItem(pid: c_ushort, slot: c_ushort) callconv(.C) void;
    pub const unequipItem = libtes3mp_UnequipItem;

    extern fn libtes3mp_AddItemChange(pid: c_ushort, ref_id: [*:0]const u8, count: c_uint, charge: c_int, enchantment_charge: f64, soul: [*:0]const u8) callconv(.C) void;
    pub const addItemChange = libtes3mp_AddItemChange;

    extern fn libtes3mp_HasItemEquipped(pid: c_ushort, ref_id: [*:0]const u8) callconv(.C) bool;
    pub const hasItemEquipped = libtes3mp_HasItemEquipped;

    extern fn libtes3mp_GetEquipmentChangesSlot(pid: c_ushort, change_index: c_uint) callconv(.C) c_int;
    pub const getEquipmentChangesSlot = libtes3mp_GetEquipmentChangesSlot;
    extern fn libtes3mp_GetEquipmentItemRefId(pid: c_ushort, slot: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getEquipmentItemRefId = libtes3mp_GetEquipmentItemRefId;
    extern fn libtes3mp_GetEquipmentItemCount(pid: c_ushort, slot: c_ushort) callconv(.C) c_int;
    pub const getEquipmentItemCount = libtes3mp_GetEquipmentItemCount;
    extern fn libtes3mp_GetEquipmentItemCharge(pid: c_ushort, slot: c_ushort) callconv(.C) c_int;
    pub const getEquipmentItemCharge = libtes3mp_GetEquipmentItemCharge;
    extern fn libtes3mp_GetEquipmentItemEnchantmentCharge(pid: c_ushort, slot: c_ushort) callconv(.C) f64;
    pub const getEquipmentItemEnchantmentCharge = libtes3mp_GetEquipmentItemEnchantmentCharge;

    extern fn libtes3mp_GetInventoryItemRefId(pid: c_ushort, index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getInventoryItemRefId = libtes3mp_GetInventoryItemRefId;
    extern fn libtes3mp_GetInventoryItemCount(pid: c_ushort, index: c_uint) callconv(.C) c_int;
    pub const getInventoryItemCount = libtes3mp_GetInventoryItemCount;
    extern fn libtes3mp_GetInventoryItemCharge(pid: c_ushort, index: c_uint) callconv(.C) c_int;
    pub const getInventoryItemCharge = libtes3mp_GetInventoryItemCharge;
    extern fn libtes3mp_GetInventoryItemEnchantmentCharge(pid: c_ushort, index: c_uint) callconv(.C) f64;
    pub const getInventoryItemEnchantmentCharge = libtes3mp_GetInventoryItemEnchantmentCharge;
    extern fn libtes3mp_GetInventoryItemSoul(pid: c_ushort, index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getInventoryItemSoul = libtes3mp_GetInventoryItemSoul;

    extern fn libtes3mp_GetUsedItemRefId(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getUsedItemRefId = libtes3mp_GetUsedItemRefId;
    extern fn libtes3mp_GetUsedItemCount(pid: c_ushort) callconv(.C) c_int;
    pub const getUsedItemCount = libtes3mp_GetUsedItemCount;
    extern fn libtes3mp_GetUsedItemCharge(pid: c_ushort) callconv(.C) c_int;
    pub const getUsedItemCharge = libtes3mp_GetUsedItemCharge;
    extern fn libtes3mp_GetUsedItemEnchantmentCharge(pid: c_ushort) callconv(.C) f64;
    pub const getUsedItemEnchantmentCharge = libtes3mp_GetUsedItemEnchantmentCharge;
    extern fn libtes3mp_GetUsedItemSoul(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getUsedItemSoul = libtes3mp_GetUsedItemSoul;

    extern fn libtes3mp_SendEquipment(pid: c_ushort) callconv(.C) void;
    pub const sendEquipment = libtes3mp_SendEquipment;
    extern fn libtes3mp_SendInventoryChanges(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendInventoryChanges = libtes3mp_SendInventoryChanges;
    extern fn libtes3mp_SendItemUse(pid: c_ushort) callconv(.C) void;
    pub const sendItemUse = libtes3mp_SendItemUse;
};
