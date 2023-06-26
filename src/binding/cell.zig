const std = @import("std");

pub fn getCellStateChangesSize(pid: c_ushort) c_uint {
    return impl_GetCellStateChangesSize(pid);
}
pub fn getCellStateType(pid: c_ushort, index: c_uint) c_uint {
    std.debug.assert(getCellStateChangesSize(pid) > index);

    return impl_GetCellStateType(pid, index);
}
pub fn getCellStateDescription(pid: c_ushort, index: c_uint) [:0]const u8 {
    std.debug.assert(getCellStateChangesSize(pid) > index);

    return impl_GetCellStateDescription();
}
pub fn getCell(pid: c_ushort) [:0]const u8 {
    return std.mem.span(impl_GetCell(pid).?);
}
pub fn getExteriorX(pid: c_ushort) c_int {
    return impl_GetExteriorX(pid);
}
pub fn getExteriorY(pid: c_ushort) c_int {
    return impl_GetExteriorY(pid);
}
pub fn isInExterior(pid: c_ushort) bool {
    return impl_IsInExterior(pid);
}
pub fn getRegion(pid: c_ushort) [:0]const u8 {
    std.debug.assert(isInExterior(pid));

    return std.mem.span(impl_GetRegion(pid).?);
}
pub fn isChangingRegion(pid: c_ushort) bool {
    std.debug.assert(isInExterior(pid));

    return impl_IsChangingRegion(pid);
}
pub fn setCell(pid: c_ushort, cell_description: [:0]const u8) void {
    return impl_SetCell(pid, cell_description);
}
pub fn setExteriorCell(pid: c_ushort, x: c_int, y: c_int) void {
    return impl_SetExteriorCell(pid, x, y);
}
pub fn sendCell(pid: c_ushort) void {
    return impl_SendCell(pid);
}

extern "libTES3MP-core" fn impl_GetCellStateChangesSize(c_ushort) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetCellStateType(c_ushort, c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetCellStateDescription(c_ushort, c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetCell(c_ushort) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_SetCell(c_ushort, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendCell(c_ushort) callconv(.C) void;
extern "libTES3MP-core" fn impl_GetExteriorX(c_ushort) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetExteriorY(c_ushort) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_SetExteriorCell(c_ushort, c_int, c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_IsInExterior(c_ushort) callconv(.C) bool;
extern "libTES3MP-core" fn impl_GetRegion(c_ushort) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_IsChangingRegion(c_ushort) callconv(.C) bool;
