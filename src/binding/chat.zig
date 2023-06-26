pub fn sendMessage(
    pid: c_ushort,
    message: [:0]const u8,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    return impl_SendMessage(pid, message, for_everyone, skip_attached_player);
}

pub fn cleanChatForPid(pid: c_ushort) void {
    return impl_CleanChatForPid(pid);
}

pub fn cleanChat() void {
    return impl_CleanChat();
}

extern "libTES3MP-core" fn impl_SendMessage(c_ushort, [*:0]const u8, bool, bool) void;
extern "libTES3MP-core" fn impl_CleanChatForPid(c_ushort) void;
extern "libTES3MP-core" fn impl_CleanChat() void;
