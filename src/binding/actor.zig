const std = @import("std");

const shared = @import("shared.zig");

pub const ActorListAction = enum(u2) {
    set,
    add,
    remove,
    request,
};

pub const SpellsActiveAction = enum(u2) {
    set,
    add,
    remove,
};

pub const EquipmentSlot = enum(u5) {
    helmet,
    cuirass,
    greaves,
    left_pauldron,
    right_pauldron,
    left_gauntlet,
    right_gauntlet,
    boots,
    shirt,
    pants,
    skirt,
    robe,
    left_ring,
    right_ring,
    amulet,
    belt,
    carried_right,
    carried_left,
    ammunition,
};

pub const CharacterState = enum(u6) {
    none,
    special_idle,
    idle,
    idle2,
    idle3,
    idle4,
    idle5,
    idle6,
    idle7,
    idle8,
    idle9,
    idle_swim,
    idle_sneak,

    walk_forward,
    walk_back,
    walk_left,
    walk_right,

    swim_walk_forward,
    swim_walk_back,
    swim_walk_left,
    swim_walk_right,

    run_forward,
    run_back,
    run_left,
    run_right,

    swim_run_forward,
    swim_run_back,
    swim_run_left,
    swim_run_right,

    sneak_forward,
    sneak_back,
    sneak_left,
    sneak_right,

    turn_left,
    turn_right,
    swim_turn_left,
    swim_turn_right,

    jump,

    death1,
    death2,
    death3,
    death4,
    death5,
    swim_death,
    swim_death_knock_down,
    swim_death_knock_out,

    hit,
    swim_hit,
    knock_down,
    knock_out,
    swim_knock_down,
    swim_knock_out,
    block,
};

pub const AiAction = enum(u3) {
    cancel,
    activate,
    combat,
    escort,
    follow,
    travel,
    wander,
};

pub fn readReceivedActorList() void {
    return raw.readReceivedActorList();
}
pub fn readCellActorList(cell_description: [:0]const u8) void {
    return raw.readCellActorList(cell_description);
}

pub fn clearActorList() void {
    return raw.clearActorList();
}
pub fn setActorListPid(pid: u16) void {
    return raw.setActorListPid(pid);
}

pub fn copyReceivedActorListToStore() void {
    return raw.copyReceivedActorListToStore();
}

pub fn getActorListSize() u32 {
    return raw.getActorListSize();
}
pub fn getActorListAction() ActorListAction {
    return @enumFromInt(raw.getActorListAction());
}

pub fn getActorCell(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return std.mem.span(raw.getActorCell(index).?);
}
pub fn getActorRefId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return std.mem.span(raw.getActorRefId(index).?);
}
pub fn getActorRefNum(index: u32) u32 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorRefNum(index);
}
pub fn getActorMpNum(index: u32) u32 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorMpNum(index);
}

pub fn getActorPosX(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorPosX(index);
}
pub fn getActorPosY(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorPosY(index);
}
pub fn getActorPosZ(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorPosZ(index);
}
pub fn getActorRotX(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorRotX(index);
}
pub fn getActorRotY(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorRotY(index);
}
pub fn getActorRotZ(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorRotZ(index);
}

pub fn getActorHealthBase(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorHealthBase(index);
}
pub fn getActorHealthCurrent(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorHealthCurrent(index);
}
pub fn getActorHealthModified(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorHealthModified(index);
}
pub fn getActorMagickaBase(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorMagickaBase(index);
}
pub fn getActorMagickaCurrent(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorMagickaCurrent(index);
}
pub fn getActorMagickaModified(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorMagickaModified(index);
}
pub fn getActorFatigueBase(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorFatigueBase(index);
}
pub fn getActorFatigueCurrent(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorFatigueCurrent(index);
}
pub fn getActorFatigueModified(index: u32) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorFatigueModified(index);
}

pub fn getActorEquipmentItemRefId(index: u32, slot: EquipmentSlot) [:0]const u8 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return std.mem.span(raw.getActorEquipmentItemRefId(index, @intFromEnum(slot)).?);
}
pub fn getActorEquipmentItemCount(index: u32, slot: EquipmentSlot) i32 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorEquipmentItemCount(index, slot);
}
pub fn getActorEquipmentItemCharge(index: u32, slot: EquipmentSlot) i32 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorEquipmentItemCharge(index, slot);
}
pub fn getActorEquipmentItemEnchantmentCharge(index: u32, slot: EquipmentSlot) f64 {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.getActorEquipmentItemEnchantmentCharge(index, slot);
}

pub fn doesActorHavePlayerKiller(index: u32) bool {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.doesActorHavePlayerKiller(index);
}
pub fn getActorKillerPid(index: u32) u16 {
    shared.triggerSafetyCheck(getActorListSize(), index);
    std.debug.assert(raw.doesActorHavePlayerKiller(index));

    return @intCast(raw.getActorKillerPid(index));
}
pub fn getActorKillerRefId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getActorListSize(), index);
    std.debug.assert(!raw.doesActorHavePlayerKiller(index));

    return std.mem.span(raw.getActorKillerRefId(index).?);
}
pub fn getActorKillerRefNum(index: u32) u32 {
    shared.triggerSafetyCheck(getActorListSize(), index);
    std.debug.assert(!raw.doesActorHavePlayerKiller(index));

    return raw.getActorKillerRefNum(index);
}
pub fn getActorKillerMpNum(index: u32) u32 {
    shared.triggerSafetyCheck(getActorListSize(), index);
    std.debug.assert(!raw.doesActorHavePlayerKiller(index));

    return raw.getActorKillerMpNum(index);
}
pub fn getActorKillerName(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getActorListSize(), index);
    std.debug.assert(!raw.doesActorHavePlayerKiller(index));

    return std.mem.span(raw.getActorKillerName(index).?);
}
pub fn getActorDeathState(index: u32) CharacterState {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return @enumFromInt(raw.getActorDeathState(index));
}

pub fn getActorSpellsActiveChangesSize(actor_index: u32) u32 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);

    return raw.getActorSpellsActiveChangesSize(actor_index);
}
pub fn getActorSpellsActiveChangesAction(actor_index: u32) SpellsActiveAction {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);

    return @enumFromInt(raw.getActorSpellsActiveChangesAction(actor_index));
}
pub fn getActorSpellsActiveId(actor_index: u32, spell_index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);

    return std.mem.span(raw.getActorSpellsActiveId(actor_index, spell_index).?);
}
pub fn getActorSpellsActiveDisplayName(actor_index: u32, spell_index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);

    return std.mem.span(raw.getActorSpellsActiveDisplayName(actor_index, spell_index).?);
}
pub fn getActorSpellsActiveStackingState(actor_index: u32, spell_index: u32) bool {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);

    return raw.getActorSpellsActiveStackingState(actor_index, spell_index);
}
pub fn getActorSpellsActiveEffectCount(actor_index: u32, spell_index: u32) u32 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);

    return raw.getActorSpellsActiveEffectCount(actor_index, spell_index);
}
pub fn getActorSpellsActiveEffectId(
    actor_index: u32,
    spell_index: u32,
    effect_index: u32,
) u32 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);
    shared.triggerSafetyCheck(
        getActorSpellsActiveEffectCount(actor_index, spell_index),
        effect_index,
    );

    return raw.getActorSpellsActiveEffectId(actor_index, spell_index, effect_index);
}
pub fn getActorSpellsActiveEffectArg(
    actor_index: u32,
    spell_index: u32,
    effect_index: u32,
) i32 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);
    shared.triggerSafetyCheck(
        getActorSpellsActiveEffectCount(actor_index, spell_index),
        effect_index,
    );

    return raw.getActorSpellsActiveEffectArg(actor_index, spell_index, effect_index);
}
pub fn getActorSpellsActiveEffectMagnitude(
    actor_index: u32,
    spell_index: u32,
    effect_index: u32,
) f64 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);
    shared.triggerSafetyCheck(
        getActorSpellsActiveEffectCount(actor_index, spell_index),
        effect_index,
    );

    return raw.getActorSpellsActiveEffectMagntiude(actor_index, spell_index, effect_index);
}
pub fn getActorSpellsActiveEffectDuration(
    actor_index: u32,
    spell_index: u32,
    effect_index: u32,
) f64 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);
    shared.triggerSafetyCheck(
        getActorSpellsActiveEffectCount(actor_index, spell_index),
        effect_index,
    );

    return raw.getActorSpellsActiveEffectDuration(actor_index, spell_index, effect_index);
}
pub fn getActorSpellsActiveEffectTimeLeft(
    actor_index: u32,
    spell_index: u32,
    effect_index: u32,
) f64 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);
    shared.triggerSafetyCheck(
        getActorSpellsActiveEffectCount(actor_index, spell_index),
        effect_index,
    );

    return raw.getActorSpellsActiveEffectTimeLeft(actor_index, spell_index, effect_index);
}

pub fn doesActorSpellsActiveHavePlayerCaster(actor_index: u32, spell_index: u32) bool {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);

    return raw.doesActorSpellsActiveHavePlayerCaster(actor_index, spell_index);
}
pub fn getActorSpellsActiveCasterPid(actor_index: u32, spell_index: u32) u16 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);
    std.debug.expect(raw.doesActorSpellsActiveHavePlayerCaster(actor_index, spell_index));

    return @intCast(raw.getActorSpellsActiveCasterPid(actor_index, spell_index));
}
pub fn getActorSpellsActiveCasterRefId(actor_index: u32, spell_index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);
    std.debug.expect(!raw.doesActorSpellsActiveHavePlayerCaster(actor_index, spell_index));

    return std.mem.span(raw.getActorSpellsActiveCasterRefId(actor_index, spell_index).?);
}
pub fn getActorSpellsActiveCasterRefNum(actor_index: u32, spell_index: u32) u32 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);
    std.debug.expect(!raw.doesActorSpellsActiveHavePlayerCaster(actor_index, spell_index));

    return raw.getActorSpellsActiveCasterRefNum(actor_index, spell_index);
}
pub fn getActorSpellsActiveCasterMpNum(actor_index: u32, spell_index: u32) u32 {
    shared.triggerSafetyCheck(getActorListSize(), actor_index);
    shared.triggerSafetyCheck(getActorSpellsActiveChangesSize(actor_index), spell_index);
    std.debug.expect(!raw.doesActorSpellsActiveHavePlayerCaster(actor_index, spell_index));

    return raw.getActorSpellsActiveCasterMpNum(actor_index, spell_index);
}

pub fn doesActorHavePosition(index: u32) bool {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.doesActorHavePosition(index);
}
pub fn doesActorHaveStatsDynamic(index: u32) bool {
    shared.triggerSafetyCheck(getActorListSize(), index);

    return raw.doesActorHaveStatsDynamic(index);
}

pub fn setActorListCell(cell_description: [:0]const u8) void {
    return raw.setActorListCell(cell_description);
}
pub fn setActorListAction(action: ActorListAction) void {
    return raw.setActorListAction(@intFromEnum(action));
}

pub fn setActorCell(cell_description: [:0]const u8) void {
    return raw.setActorCell(cell_description);
}
pub fn setActorRefId(ref_id: [:0]const u8) void {
    return raw.setActorRefId(ref_id);
}
pub fn setActorRefNum(ref_num: i32) void {
    return raw.setActorRefNum(ref_num);
}
pub fn setActorMpNum(mp_num: i32) void {
    return raw.setActorRefNum(mp_num);
}

pub fn setActorPosition(x: f64, y: f64, z: f64) void {
    return raw.setActorPosition(x, y, z);
}
pub fn setActorRotation(x: f64, y: f64, z: f64) void {
    return raw.setActorRotation(x, y, z);
}

pub fn setActorHealthBase(value: f64) void {
    return raw.setActorHealthBase(value);
}
pub fn setActorHealthCurrent(value: f64) void {
    return raw.setActorHealthCurrent(value);
}
pub fn setActorHealthModified(value: f64) void {
    return raw.setActorHealthModified(value);
}
pub fn setActorMagickaBase(value: f64) void {
    return raw.setActorMagickaBase(value);
}
pub fn setActorMagickaCurrent(value: f64) void {
    return raw.setActorMagickaCurrent(value);
}
pub fn setActorMagickaModified(value: f64) void {
    return raw.setActorMagickaModified(value);
}
pub fn setActorFatigueBase(value: f64) void {
    return raw.setActorFatigueBase(value);
}
pub fn setActorFatigueCurrent(value: f64) void {
    return raw.setActorFatigueCurrent(value);
}
pub fn setActorFatigueModified(value: f64) void {
    return raw.setActorFatigueModified(value);
}

pub fn setActorSound(sound: [:0]const u8) void {
    return raw.setActorSound(sound);
}
pub fn setActorDeathState(death_state: CharacterState) void {
    return raw.setActorDeathState(@intFromEnum(death_state));
}
pub fn setActorDeathInstant(is_instant: bool) void {
    return raw.setActorDeathInstant(is_instant);
}
pub fn setActorSpellsActiveAction(action: SpellsActiveAction) void {
    return raw.setActorSpellsActiveAction(@intFromEnum(action));
}

pub fn setActorAIAction(action: AiAction) void {
    return raw.setActorAIAction(@intFromEnum(action));
}
pub fn setActorAITargetToPlayer(pid: u16) void {
    return raw.setActorAITargetToPlayer(pid);
}
pub fn setActorAITargetToObject(ref_num: i32, mp_num: i32) void {
    return raw.setActorAITargetToObject(ref_num, mp_num);
}
pub fn setActorAICoordinates(x: f64, y: f64, z: f64) void {
    return raw.setActorAICoordinates(x, y, z);
}
pub fn setActorAIDistance(distance: u32) void {
    return raw.setActorAIDistance(distance);
}
pub fn setActorAIDuration(duration: u32) void {
    return raw.setActorAIDuration(duration);
}
pub fn setActorAIRepetition(should_repeat: bool) void {
    return raw.setActorAIRepetition(should_repeat);
}

pub fn equipActorItem(
    slot: EquipmentSlot,
    ref_id: [:0]const u8,
    count: u32,
    charge: i32,
    enchantment_charge: f64,
) void {
    return raw.equipActorItem(@intFromEnum(slot), ref_id, count, charge, enchantment_charge);
}
pub fn unequipActorItem(slot: EquipmentSlot) void {
    return raw.unequipActorItem(@intFromEnum(slot));
}

pub fn addActorSpellActive(
    spell_id: [:0]const u8,
    display_name: [:0]const u8,
    stacking_state: bool,
) void {
    return raw.addActorSpellActive(spell_id, display_name, stacking_state);
}
pub fn addActorSpellActiveEffect(
    effect_id: u32,
    magnitude: f64,
    duration: f64,
    time_left: f64,
    arg: i32,
) void {
    return raw.addActorSpellActiveEffect(effect_id, magnitude, duration, time_left, arg);
}

pub fn addActor() void {
    return raw.addActor();
}

pub fn sendActorList() void {
    return raw.sendActorList();
}
pub fn sendActorAuthority() void {
    return raw.sendActorAuthority();
}
pub fn sendActorPosition(send_to_other_visitors: bool, skip_attached_player: bool) void {
    return raw.sendActorPosition(send_to_other_visitors, skip_attached_player);
}
pub fn sendActorStatsDynamic(send_to_other_visitors: bool, skip_attached_player: bool) void {
    return raw.sendActorStatsDynamic(send_to_other_visitors, skip_attached_player);
}
pub fn sendActorEquipment(send_to_other_visitors: bool, skip_attached_player: bool) void {
    return raw.sendActorEquipment(send_to_other_visitors, skip_attached_player);
}
pub fn sendActorSpellsActiveChanges(
    send_to_other_visitors: bool,
    skip_attached_player: bool,
) void {
    return raw.sendActorSpellsActiveChanges(send_to_other_visitors, skip_attached_player);
}
pub fn sendActorSpeech(send_to_other_visitors: bool, skip_attached_player: bool) void {
    return raw.sendActorSpeech(send_to_other_visitors, skip_attached_player);
}
pub fn sendActorDeath(send_to_other_visitors: bool, skip_attached_player: bool) void {
    return raw.sendActorDeath(send_to_other_visitors, skip_attached_player);
}
pub fn sendActorAI(send_to_other_visitors: bool, skip_attached_player: bool) void {
    return raw.sendActorAI(send_to_other_visitors, skip_attached_player);
}
pub fn sendActorCellChange(send_to_other_visitors: bool, skip_attached_player: bool) void {
    return raw.sendActorCellChange(send_to_other_visitors, skip_attached_player);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_ReadReceivedActorList() callconv(.C) void;
    pub const readReceivedActorList = libtes3mp_ReadReceivedActorList;
    extern "libTES3MP-core" fn libtes3mp_ReadCellActorList(cell_description: [*:0]const u8) callconv(.C) void;
    pub const readCellActorList = libtes3mp_ReadCellActorList;

    extern "libTES3MP-core" fn libtes3mp_ClearActorList() callconv(.C) void;
    pub const clearActorList = libtes3mp_ClearActorList;
    extern "libTES3MP-core" fn libtes3mp_SetActorListPid(pid: c_ushort) callconv(.C) void;
    pub const setActorListPid = libtes3mp_SetActorListPid;

    extern "libTES3MP-core" fn libtes3mp_CopyReceivedActorListToStore() callconv(.C) void;
    pub const copyReceivedActorListToStore = libtes3mp_CopyReceivedActorListToStore;

    extern "libTES3MP-core" fn libtes3mp_GetActorListSize() callconv(.C) c_uint;
    pub const getActorListSize = libtes3mp_GetActorListSize;
    extern "libTES3MP-core" fn libtes3mp_GetActorListAction() callconv(.C) u8;
    pub const getActorListAction = libtes3mp_GetActorListAction;

    extern "libTES3MP-core" fn libtes3mp_GetActorCell(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getActorCell = libtes3mp_GetActorCell;
    extern "libTES3MP-core" fn libtes3mp_GetActorRefId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getActorRefId = libtes3mp_GetActorRefId;
    extern "libTES3MP-core" fn libtes3mp_GetActorRefNum(index: c_uint) callconv(.C) c_uint;
    pub const getActorRefNum = libtes3mp_GetActorRefNum;
    extern "libTES3MP-core" fn libtes3mp_GetActorMpNum(index: c_uint) callconv(.C) c_uint;
    pub const getActorMpNum = libtes3mp_GetActorMpNum;

    extern "libTES3MP-core" fn libtes3mp_GetActorPosX(index: c_uint) callconv(.C) f64;
    pub const getActorPosX = libtes3mp_GetActorPosX;
    extern "libTES3MP-core" fn libtes3mp_GetActorPosY(index: c_uint) callconv(.C) f64;
    pub const getActorPosY = libtes3mp_GetActorPosY;
    extern "libTES3MP-core" fn libtes3mp_GetActorPosZ(index: c_uint) callconv(.C) f64;
    pub const getActorPosZ = libtes3mp_GetActorPosZ;
    extern "libTES3MP-core" fn libtes3mp_GetActorRotX(index: c_uint) callconv(.C) f64;
    pub const getActorRotX = libtes3mp_GetActorRotX;
    extern "libTES3MP-core" fn libtes3mp_GetActorRotY(index: c_uint) callconv(.C) f64;
    pub const getActorRotY = libtes3mp_GetActorRotY;
    extern "libTES3MP-core" fn libtes3mp_GetActorRotZ(index: c_uint) callconv(.C) f64;
    pub const getActorRotZ = libtes3mp_GetActorRotZ;

    extern "libTES3MP-core" fn libtes3mp_GetActorHealthBase(index: c_uint) callconv(.C) f64;
    pub const getActorHealthBase = libtes3mp_GetActorHealthBase;
    extern "libTES3MP-core" fn libtes3mp_GetActorHealthCurrent(index: c_uint) callconv(.C) f64;
    pub const getActorHealthCurrent = libtes3mp_GetActorHealthCurrent;
    extern "libTES3MP-core" fn libtes3mp_GetActorHealthModified(index: c_uint) callconv(.C) f64;
    pub const getActorHealthModified = libtes3mp_GetActorHealthModified;
    extern "libTES3MP-core" fn libtes3mp_GetActorMagickaBase(index: c_uint) callconv(.C) f64;
    pub const getActorMagickaBase = libtes3mp_GetActorMagickaBase;
    extern "libTES3MP-core" fn libtes3mp_GetActorMagickaCurrent(index: c_uint) callconv(.C) f64;
    pub const getActorMagickaCurrent = libtes3mp_GetActorMagickaCurrent;
    extern "libTES3MP-core" fn libtes3mp_GetActorMagickaModified(index: c_uint) callconv(.C) f64;
    pub const getActorMagickaModified = libtes3mp_GetActorMagickaModified;
    extern "libTES3MP-core" fn libtes3mp_GetActorFatigueBase(index: c_uint) callconv(.C) f64;
    pub const getActorFatigueBase = libtes3mp_GetActorFatigueBase;
    extern "libTES3MP-core" fn libtes3mp_GetActorFatigueCurrent(index: c_uint) callconv(.C) f64;
    pub const getActorFatigueCurrent = libtes3mp_GetActorFatigueCurrent;
    extern "libTES3MP-core" fn libtes3mp_GetActorFatigueModified(index: c_uint) callconv(.C) f64;
    pub const getActorFatigueModified = libtes3mp_GetActorFatigueModified;

    extern "libTES3MP-core" fn libtes3mp_GetActorEquipmentItemRefId(index: c_uint, slot: c_ushort) callconv(.C) ?[*:0]const u8;
    pub const getActorEquipmentItemRefId = libtes3mp_GetActorEquipmentItemRefId;
    extern "libTES3MP-core" fn libtes3mp_GetActorEquipmentItemCount(index: c_uint, slot: c_ushort) callconv(.C) c_int;
    pub const getActorEquipmentItemCount = libtes3mp_GetActorEquipmentItemCount;
    extern "libTES3MP-core" fn libtes3mp_GetActorEquipmentItemCharge(index: c_uint, slot: c_ushort) callconv(.C) c_int;
    pub const getActorEquipmentItemCharge = libtes3mp_GetActorEquipmentItemCharge;
    extern "libTES3MP-core" fn libtes3mp_GetActorEquipmentItemEnchantmentCharge(index: c_uint, slot: c_ushort) callconv(.C) f64;
    pub const getActorEquipmentItemEnchantmentCharge = libtes3mp_GetActorEquipmentItemEnchantmentCharge;

    extern "libTES3MP-core" fn libtes3mp_DoesActorHavePlayerKiller(index: c_uint) callconv(.C) bool;
    pub const doesActorHavePlayerKiller = libtes3mp_DoesActorHavePlayerKiller;
    extern "libTES3MP-core" fn libtes3mp_GetActorKillerPid(index: c_uint) callconv(.C) c_int;
    pub const getActorKillerPid = libtes3mp_GetActorKillerPid;
    extern "libTES3MP-core" fn libtes3mp_GetActorKillerRefId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getActorKillerRefId = libtes3mp_GetActorKillerRefId;
    extern "libTES3MP-core" fn libtes3mp_GetActorKillerRefNum(index: c_uint) callconv(.C) c_uint;
    pub const getActorKillerRefNum = libtes3mp_GetActorKillerRefNum;
    extern "libTES3MP-core" fn libtes3mp_GetActorKillerMpNum(index: c_uint) callconv(.C) c_uint;
    pub const getActorKillerMpNum = libtes3mp_GetActorKillerMpNum;
    extern "libTES3MP-core" fn libtes3mp_GetActorKillerName(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getActorKillerName = libtes3mp_GetActorKillerName;
    extern "libTES3MP-core" fn libtes3mp_GetActorDeathState(index: c_uint) callconv(.C) c_uint;
    pub const getActorDeathState = libtes3mp_GetActorDeathState;

    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveChangesSize(actor_index: c_uint) callconv(.C) c_uint;
    pub const getActorSpellsActiveChangesSize = libtes3mp_GetActorSpellsActiveChangesSize;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveChangesAction(actor_index: c_uint) callconv(.C) c_uint;
    pub const getActorSpellsActiveChangesAction = libtes3mp_GetActorSpellsActiveChangesAction;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveId(actor_index: c_uint, spell_index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getActorSpellsActiveId = libtes3mp_GetActorSpellsActiveId;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveDisplayName(actor_index: c_uint, spell_index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getActorSpellsActiveDisplayName = libtes3mp_GetActorSpellsActiveDisplayName;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveStackingState(actor_index: c_uint, spell_index: c_uint) callconv(.C) bool;
    pub const getActorSpellsActiveStackingState = libtes3mp_GetActorSpellsActiveStackingState;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveEffectCount(actor_index: c_uint, spell_index: c_uint) callconv(.C) c_uint;
    pub const getActorSpellsActiveEffectCount = libtes3mp_GetActorSpellsActiveEffectCount;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveEffectId(actor_index: c_uint, spell_index: c_uint, effect_index: c_uint) callconv(.C) c_uint;
    pub const getActorSpellsActiveEffectId = libtes3mp_GetActorSpellsActiveEffectId;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveEffectArg(actor_index: c_uint, spell_index: c_uint, effect_index: c_uint) callconv(.C) c_int;
    pub const getActorSpellsActiveEffectArg = libtes3mp_GetActorSpellsActiveEffectArg;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveEffectMagnitude(actor_index: c_uint, spell_index: c_uint, effect_index: c_uint) callconv(.C) f64;
    pub const getActorSpellsActiveEffectMagnitude = libtes3mp_GetActorSpellsActiveEffectMagnitude;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveEffectDuration(actor_index: c_uint, spell_index: c_uint, effect_index: c_uint) callconv(.C) f64;
    pub const getActorSpellsActiveEffectDuration = libtes3mp_GetActorSpellsActiveEffectDuration;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveEffectTimeLeft(actor_index: c_uint, spell_index: c_uint, effect_index: c_uint) callconv(.C) f64;
    pub const getActorSpellsActiveEffectTimeLeft = libtes3mp_GetActorSpellsActiveEffectTimeLeft;

    extern "libTES3MP-core" fn libtes3mp_DoesActorSpellsActiveHavePlayerCaster(actor_index: c_uint, spell_index: c_uint) callconv(.C) bool;
    pub const doesActorSpellsActiveHavePlayerCaster = libtes3mp_DoesActorSpellsActiveHavePlayerCaster;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveCasterPid(actor_index: c_uint, spell_index: c_uint) callconv(.C) c_int;
    pub const getActorSpellsActiveCasterPid = libtes3mp_GetActorSpellsActiveCasterPid;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveCasterRefId(actor_index: c_uint, spell_index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getActorSpellsActiveCasterRefId = libtes3mp_GetActorSpellsActiveCasterRefId;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveCasterRefNum(actor_index: c_uint, spell_index: c_uint) callconv(.C) c_uint;
    pub const getActorSpellsActiveCasterRefNum = libtes3mp_GetActorSpellsActiveCasterRefNum;
    extern "libTES3MP-core" fn libtes3mp_GetActorSpellsActiveCasterMpNum(actor_index: c_uint, spell_index: c_uint) callconv(.C) c_uint;
    pub const getActorSpellsActiveCasterMpNum = libtes3mp_GetActorSpellsActiveCasterMpNum;

    extern "libTES3MP-core" fn libtes3mp_DoesActorHavePosition(index: c_uint) callconv(.C) bool;
    pub const doesActorHavePosition = libtes3mp_DoesActorHavePosition;
    extern "libTES3MP-core" fn libtes3mp_DoesActorHaveStatsDynamic(index: c_uint) callconv(.C) bool;
    pub const doesActorHaveStatsDynamic = libtes3mp_DoesActorHaveStatsDynamic;

    extern "libTES3MP-core" fn libtes3mp_SetActorListCell(cell_description: [*:0]const u8) callconv(.C) void;
    pub const setActorListCell = libtes3mp_SetActorListCell;
    extern "libTES3MP-core" fn libtes3mp_SetActorListAction(action: u8) callconv(.C) void;
    pub const setActorListAction = libtes3mp_SetActorListAction;

    extern "libTES3MP-core" fn libtes3mp_SetActorCell(cell_description: [*:0]const u8) callconv(.C) void;
    pub const setActorCell = libtes3mp_SetActorCell;
    extern "libTES3MP-core" fn libtes3mp_SetActorRefId(ref_id: [*:0]const u8) callconv(.C) void;
    pub const setActorRefId = libtes3mp_SetActorRefId;
    extern "libTES3MP-core" fn libtes3mp_SetActorRefNum(ref_num: c_int) callconv(.C) void;
    pub const setActorRefNum = libtes3mp_SetActorRefNum;
    extern "libTES3MP-core" fn libtes3mp_SetActorMpNum(mp_num: c_int) callconv(.C) void;
    pub const setActorMpNum = libtes3mp_SetActorMpNum;

    extern "libTES3MP-core" fn libtes3mp_SetActorPosition(x: f64, y: f64, z: f64) callconv(.C) void;
    pub const setActorPosition = libtes3mp_SetActorPosition;
    extern "libTES3MP-core" fn libtes3mp_SetActorRotation(x: f64, y: f64, z: f64) callconv(.C) void;
    pub const setActorRotation = libtes3mp_SetActorRotation;

    extern "libTES3MP-core" fn libtes3mp_SetActorHealthBase(value: f64) callconv(.C) void;
    pub const setActorHealthBase = libtes3mp_SetActorHealthBase;
    extern "libTES3MP-core" fn libtes3mp_SetActorHealthCurrent(value: f64) callconv(.C) void;
    pub const setActorHealthCurrent = libtes3mp_SetActorHealthCurrent;
    extern "libTES3MP-core" fn libtes3mp_SetActorHealthModified(value: f64) callconv(.C) void;
    pub const setActorHealthModified = libtes3mp_SetActorHealthModified;
    extern "libTES3MP-core" fn libtes3mp_SetActorMagickaBase(value: f64) callconv(.C) void;
    pub const setActorMagickaBase = libtes3mp_SetActorMagickaBase;
    extern "libTES3MP-core" fn libtes3mp_SetActorMagickaCurrent(value: f64) callconv(.C) void;
    pub const setActorMagickaCurrent = libtes3mp_SetActorMagickaCurrent;
    extern "libTES3MP-core" fn libtes3mp_SetActorMagickaModified(value: f64) callconv(.C) void;
    pub const setActorMagickaModified = libtes3mp_SetActorMagickaModified;
    extern "libTES3MP-core" fn libtes3mp_SetActorFatigueBase(value: f64) callconv(.C) void;
    pub const setActorFatigueBase = libtes3mp_SetActorFatigueBase;
    extern "libTES3MP-core" fn libtes3mp_SetActorFatigueCurrent(value: f64) callconv(.C) void;
    pub const setActorFatigueCurrent = libtes3mp_SetActorFatigueCurrent;
    extern "libTES3MP-core" fn libtes3mp_SetActorFatigueModified(value: f64) callconv(.C) void;
    pub const setActorFatigueModified = libtes3mp_SetActorFatigueModified;

    extern "libTES3MP-core" fn libtes3mp_SetActorSound(sound: [*:0]const u8) callconv(.C) void;
    pub const setActorSound = libtes3mp_SetActorSound;
    extern "libTES3MP-core" fn libtes3mp_SetActorDeathState(death_state: c_uint) callconv(.C) void;
    pub const setActorDeathState = libtes3mp_SetActorDeathState;
    extern "libTES3MP-core" fn libtes3mp_SetActorDeathInstant(is_instant: bool) callconv(.C) void;
    pub const setActorDeathInstant = libtes3mp_SetActorDeathInstant;
    extern "libTES3MP-core" fn libtes3mp_SetActorSpellsActiveAction(action: u8) callconv(.C) void;
    pub const setActorSpellsActiveAction = libtes3mp_SetActorSpellsActiveAction;

    extern "libTES3MP-core" fn libtes3mp_SetActorAIAction(action: c_uint) callconv(.C) void;
    pub const setActorAIAction = libtes3mp_SetActorAIAction;
    extern "libTES3MP-core" fn libtes3mp_SetActorAITargetToPlayer(pid: c_ushort) callconv(.C) void;
    pub const setActorAITargetToPlayer = libtes3mp_SetActorAITargetToPlayer;
    extern "libTES3MP-core" fn libtes3mp_SetActorAITargetToObject(ref_num: c_int, mp_num: c_int) callconv(.C) void;
    pub const setActorAITargetToObject = libtes3mp_SetActorAITargetToObject;
    extern "libTES3MP-core" fn libtes3mp_SetActorAICoordinates(x: f64, y: f64, z: f64) callconv(.C) void;
    pub const setActorAICoordinates = libtes3mp_SetActorAICoordinates;
    extern "libTES3MP-core" fn libtes3mp_SetActorAIDistance(distance: c_uint) callconv(.C) void;
    pub const setActorAIDistance = libtes3mp_SetActorAIDistance;
    extern "libTES3MP-core" fn libtes3mp_SetActorAIDuration(duration: c_uint) callconv(.C) void;
    pub const setActorAIDuration = libtes3mp_SetActorAIDuration;
    extern "libTES3MP-core" fn libtes3mp_SetActorAIRepetition(should_repeat: bool) callconv(.C) void;
    pub const setActorAIRepetition = libtes3mp_SetActorAIRepetition;

    extern "libTES3MP-core" fn libtes3mp_EquipActorItem(slot: c_ushort, ref_id: [*:0]const u8, count: c_uint, charge: c_int, enchantment_charge: f64) callconv(.C) void;
    pub const equipActorItem = libtes3mp_EquipActorItem;
    extern "libTES3MP-core" fn libtes3mp_UnequipActorItem(slot: c_ushort) callconv(.C) void;
    pub const unequipActorItem = libtes3mp_UnequipActorItem;

    extern "libTES3MP-core" fn libtes3mp_AddActorSpellActive(spell_id: [*:0]const u8, display_name: [*:0]const u8, stacking_state: bool) callconv(.C) void;
    pub const addActorSpellActive = libtes3mp_AddActorSpellActive;
    extern "libTES3MP-core" fn libtes3mp_AddActorSpellActiveEffect(effect_id: c_int, magnitude: f64, duration: f64, time_left: f64, arg: c_int) callconv(.C) void;
    pub const addActorSpellActiveEffect = libtes3mp_AddActorSpellActiveEffect;

    extern "libTES3MP-core" fn libtes3mp_AddActor() callconv(.C) void;
    pub const addActor = libtes3mp_AddActor;

    extern "libTES3MP-core" fn libtes3mp_SendActorList() callconv(.C) void;
    pub const sendActorList = libtes3mp_SendActorList;
    extern "libTES3MP-core" fn libtes3mp_SendActorAuthority() callconv(.C) void;
    pub const sendActorAuthority = libtes3mp_SendActorAuthority;
    extern "libTES3MP-core" fn libtes3mp_SendActorPosition(send_to_other_visitors: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendActorPosition = libtes3mp_SendActorPosition;
    extern "libTES3MP-core" fn libtes3mp_SendActorStatsDynamic(send_to_other_visitors: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendActorStatsDynamic = libtes3mp_SendActorStatsDynamic;
    extern "libTES3MP-core" fn libtes3mp_SendActorEquipment(send_to_other_visitors: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendActorEquipment = libtes3mp_SendActorEquipment;
    extern "libTES3MP-core" fn libtes3mp_SendActorSpellsActiveChanges(send_to_other_visitors: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendActorSpellsActiveChanges = libtes3mp_SendActorSpellsActiveChanges;
    extern "libTES3MP-core" fn libtes3mp_SendActorSpeech(send_to_other_visitors: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendActorSpeech = libtes3mp_SendActorSpeech;
    extern "libTES3MP-core" fn libtes3mp_SendActorDeath(send_to_other_visitors: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendActorDeath = libtes3mp_SendActorDeath;
    extern "libTES3MP-core" fn libtes3mp_SendActorAI(send_to_other_visitors: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendActorAI = libtes3mp_SendActorAI;
    extern "libTES3MP-core" fn libtes3mp_SendActorCellChange(send_to_other_visitors: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendActorCellChange = libtes3mp_SendActorCellChange;
};
