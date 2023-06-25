const std = @import("std");

pub const Specialization = enum(u2) {
    Combat,
    Magic,
    Stealth,
};

pub const Attribute = enum(u4) {
    Strength,
    Intelligence,
    Willpower,
    Agility,
    Speed,
    Endurance,
    Personality,
    Luck,
};

pub const Skill = enum(u5) {
    // Combat
    Block,
    Armorer,
    MediumArmor,
    HeavyArmor,
    BluntWeapon,
    LongBlade,
    Axe,
    Spear,
    Athletics,
    // Magic
    Enchant,
    Destruction,
    Alteration,
    Illusion,
    Conjuration,
    Mysticism,
    Restoration,
    Alchemy,
    Unarmored,
    // Stealth
    Security,
    Sneak,
    Acrobatics,
    LightArmor,
    ShortBlade,
    Marksman,
    Mercantile,
    Speechcraft,
    HandToHand,
};

/// TES3MP owns the value returned by this function. Copy the contents if you wish to keep it
/// after your initial callback returns.
pub fn getDefaultClass(pid: c_ushort) [:0]const u8 {
    std.debug.assert(isClassDefault(pid));

    return std.mem.span(impl_GetDefaultClass(pid).?);
}
/// TES3MP owns the value returned by this function. Copy the contents if you wish to keep it
/// after your initial callback returns.
pub fn getClassName(pid: c_ushort) [:0]const u8 {
    std.debug.assert(!isClassDefault(pid));

    return std.mem.span(impl_GetClassName(pid).?);
}
/// TES3MP owns the value returned by this function. Copy the contents if you wish to keep it
/// after your initial callback returns.
pub fn getClassDesc(pid: c_ushort) [:0]const u8 {
    std.debug.assert(!isClassDefault(pid));

    return std.mem.span(impl_GetClassDesc(pid).?);
}
pub fn getClassMajorAttribute(pid: c_ushort, slot: u1) Attribute {
    std.debug.assert(!isClassDefault(pid));

    return @enumFromInt(Attribute, impl_GetClassMajorAttribute(pid, slot));
}
pub fn getClassSpecialization(pid: c_ushort) Specialization {
    std.debug.assert(!isClassDefault(pid));

    return @enumFromInt(Specialization, impl_GetClassSpecialization(pid));
}
pub fn getClassMajorSkill(pid: c_ushort, slot: u3) Skill {
    std.debug.assert(!isClassDefault(pid));

    return @enumFromInt(Skill, impl_GetClassMajorSkill(pid, slot));
}
pub fn getClassMinorSkill(pid: c_ushort, slot: u3) Skill {
    std.debug.assert(!isClassDefault(pid));

    return @enumFromInt(Skill, impl_GetClassMinorSkill(pid, slot));
}
pub fn isClassDefault(pid: c_ushort) bool {
    return impl_IsClassDefault(pid) != 0;
}

pub fn setDefaultClass(pid: c_ushort, class_id: [:0]const u8) void {
    return impl_SetDefaultClass(pid, class_id);
}
pub fn setClassName(pid: c_ushort, name: [:0]const u8) void {
    return impl_SetClassName(pid, name);
}
pub fn setClassDesc(pid: c_ushort, description: [:0]const u8) void {
    return impl_SetClassDesc(pid, description);
}
pub fn setClassMajorAttribute(pid: c_ushort, slot: u1, attribute: Attribute) void {
    return impl_SetClassMajorAttribute(pid, slot, @intFromEnum(attribute));
}
pub fn setClassSpecialization(pid: c_ushort, specialization: Specialization) void {
    return impl_SetClassSpecialization(pid, @intFromEnum(specialization));
}
pub fn setClassMajorSkill(pid: c_ushort, slot: u3, skill: Skill) void {
    return impl_SetClassMajorSkill(pid, slot, @intFromEnum(skill));
}
pub fn setClassMinorSkill(pid: c_ushort, slot: u3, skill: Skill) void {
    return impl_SetClassMinorSkill(pid, slot, @intFromEnum(skill));
}
pub fn sendClass(pid: c_ushort) void {
    return impl_SendClass(pid);
}

extern "libTES3MP-core" fn impl_GetDefaultClass(c_ushort) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetClassName(c_ushort) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetClassDesc(c_ushort) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetClassMajorAttribute(c_ushort, u8) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetClassSpecialization(c_ushort) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetClassMajorSkill(c_ushort, u8) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetClassMinorSkill(c_ushort, u8) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_IsClassDefault(c_ushort) callconv(.C) c_int;

extern "libTES3MP-core" fn impl_SetDefaultClass(c_ushort, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetClassName(c_ushort, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetClassDesc(c_ushort, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetClassMajorAttribute(c_ushort, u8, c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetClassSpecialization(c_ushort, c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetClassMajorSkill(c_ushort, u8, c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetClassMinorSkill(c_ushort, u8, c_int) callconv(.C) void;

extern "libTES3MP-core" fn impl_SendClass(c_ushort) callconv(.C) void;
