const std = @import("std");

const shared = @import("shared.zig");

pub const Specialization = enum(u2) {
    combat,
    magic,
    stealth,
};

pub const Attribute = enum(u4) {
    strength,
    intelligence,
    willpower,
    agility,
    speed,
    endurance,
    personality,
    luck,
};

pub const Skill = enum(u5) {
    // Combat
    block,
    armorer,
    medium_armor,
    heavy_armor,
    blunt_weapon,
    long_blade,
    axe,
    spear,
    athletics,
    // Magic
    enchant,
    destruction,
    alteration,
    illusion,
    conjuration,
    mysticism,
    restoration,
    alchemy,
    unarmored,
    // Stealth
    security,
    sneak,
    acrobatics,
    light_armor,
    short_blade,
    marksman,
    mercantile,
    speechcraft,
    hand_to_hand,
};

pub fn getDefaultClass(pid: u16) [:0]const u8 {
    std.debug.assert(isClassDefault(pid));

    return std.mem.span(raw.getDefaultClass(pid).?);
}
pub fn getClassName(pid: u16) [:0]const u8 {
    std.debug.assert(!isClassDefault(pid));

    return std.mem.span(raw.getClassName(pid).?);
}
pub fn getClassDesc(pid: u16) [:0]const u8 {
    std.debug.assert(!isClassDefault(pid));

    return std.mem.span(raw.getClassDesc(pid).?);
}
pub fn getClassMajorAttribute(pid: u16, slot: u1) Attribute {
    std.debug.assert(!isClassDefault(pid));

    return @enumFromInt(raw.getClassMajorAttribute(pid, slot));
}
pub fn getClassSpecialization(pid: u16) Specialization {
    std.debug.assert(!isClassDefault(pid));

    return @enumFromInt(raw.getClassSpecialization(pid));
}
pub fn getClassMajorSkill(pid: u16, slot: u3) Skill {
    std.debug.assert(!isClassDefault(pid));

    return @enumFromInt(raw.getClassMajorSkill(pid, slot));
}
pub fn getClassMinorSkill(pid: u16, slot: u3) Skill {
    std.debug.assert(!isClassDefault(pid));

    return @enumFromInt(raw.getClassMinorSkill(pid, slot));
}
pub fn isClassDefault(pid: u16) bool {
    return raw.isClassDefault(pid) != 0;
}

pub fn setDefaultClass(pid: u16, id: [:0]const u8) void {
    return raw.setDefaultClass(pid, id);
}
pub fn setClassName(pid: u16, name: [:0]const u8) void {
    return raw.setClassName(pid, name);
}
pub fn setClassDesc(pid: u16, desc: [:0]const u8) void {
    return raw.setClassDesc(pid, desc);
}
pub fn setClassMajorAttribute(pid: u16, slot: u1, attribute: Attribute) void {
    return raw.setClassMajorAttribute(pid, slot, @intFromEnum(attribute));
}
pub fn setClassSpecialization(pid: u16, spec: Specialization) void {
    return raw.setClassSpecialization(pid, @intFromEnum(spec));
}
pub fn setClassMajorSkill(pid: u16, slot: u3, skill: Skill) void {
    shared.triggerSafetyCheck(5, slot);

    return raw.setClassMajorSkill(pid, slot, @intFromEnum(skill));
}
pub fn setClassMinorSkill(pid: u16, slot: u3, skill: Skill) void {
    shared.triggerSafetyCheck(5, slot);

    return raw.setClassMinorSkill(pid, slot, @intFromEnum(skill));
}

pub fn sendClass(pid: u16) void {
    return raw.sendClass(pid);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_GetDefaultClass(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getDefaultClass = libtes3mp_GetDefaultClass;
    extern "libTES3MP-core" fn libtes3mp_GetClassName(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getClassName = libtes3mp_GetClassName;
    extern "libTES3MP-core" fn libtes3mp_GetClassDesc(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getClassDesc = libtes3mp_GetClassDesc;
    extern "libTES3MP-core" fn libtes3mp_GetClassMajorAttribute(pid: c_ushort, slot: u8) callconv(.C) c_int;
    pub const getClassMajorAttribute = libtes3mp_GetClassMajorAttribute;
    extern "libTES3MP-core" fn libtes3mp_GetClassSpecialization(pid: c_ushort) callconv(.C) c_int;
    pub const getClassSpecialization = libtes3mp_GetClassSpecialization;
    extern "libTES3MP-core" fn libtes3mp_GetClassMajorSkill(pid: c_ushort, slot: u8) callconv(.C) c_int;
    pub const getClassMajorSkill = libtes3mp_GetClassMajorSkill;
    extern "libTES3MP-core" fn libtes3mp_GetClassMinorSkill(pid: c_ushort, slot: u8) callconv(.C) c_int;
    pub const getClassMinorSkill = libtes3mp_GetClassMinorSkill;
    extern "libTES3MP-core" fn libtes3mp_IsClassDefault(pid: c_ushort) callconv(.C) c_int;
    pub const isClassDefault = libtes3mp_IsClassDefault;

    extern "libTES3MP-core" fn libtes3mp_SetDefaultClass(pid: c_ushort, id: [*:0]const u8) callconv(.C) void;
    pub const setDefaultClass = libtes3mp_SetDefaultClass;
    extern "libTES3MP-core" fn libtes3mp_SetClassName(pid: c_ushort, name: [*:0]const u8) callconv(.C) void;
    pub const setClassName = libtes3mp_SetClassName;
    extern "libTES3MP-core" fn libtes3mp_SetClassDesc(pid: c_ushort, desc: [*:0]const u8) callconv(.C) void;
    pub const setClassDesc = libtes3mp_SetClassDesc;
    extern "libTES3MP-core" fn libtes3mp_SetClassMajorAttribute(pid: c_ushort, slot: u8, attr_id: c_int) callconv(.C) void;
    pub const setClassMajorAttribute = libtes3mp_SetClassMajorAttribute;
    extern "libTES3MP-core" fn libtes3mp_SetClassSpecialization(pid: c_ushort, spec: c_int) callconv(.C) void;
    pub const setClassSpecialization = libtes3mp_SetClassSpecialization;
    extern "libTES3MP-core" fn libtes3mp_SetClassMajorSkill(pid: c_ushort, slot: u8, skill_id: c_int) callconv(.C) void;
    pub const setClassMajorSkill = libtes3mp_SetClassMajorSkill;
    extern "libTES3MP-core" fn libtes3mp_SetClassMinorSkill(pid: c_ushort, slot: u8, skill_id: c_int) callconv(.C) void;
    pub const setClassMinorSkill = libtes3mp_SetClassMinorSkill;

    extern "libTES3MP-core" fn libtes3mp_SendClass(pid: c_ushort) callconv(.C) void;
    pub const sendClass = libtes3mp_SendClass;
};
