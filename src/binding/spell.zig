const std = @import("std");

const shared = @import("shared.zig");

pub const SpellbookChangesAction = enum(u2) {
    set,
    add,
    remove,
};

pub const SpellsActiveChangesAction = enum(u2) {
    set,
    add,
    remove,
};

pub fn clearSpellbookChanges(pid: u16) void {
    return raw.clearSpellbookChanges(pid);
}
pub fn clearSpellsActiveChanges(pid: u16) void {
    return raw.clearSpellsActiveChanges(pid);
}
pub fn clearCooldownChanges(pid: u16) void {
    return raw.clearCooldownChanges(pid);
}

pub fn getSpellbookChangesSize(pid: u16) c_uint {
    return raw.getSpellbookChangesSize(pid);
}
pub fn getSpellbookChangesAction(pid: u16) SpellbookChangesAction {
    return @enumFromInt(raw.getSpellbookChangesAction(pid));
}
pub fn getSpellsActiveChangesSize(pid: u16) u32 {
    return raw.getSpellsActiveChangesSize(pid);
}
pub fn getSpellsActiveChangesAction(pid: u16) SpellsActiveChangesAction {
    return @enumFromInt(raw.getSpellsActiveChangesAction(pid));
}
pub fn getCooldownChangesSize(pid: u16) u32 {
    return raw.getCooldownChangesSize(pid);
}

pub fn setSpellbookChangesAction(pid: u16, action: SpellbookChangesAction) void {
    return raw.setSpellbookChangesAction(pid, @intFromEnum(action));
}
pub fn setSpellsActiveChangesAction(pid: u16, action: SpellsActiveChangesAction) void {
    return raw.setSpellsActiveChangesAction(pid, @intFromEnum(action));
}

pub fn addSpell(pid: u16, spell_id: [:0]const u8) void {
    return raw.addSpell(pid, spell_id);
}
pub fn addSpellActive(
    pid: u16,
    spell_id: [:0]const u8,
    display_name: [:0]const u8,
    stacking_state: bool,
) void {
    return raw.addSpellActive(pid, spell_id, display_name, stacking_state);
}
pub fn addSpellActiveEffect(
    pid: u16,
    effect_id: i32,
    magnitude: f64,
    duration: f64,
    time_left: f64,
    arg: c_int,
) void {
    return raw.addSpellActiveEffect(pid, effect_id, magnitude, duration, time_left, arg);
}
pub fn addCooldownSpell(pid: u16, spell_id: [:0]const u8, start_day: u32, start_hour: f64) void {
    return raw.addCooldownSpell(pid, spell_id, start_day, start_hour);
}

pub fn getSpellId(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getSpellbookChangesSize(pid), index);

    return std.mem.span(raw.getSpellId(pid, index).?);
}
pub fn getSpellsActiveId(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getSpellsActiveChangesSize(pid), index);

    return std.mem.span(raw.getSpellsActiveId(pid, index).?);
}
pub fn getSpellsActiveDisplayName(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getSpellsActiveChangesSize(pid), index);

    return std.mem.span(raw.getSpellsActiveDisplayName(pid, index).?);
}
pub fn getSpellsActiveStackingState(pid: u16, index: u32) bool {
    shared.triggerSafetyCheck(getSpellsActiveChangesSize(pid), index);

    return raw.getSpellsActiveStackingState(pid, index);
}
pub fn getSpellsActiveEffectCount(pid: u16, index: u32) u32 {
    shared.triggerSafetyCheck(getSpellsActiveChangesSize(pid), index);

    return raw.getSpellsActiveEffectCount(pid, index);
}
pub fn getSpellsActiveEffectId(pid: u16, spell_index: u32, effect_index: u32) u32 {
    shared.triggerSafetyCheck(getSpellsActiveChangesSize(pid), spell_index);
    shared.triggerSafetyCheck(getSpellsActiveEffectCount(pid, spell_index), effect_index);

    return raw.getSpellsActiveEffectId(pid, spell_index, effect_index);
}
pub fn getSpellsActiveEffectArg(pid: u16, spell_index: u32, effect_index: u32) i32 {
    shared.triggerSafetyCheck(getSpellsActiveChangesSize(pid), spell_index);
    shared.triggerSafetyCheck(getSpellsActiveEffectCount(pid, spell_index), effect_index);

    return raw.getSpellsActiveEffectArg(pid, spell_index, effect_index);
}
pub fn getSpellsActiveEffectMagnitude(pid: u16, spell_index: u32, effect_index: u32) f64 {
    shared.triggerSafetyCheck(getSpellsActiveChangesSize(pid), spell_index);
    shared.triggerSafetyCheck(getSpellsActiveEffectCount(pid, spell_index), effect_index);

    return raw.getSpellsActiveEffectMagnitude(pid, spell_index, effect_index);
}
pub fn getSpellsActiveEffectDuration(pid: u16, spell_index: u32, effect_index: u32) f64 {
    shared.triggerSafetyCheck(getSpellsActiveChangesSize(pid), spell_index);
    shared.triggerSafetyCheck(getSpellsActiveEffectCount(pid, spell_index), effect_index);

    return raw.getSpellsActiveEffectDuration(pid, spell_index, effect_index);
}
pub fn getSpellsActiveEffectTimeLeft(pid: u16, spell_index: u32, effect_index: u32) f64 {
    shared.triggerSafetyCheck(getSpellsActiveChangesSize(pid), spell_index);
    shared.triggerSafetyCheck(getSpellsActiveEffectCount(pid, spell_index), effect_index);

    return raw.getSpellsActiveEffectTimeLeft(pid, spell_index, effect_index);
}

pub fn doesSpellsActiveHavePlayerCaster(pid: u16, index: u32) bool {
    shared.triggerSafetyCheck(getSpellsActiveChangesSize(pid), index);

    return raw.doesSpellsActiveHavePlayerCaster(pid, index);
}
pub fn getSpellsActiveCasterPid(pid: u16, index: u32) i32 {
    std.debug.assert(doesSpellsActiveHavePlayerCaster(pid, index));

    return raw.getSpellsActiveCasterPid(pid, index);
}
pub fn getSpellsActiveCasterRefId(pid: u16, index: u32) [:0]const u8 {
    std.debug.assert(!doesSpellsActiveHavePlayerCaster(pid, index));

    return std.mem.span(raw.getSpellsActiveCasterRefId(pid, index).?);
}
pub fn getSpellsActiveCasterRefNum(pid: u16, index: u32) u32 {
    std.debug.assert(!doesSpellsActiveHavePlayerCaster(pid, index));

    return raw.getSpellsActiveCasterRefNum(pid, index);
}
pub fn getSpellsActiveCasterMpNum(pid: u16, index: u32) u32 {
    std.debug.assert(!doesSpellsActiveHavePlayerCaster(pid, index));

    return raw.getSpellsActiveCasterMpNum(pid, index);
}

pub fn getCooldownSpellId(pid: u16, index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getCooldownChangesSize(pid), index);

    return std.mem.span(raw.getCooldownSpellId(pid, index).?);
}
pub fn getCooldownStartDay(pid: u16, index: u32) u32 {
    shared.triggerSafetyCheck(getCooldownChangesSize(pid), index);

    return raw.getCooldownStartDay(pid, index);
}
pub fn getCooldownStartHour(pid: u16, index: u32) f64 {
    shared.triggerSafetyCheck(getCooldownChangesSize(pid), index);

    return raw.getCooldownStartHour(pid, index);
}

pub fn sendSpellbookChanges(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendSpellbookChanges(pid, send_to_other_players, skip_attached_player);
}
pub fn sendSpellsActiveChanges(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendSpellsActiveChanges(pid, send_to_other_players, skip_attached_player);
}
pub fn sendCooldownChanges(pid: u16) void {
    return raw.sendCooldownChanges(pid);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_ClearSpellbookChanges(pid: c_ushort) callconv(.C) void;
    pub const clearSpellbookChanges = libtes3mp_ClearSpellbookChanges;
    extern "libTES3MP-core" fn libtes3mp_ClearSpellsActiveChanges(pid: c_ushort) callconv(.C) void;
    pub const clearSpellsActiveChanges = libtes3mp_ClearSpellsActiveChanges;
    extern "libTES3MP-core" fn libtes3mp_ClearCooldownChanges(pid: c_ushort) callconv(.C) void;
    pub const clearCooldownChanges = libtes3mp_ClearCooldownChanges;

    extern "libTES3MP-core" fn libtes3mp_GetSpellbookChangesSize(pid: c_ushort) callconv(.C) c_uint;
    pub const getSpellbookChangesSize = libtes3mp_GetSpellbookChangesSize;
    extern "libTES3MP-core" fn libtes3mp_GetSpellbookChangesAction(pid: c_ushort) callconv(.C) c_uint;
    pub const getSpellbookChangesAction = libtes3mp_GetSpellbookChangesAction;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveChangesSize(pid: c_ushort) callconv(.C) c_uint;
    pub const getSpellsActiveChangesSize = libtes3mp_GetSpellsActiveChangesSize;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveChangesAction(pid: c_ushort) callconv(.C) c_uint;
    pub const getSpellsActiveChangesAction = libtes3mp_GetSpellsActiveChangesAction;
    extern "libTES3MP-core" fn libtes3mp_GetCooldownChangesSize(pid: c_ushort) callconv(.C) c_uint;
    pub const getCooldownChangesSize = libtes3mp_GetCooldownChangesSize;

    extern "libTES3MP-core" fn libtes3mp_SetSpellbookChangesAction(pid: c_ushort, action: u8) callconv(.C) void;
    pub const setSpellbookChangesAction = libtes3mp_SetSpellbookChangesAction;
    extern "libTES3MP-core" fn libtes3mp_SetSpellsActiveChangesAction(pid: c_ushort, action: u8) callconv(.C) void;
    pub const setSpellsActiveChangesAction = libtes3mp_SetSpellsActiveChangesAction;

    extern "libTES3MP-core" fn libtes3mp_AddSpell(pid: c_ushort, spell_id: [*:0]const u8) callconv(.C) void;
    pub const addSpell = libtes3mp_AddSpell;
    extern "libTES3MP-core" fn libtes3mp_AddSpellActive(pid: c_ushort, spell_id: [*:0]const u8, display_name: [*:0]const u8, stacking_state: bool) callconv(.C) void;
    pub const addSpellActive = libtes3mp_AddSpellActive;
    extern "libTES3MP-core" fn libtes3mp_AddSpellActiveEffect(pid: c_ushort, effect_id: c_int, magnitude: f64, duration: f64, time_left: f64, arg: c_int) callconv(.C) void;
    pub const addSpellActiveEffect = libtes3mp_AddSpellActiveEffect;
    extern "libTES3MP-core" fn libtes3mp_AddCooldownSpell(pid: c_ushort, spell_id: [*:0]const u8, start_day: c_uint, start_hour: f64) callconv(.C) void;
    pub const addCooldownSpell = libtes3mp_AddCooldownSpell;

    extern "libTES3MP-core" fn libtes3mp_GetSpellId(pid: c_ushort, index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getSpellId = libtes3mp_GetSpellId;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveId(pid: c_ushort, index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getSpellsActiveId = libtes3mp_GetSpellsActiveId;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveDisplayName(pid: c_ushort, index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getSpellsActiveDisplayName = libtes3mp_GetSpellsActiveDisplayName;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveStackingState(pid: c_ushort, index: c_uint) callconv(.C) bool;
    pub const getSpellsActiveStackingState = libtes3mp_GetSpellsActiveStackingState;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveEffectCount(pid: c_ushort, index: c_uint) callconv(.C) c_uint;
    pub const getSpellsActiveEffectCount = libtes3mp_GetSpellsActiveEffectCount;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveEffectId(pid: c_ushort, spell_index: c_uint, effect_index: c_uint) callconv(.C) c_uint;
    pub const getSpellsActiveEffectId = libtes3mp_GetSpellsActiveEffectId;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveEffectArg(pid: c_ushort, spell_index: c_uint, effect_index: c_uint) callconv(.C) c_int;
    pub const getSpellsActiveEffectArg = libtes3mp_GetSpellsActiveEffectArg;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveEffectMagnitude(pid: c_ushort, spell_index: c_uint, effect_index: c_uint) callconv(.C) f64;
    pub const getSpellsActiveEffectMagnitude = libtes3mp_GetSpellsActiveEffectMagnitude;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveEffectDuration(pid: c_ushort, spell_index: c_uint, effect_index: c_uint) callconv(.C) f64;
    pub const getSpellsActiveEffectDuration = libtes3mp_GetSpellsActiveEffectDuration;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveEffectTimeLeft(pid: c_ushort, spell_index: c_uint, effect_index: c_uint) callconv(.C) f64;
    pub const getSpellsActiveEffectTimeLeft = libtes3mp_GetSpellsActiveEffectTimeLeft;

    extern "libTES3MP-core" fn libtes3mp_DoesSpellsActiveHavePlayerCaster(pid: c_ushort, index: c_uint) callconv(.C) bool;
    pub const doesSpellsActiveHavePlayerCaster = libtes3mp_DoesSpellsActiveHavePlayerCaster;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveCasterPid(pid: c_ushort, index: c_uint) callconv(.C) c_int;
    pub const getSpellsActiveCasterPid = libtes3mp_GetSpellsActiveCasterPid;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveCasterRefId(pid: c_ushort, index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getSpellsActiveCasterRefId = libtes3mp_GetSpellsActiveCasterRefId;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveCasterRefNum(pid: c_ushort, index: c_uint) callconv(.C) c_uint;
    pub const getSpellsActiveCasterRefNum = libtes3mp_GetSpellsActiveCasterRefNum;
    extern "libTES3MP-core" fn libtes3mp_GetSpellsActiveCasterMpNum(pid: c_ushort, index: c_uint) callconv(.C) c_uint;
    pub const getSpellsActiveCasterMpNum = libtes3mp_GetSpellsActiveCasterMpNum;

    extern "libTES3MP-core" fn libtes3mp_GetCooldownSpellId(pid: c_ushort, index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getCooldownSpellId = libtes3mp_GetCooldownSpellId;
    extern "libTES3MP-core" fn libtes3mp_GetCooldownStartDay(pid: c_ushort, index: c_uint) callconv(.C) c_uint;
    pub const getCooldownStartDay = libtes3mp_GetCooldownStartDay;
    extern "libTES3MP-core" fn libtes3mp_GetCooldownStartHour(pid: c_ushort, index: c_uint) callconv(.C) f64;
    pub const getCooldownStartHour = libtes3mp_GetCooldownStartHour;

    extern "libTES3MP-core" fn libtes3mp_SendSpellbookChanges(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendSpellbookChanges = libtes3mp_SendSpellbookChanges;
    extern "libTES3MP-core" fn libtes3mp_SendSpellsActiveChanges(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendSpellsActiveChanges = libtes3mp_SendSpellsActiveChanges;
    extern "libTES3MP-core" fn libtes3mp_SendCooldownChanges(pid: c_ushort) callconv(.C) void;
    pub const sendCooldownChanges = libtes3mp_SendCooldownChanges;
};
