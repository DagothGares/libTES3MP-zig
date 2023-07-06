const std = @import("std");

const shared = @import("shared.zig");

pub const CellState = enum(u1) {
    load,
    unload,
};

pub fn getCellStateChangesSize(pid: u16) c_uint {
    return raw.getCellStateChangesSize(pid);
}
pub fn getCellStateType(pid: u16, index: u32) CellState {
    shared.triggerSafetyCheck(getCellStateChangesSize(pid), index);

    return @enumFromInt(raw.getCellStateType(pid, index));
}
pub fn getCellStateDescription(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getCellStateChangesSize(pid), index);

    return std.mem.span(raw.getCellStateDescription(pid, index).?);
}
pub fn getCell(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getCell(pid).?);
}
pub fn getExteriorX(pid: u16) c_int {
    return raw.getExteriorX(pid);
}
pub fn getExteriorY(pid: u16) c_int {
    return raw.getExteriorY(pid);
}
pub fn isInExterior(pid: u16) bool {
    return raw.isInExterior(pid);
}
pub fn getRegion(pid: u16) ?[:0]const u8 {
    if (isInExterior(pid))
        return std.mem.span(raw.getRegion(pid).?)
    else
        return null;
}
pub fn isChangingRegion(pid: u16) bool {
    return raw.isChangingRegion(pid);
}
pub fn setCell(pid: u16, cell_description: [:0]const u8) void {
    return raw.setCell(pid, cell_description);
}
pub fn setExteriorCell(pid: u16, x: i32, y: i32) void {
    return raw.setExteriorCell(pid, x, y);
}
pub fn sendCell(pid: u16) void {
    return raw.sendCell(pid);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_GetCellStateChangesSize(pid: c_ushort) callconv(.C) c_uint;
    pub const getCellStateChangesSize = libtes3mp_GetCellStateChangesSize;

    extern "libTES3MP-core" fn libtes3mp_GetCellStateType(
        pid: c_ushort,
        index: c_uint,
    ) callconv(.C) c_uint;
    pub const getCellStateType = libtes3mp_GetCellStateType;
    extern "libTES3MP-core" fn libtes3mp_GetCellStateDescription(
        pid: c_ushort,
        index: c_uint,
    ) callconv(.C) ?[*:0]const u8;
    pub const getCellStateDescription = libtes3mp_GetCellStateDescription;

    extern "libTES3MP-core" fn libtes3mp_GetCell(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getCell = libtes3mp_GetCell;
    extern "libTES3MP-core" fn libtes3mp_GetExteriorX(pid: c_ushort) callconv(.C) c_int;
    pub const getExteriorX = libtes3mp_GetExteriorX;
    extern "libTES3MP-core" fn libtes3mp_GetExteriorY(pid: c_ushort) callconv(.C) c_int;
    pub const getExteriorY = libtes3mp_GetExteriorY;
    extern "libTES3MP-core" fn libtes3mp_IsInExterior(pid: c_ushort) callconv(.C) bool;
    pub const isInExterior = libtes3mp_IsInExterior;

    extern "libTES3MP-core" fn libtes3mp_GetRegion(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getRegion = libtes3mp_GetRegion;
    extern "libTES3MP-core" fn libtes3mp_IsChangingRegion(pid: c_ushort) callconv(.C) bool;
    pub const isChangingRegion = libtes3mp_IsChangingRegion;

    extern "libTES3MP-core" fn libtes3mp_SetCell(
        pid: c_ushort,
        cell_description: [*:0]const u8,
    ) callconv(.C) void;
    pub const setCell = libtes3mp_SetCell;
    extern "libTES3MP-core" fn libtes3mp_SetExteriorCell(
        pid: c_ushort,
        x: c_int,
        y: c_int,
    ) callconv(.C) void;
    pub const setExteriorCell = libtes3mp_SetExteriorCell;

    extern "libTES3MP-core" fn libtes3mp_SendCell(pid: c_ushort) callconv(.C) void;
    pub const sendCell = libtes3mp_SendCell;
};
