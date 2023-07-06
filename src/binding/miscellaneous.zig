const std = @import("std");

// GenerateRandomString and GetSHA256Hash are not included, since std.rand and std.crypto offer
// better alternatives.

pub fn getLastPlayerId() u32 {
    return raw.getLastPlayerId();
}

pub fn getCurrentMpNum() i32 {
    return raw.getCurrentMpNum();
}

pub fn setCurrentMpNum(mp_num: i32) void {
    return raw.setCurrentMpNum(mp_num);
}

pub const raw = struct {
    extern fn libtes3mp_GetLastPlayerId() callconv(.C) c_uint;
    pub const getLastPlayerId = libtes3mp_GetLastPlayerId;

    extern fn libtes3mp_GetCurrentMpNum() callconv(.C) c_int;
    pub const getCurrentMpNum = libtes3mp_GetCurrentMpNum;
    extern fn libtes3mp_SetCurrentMpNum(mp_num: c_int) callconv(.C) void;
    pub const setCurrentMpNum = libtes3mp_SetCurrentMpNum;
};
