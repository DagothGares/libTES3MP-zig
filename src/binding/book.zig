//! Bindings to libTES3MP-core's book functions.
const std = @import("std");

const shared = @import("shared.zig");

pub fn clearBookChanges(pid: u16) void {
    return raw.clearBookChanges(pid);
}
pub fn getBookChangesSize(pid: u16) c_uint {
    return raw.getBookChangesSize(pid);
}
pub fn addBook(pid: u16, book_id: [:0]const u8) void {
    return raw.addBook(pid, book_id);
}
pub fn getBookId(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getBookChangesSize(pid), index);

    return std.mem.span(raw.getBookId(pid, index).?);
}
pub fn sendBookChanges(
    pid: u16,
    send_to_other_players: bool,
    skip_attached_player: bool,
) void {
    return raw.sendBookChanges(pid, send_to_other_players, skip_attached_player);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_ClearBookChanges(pid: c_ushort) callconv(.C) void;
    pub const clearBookChanges = libtes3mp_ClearBookChanges;
    extern "libTES3MP-core" fn libtes3mp_GetBookChangesSize(pid: c_ushort) callconv(.C) c_uint;
    pub const getBookChangesSize = libtes3mp_GetBookChangesSize;
    extern "libTES3MP-core" fn libtes3mp_AddBook(
        pid: c_ushort,
        book_id: [*:0]const u8,
    ) callconv(.C) void;
    pub const addBook = libtes3mp_AddBook;
    extern "libTES3MP-core" fn libtes3mp_GetBookId(
        pid: c_ushort,
        index: c_uint,
    ) callconv(.C) ?[*:0]const u8;
    pub const getBookId = libtes3mp_GetBookId;
    extern "libTES3MP-core" fn libtes3mp_SendBookChanges(
        pid: c_ushort,
        send_to_other_players: bool,
        skip_attached_player: bool,
    ) callconv(.C) void;
    pub const sendBookChanges = libtes3mp_SendBookChanges;
};
