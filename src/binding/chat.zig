pub fn sendMessage(
    pid: u16,
    message: [:0]const u8,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    return raw.sendMessage(pid, message, for_everyone, skip_attached_player);
}

pub fn cleanChatForPid(pid: u16) void {
    return raw.cleanChatForPid(pid);
}

pub fn cleanChat() void {
    return raw.cleanChat();
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_SendMessage(
        pid: c_ushort,
        message: [*:0]const u8,
        for_everyone: bool,
        skip_attached_player: bool,
    ) void;
    pub const sendMessage = libtes3mp_SendMessage;
    extern "libTES3MP-core" fn libtes3mp_CleanChatForPid(pid: c_ushort) void;
    pub const cleanChatForPid = libtes3mp_CleanChatForPid;
    extern "libTES3MP-core" fn libtes3mp_CleanChat() void;
    pub const cleanChat = libtes3mp_CleanChat;
};
