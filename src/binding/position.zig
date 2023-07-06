const std = @import("std");

pub fn getPosX(pid: u16) f64 {
    return raw.getPosX(pid);
}
pub fn getPosY(pid: u16) f64 {
    return raw.getPosY(pid);
}
pub fn getPosZ(pid: u16) f64 {
    return raw.getPosZ(pid);
}

pub fn getPreviousCellPosX(pid: u16) f64 {
    return raw.getPreviousCellPosX(pid);
}
pub fn getPreviousCellPosY(pid: u16) f64 {
    return raw.getPreviousCellPosY(pid);
}
pub fn getPreviousCellPosZ(pid: u16) f64 {
    return raw.getPreviousCellPosZ(pid);
}

pub fn getRotX(pid: u16) f64 {
    return raw.getRotX(pid);
}
pub fn getRotZ(pid: u16) f64 {
    return raw.getRotZ(pid);
}

pub fn setPos(pid: u16, x: f64, y: f64, z: f64) void {
    return raw.setPos(pid, x, y, z);
}
pub fn setRot(pid: u16, x: f64, z: f64) void {
    return raw.setRot(pid, x, z);
}
pub fn setMomentum(pid: u16, x: f64, y: f64, z: f64) void {
    return raw.setMomentum(pid, x, y, z);
}

pub fn sendPos(pid: u16) void {
    return raw.sendPos(pid);
}
pub fn sendMomentum(pid: u16) void {
    return raw.sendMomentum(pid);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_GetPosX(pid: c_ushort) callconv(.C) f64;
    pub const getPosX = libtes3mp_GetPosX;
    extern "libTES3MP-core" fn libtes3mp_GetPosY(pid: c_ushort) callconv(.C) f64;
    pub const getPosY = libtes3mp_GetPosY;
    extern "libTES3MP-core" fn libtes3mp_GetPosZ(pid: c_ushort) callconv(.C) f64;
    pub const getPosZ = libtes3mp_GetPosZ;

    extern "libTES3MP-core" fn libtes3mp_GetPreviousCellPosX(pid: c_ushort) callconv(.C) f64;
    pub const getPreviousCellPosX = libtes3mp_GetPreviousCellPosX;
    extern "libTES3MP-core" fn libtes3mp_GetPreviousCellPosY(pid: c_ushort) callconv(.C) f64;
    pub const getPreviousCellPosY = libtes3mp_GetPreviousCellPosY;
    extern "libTES3MP-core" fn libtes3mp_GetPreviousCellPosZ(pid: c_ushort) callconv(.C) f64;
    pub const getPreviousCellPosZ = libtes3mp_GetPreviousCellPosZ;

    extern "libTES3MP-core" fn libtes3mp_GetRotX(pid: c_ushort) callconv(.C) f64;
    pub const getRotX = libtes3mp_GetRotX;
    extern "libTES3MP-core" fn libtes3mp_GetRotZ(pid: c_ushort) callconv(.C) f64;
    pub const getRotZ = libtes3mp_GetRotZ;

    extern "libTES3MP-core" fn libtes3mp_SetPos(pid: c_ushort, x: f64, y: f64, z: f64) callconv(.C) void;
    pub const setPos = libtes3mp_SetPos;
    extern "libTES3MP-core" fn libtes3mp_SetRot(pid: c_ushort, x: f64, z: f64) callconv(.C) void;
    pub const setRot = libtes3mp_SetRot;
    extern "libTES3MP-core" fn libtes3mp_SetMomentum(pid: c_ushort, x: f64, y: f64, z: f64) callconv(.C) void;
    pub const setMomentum = libtes3mp_SetMomentum;

    extern "libTES3MP-core" fn libtes3mp_SendPos(pid: c_ushort) callconv(.C) void;
    pub const sendPos = libtes3mp_SendPos;
    extern "libTES3MP-core" fn libtes3mp_SendMomentum(pid: c_ushort) callconv(.C) void;
    pub const sendMomentum = libtes3mp_SendMomentum;
};
