const std = @import("std");

pub const ActorListAction = enum(u2) {
    Set,
    Add,
    Remove,
    Request,
};

pub const SpellsActiveAction = enum(u2) {
    Set,
    Add,
    Remove,
};

pub const EquipmentSlot = enum(u5) {
    Helmet,
    Cuirass,
    Greaves,
    LeftPauldron,
    RightPauldron,
    LeftGauntlet,
    RightGauntlet,
    Boots,
    Shirt,
    Pants,
    Skirt,
    Robe,
    LeftRing,
    RightRing,
    Amulet,
    Belt,
    CarriedRight,
    CarriedLeft,
    Ammunition,
};

pub fn readReceivedActorList() void {
    return impl_ReadReceivedActorList();
}
pub fn readCellActorList(cell_description: [:0]const u8) void {
    return impl_ReadCellActorList(cell_description);
}
pub fn clearActorList() void {
    return impl_ClearActorList();
}
pub fn setActorListPid(pid: c_ushort) void {
    return impl_SetActorListPid(pid);
}
pub fn copyReceivedActorListToStore() void {
    return impl_CopyReceivedActorListToStore();
}
pub fn getActorListSize() c_uint {
    return impl_GetActorListSize();
}
pub fn getActorListAction() ActorListAction {
    return @enumFromInt(ActorListAction, impl_GetActorListAction());
}
pub fn getActorCell(index: c_uint) [:0]const u8 {
    std.debug.assert(getActorListSize() > index);

    return std.mem.span(impl_GetActorCell(index).?);
}
pub fn getActorRefId(index: c_uint) [:0]const u8 {
    std.debug.assert(getActorListSize() > index);

    return std.mem.span(impl_GetActorRefId(index).?);
}
pub fn getActorRefNum(index: c_uint) c_uint {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorRefNum(index);
}
pub fn getActorMpNum(index: c_uint) c_uint {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorMpNum(index);
}
pub fn getActorPosX(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorPosX(index);
}
pub fn getActorPosY(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorPosY(index);
}
pub fn getActorPosZ(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorPosZ(index);
}
pub fn getActorRotX(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorRotX(index);
}
pub fn getActorRotY(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorRotY(index);
}
pub fn getActorRotZ(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorRotZ(index);
}
pub fn getActorHealthBase(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorHealthBase(index);
}
pub fn getActorHealthCurrent(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorHealthCurrent(index);
}
pub fn getActorHealthModified(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorHealthModified(index);
}
pub fn getActorMagickaBase(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorMagickaBase(index);
}
pub fn getActorMagickaCurrent(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorMagickaCurrent();
}
pub fn getActorMagickaModified(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorMagickaModified(index);
}
pub fn getActorFatigueBase(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorFatigueBase(index);
}
pub fn getActorFatigueCurrent(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorFatigueCurrent(index);
}
pub fn getActorFatigueModified(index: c_uint) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorFatigueModified(index);
}
/// TODO: make an enum for slots
pub fn getActorEquipmentItemRefId(
    index: c_uint,
    slot: EquipmentSlot,
) [:0]const u8 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorEquipmentItemRefId(index, @intFromEnum(slot));
}
pub fn getActorEquipmentItemCount(index: c_uint, slot: EquipmentSlot) c_int {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorEquipmentItemCount(index, @intFromEnum(slot));
}
pub fn getActorEquipmentItemCharge(index: c_uint, slot: EquipmentSlot) c_int {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorEquipmentItemCharge(index, @intFromEnum(slot));
}
pub fn getActorEquipmentItemEnchantmentCharge(index: c_uint, slot: EquipmentSlot) f32 {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorEquipmentItemEnchantmentCharge(index, @intFromEnum(slot));
}
pub fn doesActorHavePlayerKiller(index: c_uint) bool {
    std.debug.assert(getActorListSize() > index);

    return impl_DoesActorHavePlayerKiller(index);
}
pub fn getActorKillerPid(index: c_uint) c_int {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorKillerPid(index);
}
pub fn getActorKillerRefId(index: c_uint) [:0]const u8 {
    std.debug.assert(getActorListSize() > index);

    return std.mem.span(impl_GetActorKillerRefId(index).?);
}
pub fn getActorKillerRefNum(index: c_uint) c_uint {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorKillerRefNum(index);
}
pub fn getActorKillerMpNum(index: c_uint) c_uint {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorKillerMpNum(index);
}
pub fn getActorKillerName(index: c_uint) [:0]const u8 {
    std.debug.assert(getActorListSize() > index);

    return std.mem.span(impl_GetActorKillerName(index).?);
}
pub fn getActorDeathState(index: c_uint) c_uint {
    std.debug.assert(getActorListSize() > index);

    return impl_GetActorDeathState(index);
}
pub fn getActorSpellsActiveChangesSize(actor_index: c_uint) c_uint {
    std.debug.assert(getActorListSize() > actor_index);

    return impl_GetActorSpellsActiveChangesSize(actor_index);
}
pub fn getActorSpellsActiveChangesAction(actor_index: c_uint) SpellsActiveAction {
    std.debug.assert(getActorListSize() > actor_index);

    return @enumFromInt(SpellsActiveAction, impl_GetActorSpellsActiveChangesAction(actor_index));
}
pub fn getActorSpellsActiveId(actor_index: c_uint, spell_index: c_uint) [:0]const u8 {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);

    return std.mem.span(impl_GetActorSpellsActiveId(actor_index, spell_index).?);
}
pub fn getActorSpellsActiveDisplayName(actor_index: c_uint, spell_index: c_uint) [:0]const u8 {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);

    return std.mem.span(impl_GetActorSpellsActiveDisplayName(actor_index, spell_index).?);
}
pub fn getActorSpellsActiveStackingState(actor_index: c_uint, spell_index: c_uint) bool {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);

    return impl_GetActorSpellsActiveStackingState(actor_index, spell_index);
}
pub fn getActorSpellsActiveEffectCount(actor_index: c_uint, spell_index: c_uint) c_uint {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);

    return impl_GetActorSpellsActiveEffectCount(actor_index, spell_index);
}
pub fn getActorSpellsActiveEffectId(
    actor_index: c_uint,
    spell_index: c_uint,
    effect_index: c_uint,
) c_uint {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);
    std.debug.assert(getActorSpellsActiveEffectCount() > effect_index);

    return impl_GetActorSpellsActiveEffectId(actor_index, spell_index, effect_index);
}
pub fn getActorSpellsActiveEffectArg(
    actor_index: c_uint,
    spell_index: c_uint,
    effect_index: c_uint,
) [:0]const u8 {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);
    std.debug.assert(getActorSpellsActiveEffectCount() > effect_index);

    return std.mem.span(impl_GetActorSpellsActiveEffectArg(
        actor_index,
        spell_index,
        effect_index,
    ).?);
}
pub fn getActorSpellsActiveEffectMagnitude(
    actor_index: c_uint,
    spell_index: c_uint,
    effect_index: c_uint,
) f32 {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);
    std.debug.assert(getActorSpellsActiveEffectCount() > effect_index);

    return impl_GetActorSpellsActiveEffectMagnitude(actor_index, spell_index, effect_index);
}
pub fn getActorSpellsActiveEffectDuration(
    actor_index: c_uint,
    spell_index: c_uint,
    effect_index: c_uint,
) f32 {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);
    std.debug.assert(getActorSpellsActiveEffectCount() > effect_index);

    return impl_GetActorSpellsActiveEffectDuration(actor_index, spell_index, effect_index);
}
pub fn getActorSpellsActiveEffectTimeLeft(
    actor_index: c_uint,
    spell_index: c_uint,
    effect_index: c_uint,
) f32 {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);
    std.debug.assert(getActorSpellsActiveEffectCount() > effect_index);

    return impl_GetActorSpellsActiveEffectTimeLeft(actor_index, spell_index, effect_index);
}
pub fn doesActorSpellsActiveHavePlayerCaster(actor_index: c_uint, spell_index: c_uint) bool {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);

    return impl_DoesActorSpellsActiveHavePlayerCaster(actor_index, spell_index);
}
pub fn getActorSpellsActiveCasterPid(actor_index: c_uint, spell_index: c_uint) c_int {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);

    return impl_GetActorSpellsActiveCasterPid(actor_index, spell_index);
}
pub fn getActorSpellsActiveCasterRefId(actor_index: c_uint, spell_index: c_uint) [:0]const u8 {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);

    return std.mem.span(impl_GetActorSpellsActiveCasterRefId(actor_index, spell_index).?);
}
pub fn getActorSpellsActiveCasterRefNum(actor_index: c_uint, spell_index: c_uint) c_uint {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);

    return impl_GetActorSpellsActiveCasterRefNum(actor_index, spell_index);
}
pub fn getActorSpellsActiveCasterMpNum(actor_index: c_uint, spell_index: c_uint) c_uint {
    std.debug.assert(getActorListSize() > actor_index);
    std.debug.assert(getActorSpellsActiveChangesSize(actor_index) > spell_index);

    return impl_GetActorSpellsActiveCasterMpNum(actor_index, spell_index);
}
pub fn doesActorHavePosition(index: c_uint) bool {
    std.debug.assert(getActorListSize() > index);

    return impl_DoesActorHavePosition(index);
}
pub fn doesActorHaveStatsDynamic(index: c_uint) bool {
    std.debug.assert(getActorListSize() > index);

    return impl_DoesActorHaveStatsDynamic(index);
}
pub fn setActorListCell(cell_description: [:0]const u8) void {
    return impl_SetActorListCell(cell_description);
}
pub fn setActorListAction(action: ActorListAction) void {
    return impl_SetActorListAction(@intFromEnum(action));
}
pub fn setActorCell(cell_description: [:0]const u8) void {
    return impl_SetActorCell(cell_description);
}
pub fn setActorRefId(ref_id: [:0]const u8) void {
    return impl_SetActorRefId(ref_id);
}
pub fn setActorRefNum(ref_num: c_int) void {
    return impl_SetActorRefNum(ref_num);
}
pub fn setActorMpNum(mp_num: c_uint) void {
    return impl_SetActorMpNum(mp_num);
}
pub fn setActorPosition(x: f32, y: f32, z: f32) void {
    return impl_SetActorPosition(x, y, z);
}
pub fn setActorRotation(x: f32, y: f32, z: f32) void {
    return impl_SetActorRotation(x, y, z);
}
pub fn setActorHealthBase(health_base: f32) void {
    return impl_SetActorHealthBase(health_base);
}
pub fn setActorHealthCurrent(health_current: f32) void {
    return impl_SetActorHealthCurrent(health_current);
}
pub fn setActorHealthModified(health_modified: f32) void {
    return impl_SetActorHealthModified(health_modified);
}
pub fn setActorMagickaBase(magicka_base: f32) void {
    return impl_SetActorMagickaBase(magicka_base);
}
pub fn setActorMagickaCurrent(magicka_current: f32) void {
    return impl_SetActorMagickaCurrent(magicka_current);
}
pub fn setActorMagickaModified(magicka_modified: f32) void {
    return impl_SetActorMagickaModified(magicka_modified);
}
pub fn setActorFatigueBase(fatigue_base: f32) void {
    return impl_SetActorFatigueBase(fatigue_base);
}
pub fn setActorFatigueCurrent(fatigue_current: f32) void {
    return impl_SetActorFatigueCurrent(fatigue_current);
}
pub fn setActorFatigueModified(fatigue_modified: f32) void {
    return impl_SetActorFatigueModified(fatigue_modified);
}
pub fn setActorSound(sound: [:0]const u8) void {
    return impl_SetActorSound(sound);
}
pub fn setActorDeathState(death_state: c_uint) void {
    return impl_SetActorDeathState(death_state);
}
pub fn setActorDeathInstant(is_instant: bool) void {
    return impl_SetActorDeathInstant(is_instant);
}
pub fn setActorSpellsActiveAction(action: SpellsActiveAction) void {
    return impl_SetActorSpellsActiveAction(@intFromEnum(action));
}
pub fn setActorAIAction(action: c_uint) void {
    return impl_SetActorAIAction(action);
}
pub fn setActorAITargetToPlayer(pid: c_ushort) void {
    return impl_SetActorAITargetToPlayer(pid);
}
pub fn setActorAITargetToObject(ref_num: c_int, mp_num: c_int) void {
    return impl_SetActorAITargetToObject(ref_num, mp_num);
}
pub fn setActorAICoordinates(x: f32, y: f32, z: f32) void {
    return impl_SetActorAICoordinates(x, y, z);
}
pub fn setActorAIDistance(distance: c_uint) void {
    return impl_SetActorAIDistance(distance);
}
pub fn setActorAIDuration(duration: c_uint) void {
    return impl_SetActorAIDuration(duration);
}
pub fn setActorAIRepetition(should_repeat: bool) void {
    return impl_SetActorAIRepetition(should_repeat);
}
pub fn equipActorItem(
    slot: EquipmentSlot,
    ref_id: [:0]const u8,
    count: c_uint,
    charge: c_int,
    enchantment_charge: f32,
) void {
    return impl_EquipActorItem(@intFromEnum(slot), ref_id, count, charge, enchantment_charge);
}
pub fn unequipActorItem(slot: EquipmentSlot) void {
    return impl_UnequipActorItem(@intFromEnum(slot));
}
pub fn addActorSpellActive(
    spell_id: [:0]const u8,
    display_name: [:0]const u8,
    stacking_state: bool,
) void {
    return impl_AddActorSpellActive(spell_id, display_name, stacking_state);
}
pub fn addActorSpellActiveEffect(
    effect_id: c_int,
    magnitude: f32,
    duration: f32,
    time_left: f32,
    arg: c_int,
) void {
    return impl_AddActorSpellActiveEffect(effect_id, magnitude, duration, time_left, arg);
}
pub fn addActor() void {
    return impl_AddActor();
}
pub fn sendActorList() void {
    return impl_SendActorList();
}
pub fn sendActorAuthority() void {
    return impl_SendActorAuthority();
}
pub fn sendActorPosition(for_other_visitors: bool, skip_attached_player: bool) void {
    return impl_SendActorPosition(for_other_visitors, skip_attached_player);
}
pub fn sendActorStatsDynamic(for_other_visitors: bool, skip_attached_player: bool) void {
    return impl_SendActorStatsDynamic(for_other_visitors, skip_attached_player);
}
pub fn sendActorEquipment(for_other_visitors: bool, skip_attached_player: bool) void {
    return impl_SendActorEquipment(for_other_visitors, skip_attached_player);
}
pub fn sendActorSpellsActiveChanges(for_other_visitors: bool, skip_attached_player: bool) void {
    return impl_SendActorSpellsActiveChanges(for_other_visitors, skip_attached_player);
}
pub fn sendActorSpeech(for_other_visitors: bool, skip_attached_player: bool) void {
    return impl_SendActorSpeech(for_other_visitors, skip_attached_player);
}
pub fn sendActorDeath(for_other_visitors: bool, skip_attached_player: bool) void {
    return impl_SendActorDeath(for_other_visitors, skip_attached_player);
}
pub fn sendActorAI(for_other_visitors: bool, skip_attached_player: bool) void {
    return impl_SendActorAI(for_other_visitors, skip_attached_player);
}
pub fn sendActorCellChange(for_other_visitors: bool, skip_attached_player: bool) void {
    return impl_SendActorCellChange(for_other_visitors, skip_attached_player);
}

extern "libTES3MP-core" fn impl_ReadReceivedActorList() callconv(.C) void;
extern "libTES3MP-core" fn impl_ReadCellActorList([*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_ClearActorList() callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorListPid(c_ushort) callconv(.C) void;
extern "libTES3MP-core" fn impl_CopyReceivedActorListToStore() callconv(.C) void;
extern "libTES3MP-core" fn impl_GetActorListSize() callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorListAction() callconv(.C) u8;
extern "libTES3MP-core" fn impl_GetActorCell(c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetActorRefId(c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetActorRefNum(c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorMpNum(c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorPosX(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorPosY(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorPosZ(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorRotX(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorRotY(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorRotZ(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorHealthBase(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorHealthCurrent(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorHealthModified(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorMagickaBase(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorMagickaCurrent(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorMagickaModified(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorFatigueBase(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorFatigueCurrent(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorFatigueModified(c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorEquipmentItemRefId(c_uint, c_ushort) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetActorEquipmentItemCount(c_uint, c_ushort) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetActorEquipmentItemCharge(c_uint, c_ushort) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetActorEquipmentItemEnchantmentCharge(c_uint, c_ushort) callconv(.C) f64;
extern "libTES3MP-core" fn impl_DoesActorHavePlayerKiller(c_uint) callconv(.C) bool;
extern "libTES3MP-core" fn impl_GetActorKillerPid(c_uint) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetActorKillerRefId(c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetActorKillerRefNum(c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorKillerMpNum(c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorKillerName(c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetActorDeathState(c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveChangesSize(c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveChangesAction(c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveId(c_uint, c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveDisplayName(c_uint, c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveStackingState(c_uint, c_uint) callconv(.C) bool;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveEffectCount(c_uint, c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveEffectId(c_uint, c_uint, c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveEffectArg(c_uint, c_uint, c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveEffectMagnitude(c_uint, c_uint, c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveEffectDuration(c_uint, c_uint, c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveEffectTimeLeft(c_uint, c_uint, c_uint) callconv(.C) f64;
extern "libTES3MP-core" fn impl_DoesActorSpellsActiveHavePlayerCaster(c_uint, c_uint) callconv(.C) bool;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveCasterPid(c_uint, c_uint) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveCasterRefId(c_uint, c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveCasterRefNum(c_uint, c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetActorSpellsActiveCasterMpNum(c_uint, c_uint) callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_DoesActorHavePosition(c_uint) callconv(.C) bool;
extern "libTES3MP-core" fn impl_DoesActorHaveStatsDynamic(c_uint) callconv(.C) bool;
extern "libTES3MP-core" fn impl_SetActorListCell([*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorListAction(u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorCell([*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorRefId([*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorRefNum(c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorMpNum(c_uint) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorPosition(f64, f64, f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorRotation(f64, f64, f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorHealthBase(f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorHealthCurrent(f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorHealthModified(f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorMagickaBase(f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorMagickaCurrent(f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorMagickaModified(f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorFatigueBase(f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorFatigueCurrent(f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorFatigueModified(f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorSound([*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorDeathState(c_uint) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorDeathInstant(bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorSpellsActiveAction(u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorAIAction(c_uint) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorAITargetToPlayer(c_ushort) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorAITargetToObject(c_int, c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorAICoordinates(f64, f64, f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorAIDistance(c_uint) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorAIDuration(c_uint) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorAIRepetition(bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_EquipActorItem(c_ushort, [*:0]const u8, c_uint, c_int, f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_UnequipActorItem(c_ushort) callconv(.C) void;
extern "libTES3MP-core" fn impl_AddActorSpellActive([*:0]const u8, [*:0]const u8, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_AddActorSpellActiveEffect(c_int, f64, f64, f64, c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_AddActor() callconv(.C) void;
extern "libTES3MP-core" fn impl_SendActorList() callconv(.C) void;
extern "libTES3MP-core" fn impl_SendActorAuthority() callconv(.C) void;
extern "libTES3MP-core" fn impl_SendActorPosition(bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendActorStatsDynamic(bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendActorEquipment(bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendActorSpellsActiveChanges(bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendActorSpeech(bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendActorDeath(bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendActorAI(bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendActorCellChange(bool, bool) callconv(.C) void;
