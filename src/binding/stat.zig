const std = @import("std");

const shared = @import("shared.zig");

const class = @import("class.zig");

const Attribute = class.Attribute;
const Skill = class.Skill;

pub const CharGenStage = enum(u3) {
    name = 0, // Do not use this setting; it will break the game.
    race,
    class,
    birthsign,
    review,
};

pub fn getAttributeCount() i32 {
    return raw.getAttributeCount();
}
pub fn getSkillCount() i32 {
    return raw.getSkillCount();
}
pub fn getAttributeId(name: [:0]const u8) Attribute {
    return @enumFromInt(raw.getAttributeId(name));
}
pub fn getSkillId(name: [:0]const u8) Skill {
    return @enumFromInt(raw.getSkillId(name));
}
pub fn getAttributeName(attribute_id: Attribute) [:0]const u8 {
    return std.mem.span(raw.getAttributeName(@intFromEnum(attribute_id)).?);
}
pub fn getSkillName(skill_id: Skill) [:0]const u8 {
    return std.mem.span(raw.getSkillName(@intFromEnum(skill_id)).?);
}

pub fn getName(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getName(pid).?);
}
pub fn getRace(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getRace(pid).?);
}
pub fn getHead(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getHead(pid).?);
}
pub fn getHair(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getHair(pid).?);
}
pub fn getIsMale(pid: u16) bool {
    return raw.getIsMale(pid) != 0;
}
pub fn getModel(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getModel(pid).?);
}
pub fn getBirthsign(pid: u16) [:0]const u8 {
    return std.mem.span(raw.getBirthsign(pid).?);
}

pub fn getLevel(pid: u16) i32 {
    return raw.getLevel(pid);
}
pub fn getLevelProgress(pid: u16) i32 {
    return raw.getLevelProgress(pid);
}

pub fn getHealthBase(pid: u16) f64 {
    return raw.getHealthBase(pid);
}
pub fn getHealthCurrent(pid: u16) f64 {
    return raw.getHealthCurrent(pid);
}

pub fn getMagickaBase(pid: u16) f64 {
    return raw.getMagickaBase(pid);
}
pub fn getMagickaCurrent(pid: u16) f64 {
    return raw.getMagickaCurrent(pid);
}

pub fn getFatigueBase(pid: u16) f64 {
    return raw.getFatigueBase(pid);
}
pub fn getFatigueCurrent(pid: u16) f64 {
    return raw.getFatigueCurrent(pid);
}

pub fn getAttributeBase(pid: u16, attribute_id: Attribute) i32 {
    return raw.getAttributeBase(pid, @intFromEnum(attribute_id));
}
pub fn getAttributeModifier(pid: u16, attribute_id: Attribute) i32 {
    return raw.getAttributeModifier(pid, @intFromEnum(attribute_id));
}
pub fn getAttributeDamage(pid: u16, attribute_id: Attribute) f64 {
    return raw.getAttributeDamage(pid, @intFromEnum(attribute_id));
}

pub fn getSkillBase(pid: u16, skill_id: Skill) i32 {
    return raw.getSkillBase(pid, @intFromEnum(skill_id));
}
pub fn getSkillModifier(pid: u16, skill_id: Skill) i32 {
    return raw.getSkillModifier(pid, @intFromEnum(skill_id));
}
pub fn getSkillDamage(pid: u16, skill_id: Skill) f64 {
    return raw.getSkillDamage(pid, @intFromEnum(skill_id));
}
pub fn getSkillProgress(pid: u16, skill_id: Skill) f64 {
    return raw.getSkillProgress(pid, @intFromEnum(skill_id));
}
pub fn getSkillIncrease(pid: u16, attribute_id: Attribute) i32 {
    return raw.getSkillIncrease(pid, @intFromEnum(attribute_id));
}

pub fn getBounty(pid: u16) i32 {
    return raw.getBounty(pid);
}

pub fn setName(pid: u16, name: [:0]const u8) void {
    return raw.setName(pid, name);
}
pub fn setRace(pid: u16, race: [:0]const u8) void {
    return raw.setRace(pid, race);
}
pub fn setHead(pid: u16, head: [:0]const u8) void {
    return raw.setHead(pid, head);
}
pub fn setHair(pid: u16, hairstyle: [:0]const u8) void {
    return raw.setHair(pid, hairstyle);
}
// TODO: check that this isn't just a dumb boolean
pub fn setIsMale(pid: u16, state: i32) void {
    return raw.setIsMale(pid, state);
}
pub fn setModel(pid: u16, model: [:0]const u8) void {
    return raw.setModel(pid, model);
}
pub fn setBirthsign(pid: u16, name: [:0]const u8) void {
    return raw.setBirthsign(pid, name);
}
pub fn setResetStats(pid: u16, reset_stats: bool) void {
    return raw.setResetStats(pid, reset_stats);
}

pub fn setLevel(pid: u16, value: i32) void {
    return raw.setLevel(pid, value);
}
pub fn setLevelProgress(pid: u16, value: i32) void {
    return raw.setLevelProgress(pid, value);
}

pub fn setHealthBase(pid: u16, value: f64) void {
    return raw.setHealthBase(pid, value);
}
pub fn setHealthCurrent(pid: u16, value: f64) void {
    return raw.setHealthCurrent(pid, value);
}
pub fn setMagickaBase(pid: u16, value: f64) void {
    return raw.setMagickaBase(pid, value);
}
pub fn setMagickaCurrent(pid: u16, value: f64) void {
    return raw.setMagickaCurrent(pid, value);
}
pub fn setFatigueBase(pid: u16, value: f64) void {
    return raw.setFatigueBase(pid, value);
}
pub fn setFatigueCurrent(pid: u16, value: f64) void {
    return raw.setFatigueCurrent(pid, value);
}

pub fn setAttributeBase(pid: u16, attribute_id: Attribute, value: i32) void {
    return raw.setAttributeBase(pid, @intFromEnum(attribute_id), value);
}
pub fn clearAttributeModifier(pid: u16, attribute_id: Attribute) void {
    return raw.clearAttributeModifier(pid, @intFromEnum(attribute_id));
}
pub fn setAttributeDamage(pid: u16, attribute_id: Attribute, value: f64) void {
    return raw.setAttributeDamage(pid, @intFromEnum(attribute_id), value);
}

pub fn setSkillBase(pid: u16, skill_id: Skill, value: i32) void {
    return raw.setSkillBase(pid, @intFromEnum(skill_id), value);
}
pub fn clearSkillModifier(pid: u16, skill_id: Skill) void {
    return raw.clearSkillModifier(pid, @intFromEnum(skill_id));
}
pub fn setSkillDamage(pid: u16, skill_id: Skill, value: f64) void {
    return raw.setSkillDamage(pid, @intFromEnum(skill_id), value);
}
pub fn setSkillProgress(pid: u16, skill_id: Skill, value: f64) void {
    return raw.setSkillProgress(pid, @intFromEnum(skill_id), value);
}
pub fn setSkillIncrease(pid: u16, attribute_id: Attribute, value: i32) void {
    return raw.setSkillIncrease(pid, @intFromEnum(attribute_id), value);
}

pub fn setBounty(pid: u16, value: i32) void {
    return raw.setBounty(pid, value);
}
pub fn setCharGenStage(pid: u16, current_stage: CharGenStage, end_stage: CharGenStage) void {
    return raw.setCharGenStage(pid, @intFromEnum(current_stage), @intFromEnum(end_stage));
}

pub fn sendBaseInfo(pid: u16) void {
    return raw.sendBaseInfo(pid);
}

pub fn sendStatsDynamic(pid: u16) void {
    return raw.sendStatsDynamic(pid);
}
pub fn sendAttributes(pid: u16) void {
    return raw.sendAttributes(pid);
}
pub fn sendSkills(pid: u16) void {
    return raw.sendSkills(pid);
}
pub fn sendLevel(pid: u16) void {
    return raw.sendLevel(pid);
}
pub fn sendBounty(pid: u16) void {
    return raw.sendBounty(pid);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_GetAttributeCount() callconv(.C) c_int;
    pub const getAttributeCount = libtes3mp_GetAttributeCount;
    extern "libTES3MP-core" fn libtes3mp_GetSkillCount() callconv(.C) c_int;
    pub const getSkillCount = libtes3mp_GetSkillCount;
    extern "libTES3MP-core" fn libtes3mp_GetAttributeId(name: [*:0]const u8) callconv(.C) c_int;
    pub const getAttributeId = libtes3mp_GetAttributeId;
    extern "libTES3MP-core" fn libtes3mp_GetSkillId(name: [*:0]const u8) callconv(.C) c_int;
    pub const getSkillId = libtes3mp_GetSkillId;
    extern "libTES3MP-core" fn libtes3mp_GetAttributeName(attribute_id: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getAttributeName = libtes3mp_GetAttributeName;
    extern "libTES3MP-core" fn libtes3mp_GetSkillName(skill_id: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getSkillName = libtes3mp_GetSkillName;

    extern "libTES3MP-core" fn libtes3mp_GetName(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getName = libtes3mp_GetName;
    extern "libTES3MP-core" fn libtes3mp_GetRace(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getRace = libtes3mp_GetRace;
    extern "libTES3MP-core" fn libtes3mp_GetHead(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getHead = libtes3mp_GetHead;
    extern "libTES3MP-core" fn libtes3mp_GetHair(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getHair = libtes3mp_GetHair;
    extern "libTES3MP-core" fn libtes3mp_GetIsMale(pid: c_ushort) callconv(.C) c_int;
    pub const getIsMale = libtes3mp_GetIsMale;
    extern "libTES3MP-core" fn libtes3mp_GetModel(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getModel = libtes3mp_GetModel;
    extern "libTES3MP-core" fn libtes3mp_GetBirthsign(pid: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getBirthsign = libtes3mp_GetBirthsign;

    extern "libTES3MP-core" fn libtes3mp_GetLevel(pid: c_ushort) callconv(.C) c_int;
    pub const getLevel = libtes3mp_GetLevel;
    extern "libTES3MP-core" fn libtes3mp_GetLevelProgress(pid: c_ushort) callconv(.C) c_int;
    pub const getLevelProgress = libtes3mp_GetLevelProgress;

    extern "libTES3MP-core" fn libtes3mp_GetHealthBase(pid: c_ushort) callconv(.C) f64;
    pub const getHealthBase = libtes3mp_GetHealthBase;
    extern "libTES3MP-core" fn libtes3mp_GetHealthCurrent(pid: c_ushort) callconv(.C) f64;
    pub const getHealthCurrent = libtes3mp_GetHealthCurrent;

    extern "libTES3MP-core" fn libtes3mp_GetMagickaBase(pid: c_ushort) callconv(.C) f64;
    pub const getMagickaBase = libtes3mp_GetMagickaBase;
    extern "libTES3MP-core" fn libtes3mp_GetMagickaCurrent(pid: c_ushort) callconv(.C) f64;
    pub const getMagickaCurrent = libtes3mp_GetMagickaCurrent;

    extern "libTES3MP-core" fn libtes3mp_GetFatigueBase(pid: c_ushort) callconv(.C) f64;
    pub const getFatigueBase = libtes3mp_GetFatigueBase;
    extern "libTES3MP-core" fn libtes3mp_GetFatigueCurrent(pid: c_ushort) callconv(.C) f64;
    pub const getFatigueCurrent = libtes3mp_GetFatigueCurrent;

    extern "libTES3MP-core" fn libtes3mp_GetAttributeBase(pid: c_ushort, attribute_id: c_ushort) callconv(.C) c_int;
    pub const getAttributeBase = libtes3mp_GetAttributeBase;
    extern "libTES3MP-core" fn libtes3mp_GetAttributeModifier(pid: c_ushort, attribute_id: c_ushort) callconv(.C) c_int;
    pub const getAttributeModifier = libtes3mp_GetAttributeModifier;
    extern "libTES3MP-core" fn libtes3mp_GetAttributeDamage(pid: c_ushort, attribute_id: c_ushort) callconv(.C) f64;
    pub const getAttributeDamage = libtes3mp_GetAttributeDamage;

    extern "libTES3MP-core" fn libtes3mp_GetSkillBase(pid: c_ushort, skill_id: c_ushort) callconv(.C) c_int;
    pub const getSkillBase = libtes3mp_GetSkillBase;
    extern "libTES3MP-core" fn libtes3mp_GetSkillModifier(pid: c_ushort, skill_id: c_ushort) callconv(.C) c_int;
    pub const getSkillModifier = libtes3mp_GetSkillModifier;
    extern "libTES3MP-core" fn libtes3mp_GetSkillDamage(pid: c_ushort, skill_id: c_ushort) callconv(.C) f64;
    pub const getSkillDamage = libtes3mp_GetSkillDamage;
    extern "libTES3MP-core" fn libtes3mp_GetSkillProgress(pid: c_ushort, skill_id: c_ushort) callconv(.C) f64;
    pub const getSkillProgress = libtes3mp_GetSkillProgress;
    extern "libTES3MP-core" fn libtes3mp_GetSkillIncrease(pid: c_ushort, attribute_id: c_uint) callconv(.C) c_int;
    pub const getSkillIncrease = libtes3mp_GetSkillIncrease;

    extern "libTES3MP-core" fn libtes3mp_GetBounty(pid: c_ushort) callconv(.C) c_int;
    pub const getBounty = libtes3mp_GetBounty;

    extern "libTES3MP-core" fn libtes3mp_SetName(pid: c_ushort, name: [*:0]const u8) callconv(.C) void;
    pub const setName = libtes3mp_SetName;
    extern "libTES3MP-core" fn libtes3mp_SetRace(pid: c_ushort, race: [*:0]const u8) callconv(.C) void;
    pub const setRace = libtes3mp_SetRace;
    extern "libTES3MP-core" fn libtes3mp_SetHead(pid: c_ushort, head: [*:0]const u8) callconv(.C) void;
    pub const setHead = libtes3mp_SetHead;
    extern "libTES3MP-core" fn libtes3mp_SetHair(pid: c_ushort, hairstyle: [*:0]const u8) callconv(.C) void;
    pub const setHair = libtes3mp_SetHair;
    extern "libTES3MP-core" fn libtes3mp_SetIsMale(pid: c_ushort, state: c_int) callconv(.C) void;
    pub const setIsMale = libtes3mp_SetIsMale;
    extern "libTES3MP-core" fn libtes3mp_SetModel(pid: c_ushort, model: [*:0]const u8) callconv(.C) void;
    pub const setModel = libtes3mp_SetModel;
    extern "libTES3MP-core" fn libtes3mp_SetBirthsign(pid: c_ushort, name: [*:0]const u8) callconv(.C) void;
    pub const setBirthsign = libtes3mp_SetBirthsign;
    extern "libTES3MP-core" fn libtes3mp_SetResetStats(pid: c_ushort, reset_stats: bool) callconv(.C) void;
    pub const setResetStats = libtes3mp_SetResetStats;

    extern "libTES3MP-core" fn libtes3mp_SetLevel(pid: c_ushort, value: c_int) callconv(.C) void;
    pub const setLevel = libtes3mp_SetLevel;
    extern "libTES3MP-core" fn libtes3mp_SetLevelProgress(pid: c_ushort, value: c_int) callconv(.C) void;
    pub const setLevelProgress = libtes3mp_SetLevelProgress;

    extern "libTES3MP-core" fn libtes3mp_SetHealthBase(pid: c_ushort, value: f64) callconv(.C) void;
    pub const setHealthBase = libtes3mp_SetHealthBase;
    extern "libTES3MP-core" fn libtes3mp_SetHealthCurrent(pid: c_ushort, value: f64) callconv(.C) void;
    pub const setHealthCurrent = libtes3mp_SetHealthCurrent;
    extern "libTES3MP-core" fn libtes3mp_SetMagickaBase(pid: c_ushort, value: f64) callconv(.C) void;
    pub const setMagickaBase = libtes3mp_SetMagickaBase;
    extern "libTES3MP-core" fn libtes3mp_SetMagickaCurrent(pid: c_ushort, value: f64) callconv(.C) void;
    pub const setMagickaCurrent = libtes3mp_SetMagickaCurrent;
    extern "libTES3MP-core" fn libtes3mp_SetFatigueBase(pid: c_ushort, value: f64) callconv(.C) void;
    pub const setFatigueBase = libtes3mp_SetFatigueBase;
    extern "libTES3MP-core" fn libtes3mp_SetFatigueCurrent(pid: c_ushort, value: f64) callconv(.C) void;
    pub const setFatigueCurrent = libtes3mp_SetFatigueCurrent;

    extern "libTES3MP-core" fn libtes3mp_SetAttributeBase(pid: c_ushort, attribute_id: c_ushort, value: c_int) callconv(.C) void;
    pub const setAttributeBase = libtes3mp_SetAttributeBase;
    extern "libTES3MP-core" fn libtes3mp_ClearAttributeModifier(pid: c_ushort, attribute_id: c_ushort) callconv(.C) void;
    pub const clearAttributeModifier = libtes3mp_ClearAttributeModifier;
    extern "libTES3MP-core" fn libtes3mp_SetAttributeDamage(pid: c_ushort, attribute_id: c_ushort, value: f64) callconv(.C) void;
    pub const setAttributeDamage = libtes3mp_SetAttributeDamage;

    extern "libTES3MP-core" fn libtes3mp_SetSkillBase(pid: c_ushort, skill_id: c_ushort, value: c_int) callconv(.C) void;
    pub const setSkillBase = libtes3mp_SetSkillBase;
    extern "libTES3MP-core" fn libtes3mp_ClearSkillModifier(pid: c_ushort, skill_id: c_ushort) callconv(.C) void;
    pub const clearSkillModifier = libtes3mp_ClearSkillModifier;
    extern "libTES3MP-core" fn libtes3mp_SetSkillDamage(pid: c_ushort, skill_id: c_ushort, value: f64) callconv(.C) void;
    pub const setSkillDamage = libtes3mp_SetSkillDamage;
    extern "libTES3MP-core" fn libtes3mp_SetSkillProgress(pid: c_ushort, skill_id: c_ushort, value: f64) callconv(.C) void;
    pub const setSkillProgress = libtes3mp_SetSkillProgress;
    extern "libTES3MP-core" fn libtes3mp_SetSkillIncrease(pid: c_ushort, attribute_id: c_uint, value: c_int) callconv(.C) void;
    pub const setSkillIncrease = libtes3mp_SetSkillIncrease;

    extern "libTES3MP-core" fn libtes3mp_SetBounty(pid: c_ushort, value: c_int) callconv(.C) void;
    pub const setBounty = libtes3mp_SetBounty;
    extern "libTES3MP-core" fn libtes3mp_SetCharGenStage(pid: c_ushort, current_stage: c_int, end_stage: c_int) callconv(.C) void;
    pub const setCharGenStage = libtes3mp_SetCharGenStage;

    extern "libTES3MP-core" fn libtes3mp_SendBaseInfo(pid: c_ushort) callconv(.C) void;
    pub const sendBaseInfo = libtes3mp_SendBaseInfo;

    extern "libTES3MP-core" fn libtes3mp_SendStatsDynamic(pid: c_ushort) callconv(.C) void;
    pub const sendStatsDynamic = libtes3mp_SendStatsDynamic;
    extern "libTES3MP-core" fn libtes3mp_SendAttributes(pid: c_ushort) callconv(.C) void;
    pub const sendAttributes = libtes3mp_SendAttributes;
    extern "libTES3MP-core" fn libtes3mp_SendSkills(pid: c_ushort) callconv(.C) void;
    pub const sendSkills = libtes3mp_SendSkills;
    extern "libTES3MP-core" fn libtes3mp_SendLevel(pid: c_ushort) callconv(.C) void;
    pub const sendLevel = libtes3mp_SendLevel;
    extern "libTES3MP-core" fn libtes3mp_SendBounty(pid: c_ushort) callconv(.C) void;
    pub const sendBounty = libtes3mp_SendBounty;
};
