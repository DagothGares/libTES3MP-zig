//! Bindings to libTES3MP-core's book functions.
const std = @import("std");

pub fn clearBookChanges(pid: c_ushort) void {
    return impl_ClearBookChanges(pid);
}
pub fn getBookChangesSize(pid: c_ushort) c_uint {
    return impl_GetBookChangesSize(pid);
}
pub fn addBook(pid: c_ushort, bookId: [:0]const u8) void {
    return impl_AddBook(pid, bookId);
}
/// TES3MP owns the value returned by this function. Copy the contents if you wish to keep it
/// after your initial callback returns.
pub fn getBookId(pid: c_ushort, index: c_uint) [:0]const u8 {
    std.debug.assert(impl_GetBookChangesSize(pid) > index);

    return std.mem.span(impl_GetBookId(pid, index).?);
}
pub fn sendBookChanges(pid: c_ushort, for_everyone: bool, skip_attached_player: bool) void {
    return impl_SendBookChanges(pid, for_everyone, skip_attached_player);
}

extern "libTES3MP-core" fn impl_ClearBookChanges(c_ushort) callconv(.C) void;
extern "libTES3MP-core" fn impl_GetBookChangesSize(c_ushort) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_AddBook(c_ushort, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_GetBookId(c_ushort, c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_SendBookChanges(c_ushort, bool, bool) callconv(.C) void;
