const std = @import("std");

const shared = @import("shared.zig");

pub const ObjectListOrigin = enum(u3) {
    client_gameplay,
    client_console,
    client_dialogue,
    client_script_local,
    client_script_global,
    server_script,
};

// Kept separate from ActorListAction for easier refactoring, in case they become distinct enums
// in the future.
pub const ObjectListAction = enum(u2) {
    set,
    add,
    remove,
    request,
};

pub const ContainerSubAction = enum(u3) {
    none,
    drag,
    drop,
    take_all,
    reply_to_request,
    restock_result,
};

pub const VariableType = enum(u3) {
    short,
    long,
    float,
    int,
    string,
};

pub const DialogueChoice = enum(u4) {
    topic,
    persuasion,
    companion_share,
    barter,
    spells,
    travel,
    spellmaking,
    enchanting,
    training,
    repair,
};

pub fn readReceivedObjectList() void {
    return raw.readReceivedObjectList();
}

pub fn clearObjectList() void {
    return raw.clearObjectList();
}
pub fn setObjectListPid(pid: u16) void {
    return raw.setObjectListPid(pid);
}

pub fn copyReceivedObjectListToStore() void {
    return raw.copyReceivedObjectListToStore();
}

pub fn getObjectListSize() u32 {
    return raw.getObjectLIstSize();
}
pub fn getObjectListOrigin() ObjectListOrigin {
    return @enumFromInt(raw.getObjectListOrigin());
}
pub fn getObjectListClientScript() [:0]const u8 {
    return std.mem.span(raw.getObjectListClientScript().?);
}
pub fn getObjectListAction() ObjectListAction {
    return @enumFromInt(raw.getObjectListAction());
}
pub fn getObjectListConsoleCommand() [:0]const u8 {
    return std.mem.span(raw.getObjectListConsoleCommand().?);
}
pub fn getObjectListContainerSubAction() ContainerSubAction {
    return @enumFromInt(raw.getObjectListContainerSubAction());
}

pub fn isObjectPlayer(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.isObjectPlayer(index);
}
pub fn getObjectPid(index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.isObjectPlayer(index));

    return raw.getObjectPid(index);
}
pub fn getObjectRefId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return std.mem.span(raw.getObjectRefId(index).?);
}
pub fn getObjectRefNum(index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectRefNum(index);
}
pub fn getObjectMpNum(index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectMpNum(index);
}
pub fn getObjectCount(index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectCount(index);
}
pub fn getObjectCharge(index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectCharge(index);
}
pub fn getObjectEnchantmentCharge(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectEnchantmentCharge(index);
}
pub fn getObjectSoul(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return std.mem.span(raw.getObjectSoul(index).?);
}
pub fn getObjectGoldValue(index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectGoldValue(index);
}
pub fn getObjectScale(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectScale(index);
}
pub fn getObjectSoundId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return std.mem.span(raw.getObjectSoundId(index).?);
}
pub fn getObjectState(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectState(index);
}
pub fn getObjectDoorState(index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectDoorState(index);
}
pub fn getObjectLockLevel(index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectLockLevel(index);
}
pub fn getObjectDialogueChoiceType(index: u32) DialogueChoice {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return @enumFromInt(raw.getObjectDialogueChoiceType(index));
}
pub fn getObjectDialogueChoiceTopic(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return std.mem.span(raw.getObjectDialogueChoiceTopic(index).?);
}
pub fn getObjectGoldPool(index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectGoldPool(index);
}
pub fn getObjectLastGoldRestockHour(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectLastGoldRestockHour(index);
}
pub fn getObjectLastGoldRestockDay(index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.isObjectPlayer(index));

    return raw.getObjectLastGoldRestockDay(index);
}

pub fn doesObjectHavePlayerActivating(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.doesObjectHavePlayerActivating(index);
}
pub fn getObjectActivatingPid(index: u32) u16 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.doesObjectHavePlayerActivating(index));

    return @intCast(raw.getObjectActivatingPid(index));
}
pub fn getObjectActivatingRefId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.doesObjectHavePlayerActivating(index));

    return std.mem.span(raw.getObjectActivatingRefId(index).?);
}
pub fn getObjectActivatingRefNum(index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.doesObjectHavePlayerActivating(index));

    return raw.getObjectActivatingRefNum(index);
}
pub fn getObjectActivatingMpNum(index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.doesObjectHavePlayerActivating(index));

    return raw.getObjectActivatingMpNum(index);
}
pub fn getObjectActivatingName(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.doesObjectHavePlayerActivating(index));

    return raw.getObjectActivatingName(index);
}

pub fn getObjectHitSuccess(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectHitSuccess(index);
}
pub fn getObjectHitDamage(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectHitDamage(index);
}
pub fn getObjectHitBlock(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectHitBlock(index);
}
pub fn getObjectHitKnockdown(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectHitKnockdown(index);
}
pub fn doesObjectHavePlayerHitting(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.doesObjectHavePlayerHitting(index);
}
pub fn getObjectHittingPid(index: u32) u16 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.doesObjectHavePlayerHitting(index));

    return @intCast(raw.getObjectHittingPid(index));
}
pub fn getObjectHittingRefId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.doesObjectHavePlayerHitting(index));

    return std.mem.span(raw.getObjectHittingRefId(index).?);
}
pub fn getObjectHittingRefNum(index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.doesObjectHavePlayerHitting(index));

    return raw.getObjectHittingRefNum(index);
}
pub fn getObjectHittingMpNum(index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.doesObjectHavePlayerHitting(index));

    return raw.getObjectHittingMpNum(index);
}
pub fn getObjectHittingName(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(!raw.doesObjectHavePlayerHitting(index));

    return std.mem.span(raw.getObjectHittingName(index).?);
}

pub fn getObjectSummonState(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectSummonState(index);
}
pub fn getObjectSummonEffectId(index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.getObjectSummonState(index));

    // For some reason, the raw function returns a double, but it's actually an int.
    return @intFromFloat(raw.getObjectSummonEffectId(index));
}
pub fn getObjectSummonSpellId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.getObjectSummonState(index));

    return std.mem.span(raw.getObjectSummonSpellId(index).?);
}
pub fn getObjectSummonDuration(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.getObjectSummonState(index));

    return raw.getObjectSummonDuration(index);
}
pub fn doesObjectHavePlayerSummoner(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.getObjectSummonState(index));

    return raw.doesObjectHavePlayerSummoner(index);
}
pub fn getObjectSummonerPid(index: u32) u16 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.getObjectSummonState(index));
    std.debug.assert(raw.doesObjectHavePlayerSummoner(index));

    return @intCast(raw.getObjectSummonerPid(index));
}
pub fn getObjectSummonerRefId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.getObjectSummonState(index));
    std.debug.assert(!raw.doesObjectHavePlayerSummoner(index));

    return std.mem.span(raw.getObjectSummonerRefId(index).?);
}
pub fn getObjectSummonerRefNum(index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.getObjectSummonState(index));
    std.debug.assert(!raw.doesObjectHavePlayerSummoner(index));

    return raw.getObjectSummonerRefNum(index);
}
pub fn getObjectSummonerMpNum(index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), index);
    std.debug.assert(raw.getObjectSummonState(index));
    std.debug.assert(!raw.doesObjectHavePlayerSummoner(index));

    return raw.getObjectSummonerMpNum(index);
}

pub fn getObjectPosX(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectPosX(index);
}
pub fn getObjectPosY(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectPosY(index);
}
pub fn getObjectPosZ(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectPosZ(index);
}
pub fn getObjectRotX(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectRotX(index);
}
pub fn getObjectRotY(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectRotY(index);
}
pub fn getObjectRotZ(index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.getObjectRotZ(index);
}

pub fn getVideoFilename(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return std.mem.span(raw.getVideoFilename(index).?);
}

pub fn getClientLocalsSize(object_index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), object_index);

    return raw.getClientLocalsSize(object_index);
}
pub fn getClientLocalInternalIndex(object_index: u32, variable_index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), object_index);
    shared.triggerSafetyCheck(raw.getClientLocalsSize(object_index), variable_index);

    return raw.getClientLocalsInternalIndex(object_index, variable_index);
}
pub fn getClientLocalValue(object_index: u32, variable_index: u32) union(enum) {
    short: i16,
    long: i32,
    float: f32,
} {
    shared.triggerSafetyCheck(getObjectListSize(), object_index);
    shared.triggerSafetyCheck(raw.getClientLocalsSize(object_index), variable_index);

    return switch (@as(VariableType, @enumFromInt(raw.getClientLocalVariableType))) {
        .short => .{ .short = @intCast(raw.getClientLocalIntValue(object_index, variable_index)) },
        .long => .{ .long = @intCast(raw.getClientLocalIntValue(object_index, variable_index)) },
        .float => .{ .float = @intCast(raw.getClientFloatValue(object_index, variable_index)) },
    };
}

pub fn getContainerChangesSize(object_index: u32) u32 {
    shared.triggerSafetyCheck(getObjectListSize(), object_index);

    return raw.getContainerChangesSize(object_index);
}
pub fn getContainerItemRefId(object_index: u32, item_index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), object_index);
    shared.triggerSafetyCheck(getContainerChangesSize(object_index), item_index);

    return std.mem.span(raw.getContainerItemRefId(object_index, item_index).?);
}
pub fn getContainerItemCount(object_index: u32, item_index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), object_index);
    shared.triggerSafetyCheck(getContainerChangesSize(object_index), item_index);

    return raw.getContainerItemCount(object_index, item_index);
}
pub fn getContainerItemCharge(object_index: u32, item_index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), object_index);
    shared.triggerSafetyCheck(getContainerChangesSize(object_index), item_index);

    return raw.getContainerItemCharge(object_index, item_index);
}
pub fn getContainerItemEnchantmentCharge(object_index: u32, item_index: u32) f64 {
    shared.triggerSafetyCheck(getObjectListSize(), object_index);
    shared.triggerSafetyCheck(getContainerChangesSize(object_index), item_index);

    return raw.getContainerItemEnchantmentCharge(object_index, item_index);
}
pub fn getContainerItemSoul(object_index: u32, item_index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getObjectListSize(), object_index);
    shared.triggerSafetyCheck(getContainerChangesSize(object_index), item_index);

    return std.mem.span(raw.getContainerItemSoul(object_index, item_index).?);
}
pub fn getContainerItemActionCount(object_index: u32, item_index: u32) i32 {
    shared.triggerSafetyCheck(getObjectListSize(), object_index);
    shared.triggerSafetyCheck(getContainerChangesSize(object_index), item_index);

    return raw.getContainerItemActionCount(object_index, item_index);
}

pub fn doesObjectHaveContainer(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.doesObjectHaveContainer(index);
}
pub fn isObjectDroppedByPlayer(index: u32) bool {
    shared.triggerSafetyCheck(getObjectListSize(), index);

    return raw.isObjectDroppedByPlayer(index);
}

pub fn setObjectListCell(cell_description: [:0]const u8) void {
    return raw.setObjectListCell(cell_description);
}
pub fn setObjectListAction(action: ObjectListAction) void {
    return raw.setObjectListAction(@intFromEnum(action));
}
pub fn setObjectListContainerSubAction(sub_action: ContainerSubAction) void {
    return raw.setObjectListContainerSubAction(@intFromEnum(sub_action));
}
pub fn setObjectListConsoleCommand(console_command: [:0]const u8) void {
    return raw.setObjectListConsoleCommand(console_command);
}

pub fn setObjectRefId(ref_id: [:0]const u8) void {
    return raw.setObjectRefId(ref_id);
}
pub fn setObjectRefNum(ref_num: i32) void {
    return raw.setObjectRefNum(ref_num);
}
pub fn setObjectMpNum(mp_num: i32) void {
    return raw.setObjectMpNum(mp_num);
}
pub fn setObjectCount(count: i32) void {
    return raw.setObjectCount(count);
}
pub fn setObjectCharge(charge: i32) void {
    return raw.setObjectCharge(charge);
}
pub fn setObjectEnchantmentCharge(enchantment_charge: f64) void {
    return raw.setObjectEnchantmentCharge(enchantment_charge);
}
pub fn setObjectSoul(soul: [:0]const u8) void {
    return raw.setObjectSoul(soul);
}
pub fn setObjectGoldValue(gold_value: i32) void {
    return raw.setObjectGoldValue(gold_value);
}
pub fn setObjectScale(scale: f64) void {
    return raw.setObjectScale(scale);
}
pub fn setObjectState(object_state: bool) void {
    return raw.setObjectState(object_state);
}
pub fn setObjectLockLevel(lock_level: i32) void {
    return raw.setObjectLockLevel(lock_level);
}
pub fn setObjectDialogueChoiceType(dialogue_choice_type: DialogueChoice) void {
    return raw.setObjectDialogueChoiceType(@intFromEnum(dialogue_choice_type));
}
pub fn setObjectDialogueChoiceTopic(topic: [:0]const u8) void {
    raw.setObjectDialogueChoiceType(.topic);
    return raw.setObjectDialogueChoiceTopic(topic);
}
pub fn setObjectGoldPool(gold_pool: u32) void {
    return raw.setObjectGoldPool(gold_pool);
}
pub fn setObjectLastGoldRestockHour(hour: f64) void {
    return raw.setObjectLastGoldRestockHour(hour);
}
pub fn setObjectLastGoldRestockDay(day: i32) void {
    return raw.setObjectLastGoldRestockDay(day);
}
pub fn setObjectDisarmState(disarm_state: bool) void {
    return raw.setObjectDisarmState(disarm_state);
}
pub fn setObjectDroppedByPlayerState(dropped_by_player_state: bool) void {
    return raw.setObjectDroppedByPlayerState(dropped_by_player_state);
}
pub fn setObjectPosition(x: f64, y: f64, z: f64) void {
    return raw.setObjectPosition(x, y, z);
}
pub fn setObjectRotation(x: f64, y: f64, z: f64) void {
    return raw.setObjectRotation(x, y, z);
}
pub fn setObjectSound(sound_id: [:0]const u8, volume: f64, pitch: f64) void {
    return raw.setObjectSound(sound_id, volume, pitch);
}

pub fn setObjectSummonState(summon_state: bool) void {
    return raw.setObjectSummonState(summon_state);
}
pub fn setObjectSummonEffectId(summon_effect_id: i32) void {
    return raw.setObjectSummonEffectId(summon_effect_id);
}
pub fn setObjectSummonSpellId(summon_spell_id: [:0]const u8) void {
    return raw.setObjectSummonSpellId(summon_spell_id);
}
pub fn setObjectSummonDuration(summon_duration: f64) void {
    return raw.setObjectSummonDuration(summon_duration);
}
pub fn setObjectSummonerPid(pid: u16) void {
    return raw.setObjectSummonerPid(pid);
}
pub fn setObjectSummonerRefNum(ref_num: i32) void {
    return raw.setObjectSummonerRefNum(ref_num);
}
pub fn setObjectSummonerMpNum(mp_num: u32) void {
    return raw.setObjectSummonerMpNum(mp_num);
}

pub fn setObjectActivatingPid(pid: c_ushort) void {
    return raw.setObjectActivatingPid(pid);
}

pub fn setObjectDoorState(door_state: i32) void {
    return raw.setObjectDoorState(door_state);
}
pub fn setObjectDoorTeleportState(teleport_state: bool) void {
    return raw.setObjectDoorTeleportState(teleport_state);
}
pub fn setObjectDoorDestinationCell(cell_description: [:0]const u8) void {
    return raw.setObjectDoorDestinationCell(cell_description);
}
pub fn setObjectDoorDestinationPosition(x: f64, y: f64, z: f64) void {
    return raw.setObjectDoorDestinationPosition(x, y, z);
}
pub fn setObjectDoorDestinationRotation(x: f64, z: f64) void {
    return raw.setObjectDoorDestinationRotation(x, z);
}

pub fn setPlayerAsObject(pid: u16) void {
    return raw.setPlayerAsObject(pid);
}

pub fn setContainerItemRefId(ref_id: [:0]const u8) void {
    return raw.setContainerItemRefId(ref_id);
}
pub fn setContainerItemCount(count: i32) void {
    return raw.setContainerItemCount(count);
}
pub fn setContainerItemCharge(charge: i32) void {
    return raw.setContainerItemCharge(charge);
}
pub fn setContainerItemEnchantmentCharge(enchantment_charge: f64) void {
    return raw.setContainerItemEnchantmentCharge(enchantment_charge);
}
pub fn setContainerItemSoul(soul: [:0]const u8) void {
    return raw.setContainerItemSoul(soul);
}

pub fn setContainerItemActionCountByIndex(
    object_index: u32,
    item_index: u32,
    action_count: i32,
) void {
    return raw.setContainerItemActionCountByIndex(object_index, item_index, action_count);
}

pub fn addObject() void {
    return raw.addObject();
}
pub fn addClientLocal(internal_index: i32, value: anytype) void {
    const T = @TypeOf(value);
    switch (@typeInfo(T)) {
        .Int => |int| {
            if (int.bits <= @typeInfo(c_ushort).Int.bits) {
                return raw.addClientLocalInteger(
                    internal_index,
                    value,
                    @intFromEnum(VariableType.short),
                );
            } else if (int.bits <= @typeInfo(c_int).Int.bits) {
                return raw.addClientLocalInteger(
                    internal_index,
                    value,
                    @intFromEnum(VariableType.long),
                );
            } else {
                @compileError("addClientLocal cannot be used with " ++ @typeName(T));
            }
        },
        .Float => |float| {
            if (float.bits <= 64) {
                return raw.addClientLocalFloat(internal_index, value);
            } else {
                @compileError("addClientLocal cannot be used with " ++ @typeName(T));
            }
        },
        else => @compileError("addClientLocal cannot be used with " ++ @typeName(T)),
    }
}
pub fn addContainerItem() void {
    return raw.addContainerItem();
}

pub fn sendObjectActivate(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectActivate(send_to_other_players, skip_attached_player);
}
pub fn sendObjectPlace(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectPlace(send_to_other_players, skip_attached_player);
}
pub fn sendObjectSpawn(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectSpawn(send_to_other_players, skip_attached_player);
}
pub fn sendObjectDelete(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectDelete(send_to_other_players, skip_attached_player);
}
pub fn sendObjectLock(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectLock(send_to_other_players, skip_attached_player);
}
pub fn sendObjectDialogueChoice(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectDialogueChoice(send_to_other_players, skip_attached_player);
}
pub fn sendObjectMiscellaneous(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectMiscellaneous(send_to_other_players, skip_attached_player);
}
pub fn sendObjectRestock(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectRestock(send_to_other_players, skip_attached_player);
}
pub fn sendObjectTrap(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectTrap(send_to_other_players, skip_attached_player);
}
pub fn sendObjectScale(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectScale(send_to_other_players, skip_attached_player);
}
pub fn sendObjectSound(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectSound(send_to_other_players, skip_attached_player);
}
pub fn sendObjectState(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectState(send_to_other_players, skip_attached_player);
}
pub fn sendObjectMove(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectMove(send_to_other_players, skip_attached_player);
}
pub fn sendObjectRotate(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendObjectRotate(send_to_other_players, skip_attached_player);
}
pub fn sendDoorState(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendDoorState(send_to_other_players, skip_attached_player);
}
pub fn sendDoorDestination(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendDoorDestination(send_to_other_players, skip_attached_player);
}
pub fn sendContainer(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendContainer(send_to_other_players, skip_attached_player);
}
pub fn sendVideoPlay(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendVideoPlay(send_to_other_players, skip_attached_player);
}
pub fn sendClientScriptLocal(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendClientScriptLocal(send_to_other_players, skip_attached_player);
}
pub fn sendConsoleCommand(send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendConsoleCommand(send_to_other_players, skip_attached_player);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_ReadReceivedObjectList() callconv(.C) void;
    pub const readReceivedObjectList = libtes3mp_ReadReceivedObjectList;

    extern "libTES3MP-core" fn libtes3mp_ClearObjectList() callconv(.C) void;
    pub const clearObjectList = libtes3mp_ClearObjectList;
    extern "libTES3MP-core" fn libtes3mp_SetObjectListPid(pid: c_ushort) callconv(.C) void;
    pub const setObjectListPid = libtes3mp_SetObjectListPid;

    extern "libTES3MP-core" fn libtes3mp_CopyReceivedObjectListToStore() callconv(.C) void;
    pub const copyReceivedObjectListToStore = libtes3mp_CopyReceivedObjectListToStore;

    extern "libTES3MP-core" fn libtes3mp_GetObjectListSize() callconv(.C) c_uint;
    pub const getObjectListSize = libtes3mp_GetObjectListSize;
    extern "libTES3MP-core" fn libtes3mp_GetObjectListOrigin() callconv(.C) u8;
    pub const getObjectListOrigin = libtes3mp_GetObjectListOrigin;
    extern "libTES3MP-core" fn libtes3mp_GetObjectListClientScript() callconv(.C) ?[*:0]const u8;
    pub const getObjectListClientScript = libtes3mp_GetObjectListClientScript;
    extern "libTES3MP-core" fn libtes3mp_GetObjectListAction() callconv(.C) u8;
    pub const getObjectListAction = libtes3mp_GetObjectListAction;
    extern "libTES3MP-core" fn libtes3mp_GetObjectListConsoleCommand() callconv(.C) ?[*:0]const u8;
    pub const getObjectListConsoleCommand = libtes3mp_GetObjectListConsoleCommand;
    extern "libTES3MP-core" fn libtes3mp_GetObjectListContainerSubAction() callconv(.C) u8;
    pub const getObjectListContainerSubAction = libtes3mp_GetObjectListContainerSubAction;

    extern "libTES3MP-core" fn libtes3mp_IsObjectPlayer(index: c_uint) callconv(.C) bool;
    pub const isObjectPlayer = libtes3mp_IsObjectPlayer;
    extern "libTES3MP-core" fn libtes3mp_GetObjectPid(index: c_uint) callconv(.C) c_int;
    pub const getObjectPid = libtes3mp_GetObjectPid;
    extern "libTES3MP-core" fn libtes3mp_GetObjectRefId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getObjectRefId = libtes3mp_GetObjectRefId;
    extern "libTES3MP-core" fn libtes3mp_GetObjectRefNum(index: c_uint) callconv(.C) c_uint;
    pub const getObjectRefNum = libtes3mp_GetObjectRefNum;
    extern "libTES3MP-core" fn libtes3mp_GetObjectMpNum(index: c_uint) callconv(.C) c_uint;
    pub const getObjectMpNum = libtes3mp_GetObjectMpNum;
    extern "libTES3MP-core" fn libtes3mp_GetObjectCount(index: c_uint) callconv(.C) c_int;
    pub const getObjectCount = libtes3mp_GetObjectCount;
    extern "libTES3MP-core" fn libtes3mp_GetObjectCharge(index: c_uint) callconv(.C) c_int;
    pub const getObjectCharge = libtes3mp_GetObjectCharge;
    extern "libTES3MP-core" fn libtes3mp_GetObjectEnchantmentCharge(index: c_uint) callconv(.C) f64;
    pub const getObjectEnchantmentCharge = libtes3mp_GetObjectEnchantmentCharge;
    extern "libTES3MP-core" fn libtes3mp_GetObjectSoul(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getObjectSoul = libtes3mp_GetObjectSoul;
    extern "libTES3MP-core" fn libtes3mp_GetObjectGoldValue(index: c_uint) callconv(.C) c_int;
    pub const getObjectGoldValue = libtes3mp_GetObjectGoldValue;
    extern "libTES3MP-core" fn libtes3mp_GetObjectScale(index: c_uint) callconv(.C) f64;
    pub const getObjectScale = libtes3mp_GetObjectScale;
    extern "libTES3MP-core" fn libtes3mp_GetObjectSoundId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getObjectSoundId = libtes3mp_GetObjectSoundId;
    extern "libTES3MP-core" fn libtes3mp_GetObjectState(index: c_uint) callconv(.C) bool;
    pub const getObjectState = libtes3mp_GetObjectState;
    extern "libTES3MP-core" fn libtes3mp_GetObjectDoorState(index: c_uint) callconv(.C) c_int;
    pub const getObjectDoorState = libtes3mp_GetObjectDoorState;
    extern "libTES3MP-core" fn libtes3mp_GetObjectLockLevel(index: c_uint) callconv(.C) c_int;
    pub const getObjectLockLevel = libtes3mp_GetObjectLockLevel;
    extern "libTES3MP-core" fn libtes3mp_GetObjectDialogueChoiceType(index: c_uint) callconv(.C) c_uint;
    pub const getObjectDialogueChoiceType = libtes3mp_GetObjectDialogueChoiceType;
    extern "libTES3MP-core" fn libtes3mp_GetObjectDialogueChoiceTopic(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getObjectDialogueChoiceTopic = libtes3mp_GetObjectDialogueChoiceTopic;
    extern "libTES3MP-core" fn libtes3mp_GetObjectGoldPool(index: c_uint) callconv(.C) c_uint;
    pub const getObjectGoldPool = libtes3mp_GetObjectGoldPool;
    extern "libTES3MP-core" fn libtes3mp_GetObjectLastGoldRestockHour(index: c_uint) callconv(.C) f64;
    pub const getObjectLastGoldRestockHour = libtes3mp_GetObjectLastGoldRestockHour;
    extern "libTES3MP-core" fn libtes3mp_GetObjectLastGoldRestockDay(index: c_uint) callconv(.C) c_int;
    pub const getObjectLastGoldRestockDay = libtes3mp_GetObjectLastGoldRestockDay;

    extern "libTES3MP-core" fn libtes3mp_DoesObjectHavePlayerActivating(index: c_uint) callconv(.C) bool;
    pub const doesObjectHavePlayerActivating = libtes3mp_DoesObjectHavePlayerActivating;
    extern "libTES3MP-core" fn libtes3mp_GetObjectActivatingPid(index: c_uint) callconv(.C) c_int;
    pub const getObjectActivatingPid = libtes3mp_GetObjectActivatingPid;
    extern "libTES3MP-core" fn libtes3mp_GetObjectActivatingRefId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getObjectActivatingRefId = libtes3mp_GetObjectActivatingRefId;
    extern "libTES3MP-core" fn libtes3mp_GetObjectActivatingRefNum(index: c_uint) callconv(.C) c_uint;
    pub const getObjectActivatingRefNum = libtes3mp_GetObjectActivatingRefNum;
    extern "libTES3MP-core" fn libtes3mp_GetObjectActivatingMpNum(index: c_uint) callconv(.C) c_uint;
    pub const getObjectActivatingMpNum = libtes3mp_GetObjectActivatingMpNum;
    extern "libTES3MP-core" fn libtes3mp_GetObjectActivatingName(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getObjectActivatingName = libtes3mp_GetObjectActivatingName;

    extern "libTES3MP-core" fn libtes3mp_GetObjectHitSuccess(index: c_uint) callconv(.C) bool;
    pub const getObjectHitSuccess = libtes3mp_GetObjectHitSuccess;
    extern "libTES3MP-core" fn libtes3mp_GetObjectHitDamage(index: c_uint) callconv(.C) f64;
    pub const getObjectHitDamage = libtes3mp_GetObjectHitDamage;
    extern "libTES3MP-core" fn libtes3mp_GetObjectHitBlock(index: c_uint) callconv(.C) bool;
    pub const getObjectHitBlock = libtes3mp_GetObjectHitBlock;
    extern "libTES3MP-core" fn libtes3mp_GetObjectHitKnockdown(index: c_uint) callconv(.C) bool;
    pub const getObjectHitKnockdown = libtes3mp_GetObjectHitKnockdown;
    extern "libTES3MP-core" fn libtes3mp_DoesObjectHavePlayerHitting(index: c_uint) callconv(.C) bool;
    pub const doesObjectHavePlayerHitting = libtes3mp_DoesObjectHavePlayerHitting;
    extern "libTES3MP-core" fn libtes3mp_GetObjectHittingPid(index: c_uint) callconv(.C) c_int;
    pub const getObjectHittingPid = libtes3mp_GetObjectHittingPid;
    extern "libTES3MP-core" fn libtes3mp_GetObjectHittingRefId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getObjectHittingRefId = libtes3mp_GetObjectHittingRefId;
    extern "libTES3MP-core" fn libtes3mp_GetObjectHittingRefNum(index: c_uint) callconv(.C) c_uint;
    pub const getObjectHittingRefNum = libtes3mp_GetObjectHittingRefNum;
    extern "libTES3MP-core" fn libtes3mp_GetObjectHittingMpNum(index: c_uint) callconv(.C) c_uint;
    pub const getObjectHittingMpNum = libtes3mp_GetObjectHittingMpNum;
    extern "libTES3MP-core" fn libtes3mp_GetObjectHittingName(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getObjectHittingName = libtes3mp_GetObjectHittingName;

    extern "libTES3MP-core" fn libtes3mp_GetObjectSummonState(index: c_uint) callconv(.C) bool;
    pub const getObjectSummonState = libtes3mp_GetObjectSummonState;
    extern "libTES3MP-core" fn libtes3mp_GetObjectSummonEffectId(index: c_uint) callconv(.C) f64;
    pub const getObjectSummonEffectId = libtes3mp_GetObjectSummonEffectId;
    extern "libTES3MP-core" fn libtes3mp_GetObjectSummonSpellId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getObjectSummonSpellId = libtes3mp_GetObjectSummonSpellId;
    extern "libTES3MP-core" fn libtes3mp_GetObjectSummonDuration(index: c_uint) callconv(.C) f64;
    pub const getObjectSummonDuration = libtes3mp_GetObjectSummonDuration;
    extern "libTES3MP-core" fn libtes3mp_DoesObjectHavePlayerSummoner(index: c_uint) callconv(.C) bool;
    pub const doesObjectHavePlayerSummoner = libtes3mp_DoesObjectHavePlayerSummoner;
    extern "libTES3MP-core" fn libtes3mp_GetObjectSummonerPid(index: c_uint) callconv(.C) c_int;
    pub const getObjectSummonerPid = libtes3mp_GetObjectSummonerPid;
    extern "libTES3MP-core" fn libtes3mp_GetObjectSummonerRefId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getObjectSummonerRefId = libtes3mp_GetObjectSummonerRefId;
    extern "libTES3MP-core" fn libtes3mp_GetObjectSummonerRefNum(index: c_uint) callconv(.C) c_uint;
    pub const getObjectSummonerRefNum = libtes3mp_GetObjectSummonerRefNum;
    extern "libTES3MP-core" fn libtes3mp_GetObjectSummonerMpNum(index: c_uint) callconv(.C) c_uint;
    pub const getObjectSummonerMpNum = libtes3mp_GetObjectSummonerMpNum;

    extern "libTES3MP-core" fn libtes3mp_GetObjectPosX(index: c_uint) callconv(.C) f64;
    pub const getObjectPosX = libtes3mp_GetObjectPosX;
    extern "libTES3MP-core" fn libtes3mp_GetObjectPosY(index: c_uint) callconv(.C) f64;
    pub const getObjectPosY = libtes3mp_GetObjectPosY;
    extern "libTES3MP-core" fn libtes3mp_GetObjectPosZ(index: c_uint) callconv(.C) f64;
    pub const getObjectPosZ = libtes3mp_GetObjectPosZ;
    extern "libTES3MP-core" fn libtes3mp_GetObjectRotX(index: c_uint) callconv(.C) f64;
    pub const getObjectRotX = libtes3mp_GetObjectRotX;
    extern "libTES3MP-core" fn libtes3mp_GetObjectRotY(index: c_uint) callconv(.C) f64;
    pub const getObjectRotY = libtes3mp_GetObjectRotY;
    extern "libTES3MP-core" fn libtes3mp_GetObjectRotZ(index: c_uint) callconv(.C) f64;
    pub const getObjectRotZ = libtes3mp_GetObjectRotZ;

    extern "libTES3MP-core" fn libtes3mp_GetVideoFilename(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getVideoFilename = libtes3mp_GetVideoFilename;

    extern "libTES3MP-core" fn libtes3mp_GetClientLocalsSize(object_index: c_uint) callconv(.C) c_uint;
    pub const getClientLocalsSize = libtes3mp_GetClientLocalsSize;
    extern "libTES3MP-core" fn libtes3mp_GetClientLocalInternalIndex(object_index: c_uint, variable_index: c_uint) callconv(.C) c_uint;
    pub const getClientLocalInternalIndex = libtes3mp_GetClientLocalInternalIndex;
    extern "libTES3MP-core" fn libtes3mp_GetClientLocalVariableType(object_index: c_uint, variable_index: c_uint) callconv(.C) c_ushort;
    pub const getClientLocalVariableType = libtes3mp_GetClientLocalVariableType;
    extern "libTES3MP-core" fn libtes3mp_GetClientLocalIntValue(object_index: c_uint, variable_index: c_uint) callconv(.C) c_int;
    pub const getClientLocalIntValue = libtes3mp_GetClientLocalIntValue;
    extern "libTES3MP-core" fn libtes3mp_GetClientLocalFloatValue(object_index: c_uint, variable_index: c_uint) callconv(.C) f64;
    pub const getClientLocalFloatValue = libtes3mp_GetClientLocalFloatValue;

    extern "libTES3MP-core" fn libtes3mp_GetContainerChangesSize(object_index: c_uint) callconv(.C) c_uint;
    pub const getContainerChangesSize = libtes3mp_GetContainerChangesSize;
    extern "libTES3MP-core" fn libtes3mp_GetContainerItemRefId(object_index: c_uint, item_index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getContainerItemRefId = libtes3mp_GetContainerItemRefId;
    extern "libTES3MP-core" fn libtes3mp_GetContainerItemCount(object_index: c_uint, item_index: c_uint) callconv(.C) c_int;
    pub const getContainerItemCount = libtes3mp_GetContainerItemCount;
    extern "libTES3MP-core" fn libtes3mp_GetContainerItemCharge(object_index: c_uint, item_index: c_uint) callconv(.C) c_int;
    pub const getContainerItemCharge = libtes3mp_GetContainerItemCharge;
    extern "libTES3MP-core" fn libtes3mp_GetContainerItemEnchantmentCharge(object_index: c_uint, item_index: c_uint) callconv(.C) f64;
    pub const getContainerItemEnchantmentCharge = libtes3mp_GetContainerItemEnchantmentCharge;
    extern "libTES3MP-core" fn libtes3mp_GetContainerItemSoul(object_index: c_uint, item_index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getContainerItemSoul = libtes3mp_GetContainerItemSoul;
    extern "libTES3MP-core" fn libtes3mp_GetContainerItemActionCount(object_index: c_uint, item_index: c_uint) callconv(.C) c_int;
    pub const getContainerItemActionCount = libtes3mp_GetContainerItemActionCount;

    extern "libTES3MP-core" fn libtes3mp_DoesObjectHaveContainer(index: c_uint) callconv(.C) bool;
    pub const doesObjectHaveContainer = libtes3mp_DoesObjectHaveContainer;
    extern "libTES3MP-core" fn libtes3mp_IsObjectDroppedByPlayer(index: c_uint) callconv(.C) bool;
    pub const isObjectDroppedByPlayer = libtes3mp_IsObjectDroppedByPlayer;

    extern "libTES3MP-core" fn libtes3mp_SetObjectListCell(cell_description: [*:0]const u8) callconv(.C) void;
    pub const setObjectListCell = libtes3mp_SetObjectListCell;
    extern "libTES3MP-core" fn libtes3mp_SetObjectListAction(action: u8) callconv(.C) void;
    pub const setObjectListAction = libtes3mp_SetObjectListAction;
    extern "libTES3MP-core" fn libtes3mp_SetObjectListContainerSubAction(sub_action: u8) callconv(.C) void;
    pub const setObjectListContainerSubAction = libtes3mp_SetObjectListContainerSubAction;
    extern "libTES3MP-core" fn libtes3mp_SetObjectListConsoleCommand(console_command: [*:0]const u8) callconv(.C) void;
    pub const setObjectListConsoleCommand = libtes3mp_SetObjectListConsoleCommand;

    extern "libTES3MP-core" fn libtes3mp_SetObjectRefId(ref_id: [*:0]const u8) callconv(.C) void;
    pub const setObjectRefId = libtes3mp_SetObjectRefId;
    extern "libTES3MP-core" fn libtes3mp_SetObjectRefNum(ref_num: c_int) callconv(.C) void;
    pub const setObjectRefNum = libtes3mp_SetObjectRefNum;
    extern "libTES3MP-core" fn libtes3mp_SetObjectMpNum(mp_num: c_int) callconv(.C) void;
    pub const setObjectMpNum = libtes3mp_SetObjectMpNum;
    extern "libTES3MP-core" fn libtes3mp_SetObjectCount(count: c_int) callconv(.C) void;
    pub const setObjectCount = libtes3mp_SetObjectCount;
    extern "libTES3MP-core" fn libtes3mp_SetObjectCharge(charge: c_int) callconv(.C) void;
    pub const setObjectCharge = libtes3mp_SetObjectCharge;
    extern "libTES3MP-core" fn libtes3mp_SetObjectEnchantmentCharge(enchantment_charge: f64) callconv(.C) void;
    pub const setObjectEnchantmentCharge = libtes3mp_SetObjectEnchantmentCharge;
    extern "libTES3MP-core" fn libtes3mp_SetObjectSoul(soul: [*:0]const u8) callconv(.C) void;
    pub const setObjectSoul = libtes3mp_SetObjectSoul;
    extern "libTES3MP-core" fn libtes3mp_SetObjectGoldValue(gold_value: c_int) callconv(.C) void;
    pub const setObjectGoldValue = libtes3mp_SetObjectGoldValue;
    extern "libTES3MP-core" fn libtes3mp_SetObjectScale(scale: f64) callconv(.C) void;
    pub const setObjectScale = libtes3mp_SetObjectScale;
    extern "libTES3MP-core" fn libtes3mp_SetObjectState(object_state: bool) callconv(.C) void;
    pub const setObjectState = libtes3mp_SetObjectState;
    extern "libTES3MP-core" fn libtes3mp_SetObjectLockLevel(lock_level: c_int) callconv(.C) void;
    pub const setObjectLockLevel = libtes3mp_SetObjectLockLevel;
    extern "libTES3MP-core" fn libtes3mp_SetObjectDialogueChoiceType(dialogue_choice_type: c_uint) callconv(.C) void;
    pub const setObjectDialogueChoiceType = libtes3mp_SetObjectDialogueChoiceType;
    extern "libTES3MP-core" fn libtes3mp_SetObjectDialogueChoiceTopic(topic: [*:0]const u8) callconv(.C) void;
    pub const setObjectDialogueChoiceTopic = libtes3mp_SetObjectDialogueChoiceTopic;
    extern "libTES3MP-core" fn libtes3mp_SetObjectGoldPool(gold_pool: c_uint) callconv(.C) void;
    pub const setObjectGoldPool = libtes3mp_SetObjectGoldPool;
    extern "libTES3MP-core" fn libtes3mp_SetObjectLastGoldRestockHour(hour: f64) callconv(.C) void;
    pub const setObjectLastGoldRestockHour = libtes3mp_SetObjectLastGoldRestockHour;
    extern "libTES3MP-core" fn libtes3mp_SetObjectLastGoldRestockDay(day: c_int) callconv(.C) void;
    pub const setObjectLastGoldRestockDay = libtes3mp_SetObjectLastGoldRestockDay;
    extern "libTES3MP-core" fn libtes3mp_SetObjectDisarmState(disarm_state: bool) callconv(.C) void;
    pub const setObjectDisarmState = libtes3mp_SetObjectDisarmState;
    extern "libTES3MP-core" fn libtes3mp_SetObjectDroppedByPlayerState(droped_by_player_state: bool) callconv(.C) void;
    pub const setObjectDroppedByPlayerState = libtes3mp_SetObjectDroppedByPlayerState;
    extern "libTES3MP-core" fn libtes3mp_SetObjectPosition(x: f64, y: f64, z: f64) callconv(.C) void;
    pub const setObjectPosition = libtes3mp_SetObjectPosition;
    extern "libTES3MP-core" fn libtes3mp_SetObjectRotation(x: f64, y: f64, z: f64) callconv(.C) void;
    pub const setObjectRotation = libtes3mp_SetObjectRotation;
    extern "libTES3MP-core" fn libtes3mp_SetObjectSound(sound_id: [*:0]const u8, volume: f64, pitch: f64) callconv(.C) void;
    pub const setObjectSound = libtes3mp_SetObjectSound;

    extern "libTES3MP-core" fn libtes3mp_SetObjectSummonState(summon_state: bool) callconv(.C) void;
    pub const setObjectSummonState = libtes3mp_SetObjectSummonState;
    extern "libTES3MP-core" fn libtes3mp_SetObjectSummonEffectId(summon_effect_id: c_int) callconv(.C) void;
    pub const setObjectSummonEffectId = libtes3mp_SetObjectSummonEffectId;
    extern "libTES3MP-core" fn libtes3mp_SetObjectSummonSpellId(summon_spell_id: [*:0]const u8) callconv(.C) void;
    pub const setObjectSummonSpellId = libtes3mp_SetObjectSummonSpellId;
    extern "libTES3MP-core" fn libtes3mp_SetObjectSummonDuration(summon_duration: f64) callconv(.C) void;
    pub const setObjectSummonDuration = libtes3mp_SetObjectSummonDuration;
    extern "libTES3MP-core" fn libtes3mp_SetObjectSummonerPid(pid: c_ushort) callconv(.C) void;
    pub const setObjectSummonerPid = libtes3mp_SetObjectSummonerPid;
    extern "libTES3MP-core" fn libtes3mp_SetObjectSummonerRefNum(ref_num: c_int) callconv(.C) void;
    pub const setObjectSummonerRefNum = libtes3mp_SetObjectSummonerRefNum;
    extern "libTES3MP-core" fn libtes3mp_SetObjectSummonerMpNum(mp_num: c_int) callconv(.C) void;
    pub const setObjectSummonerMpNum = libtes3mp_SetObjectSummonerMpNum;

    extern "libTES3MP-core" fn libtes3mp_SetObjectActivatingPid(pid: c_ushort) callconv(.C) void;
    pub const setObjectActivatingPid = libtes3mp_SetObjectActivatingPid;

    extern "libTES3MP-core" fn libtes3mp_SetObjectDoorState(door_state: c_int) callconv(.C) void;
    pub const setObjectDoorState = libtes3mp_SetObjectDoorState;
    extern "libTES3MP-core" fn libtes3mp_SetObjectDoorTeleportState(teleport_state: bool) callconv(.C) void;
    pub const setObjectDoorTeleportState = libtes3mp_SetObjectDoorTeleportState;
    extern "libTES3MP-core" fn libtes3mp_SetObjectDoorDestinationCell(cell_description: [*:0]const u8) callconv(.C) void;
    pub const setObjectDoorDestinationCell = libtes3mp_SetObjectDoorDestinationCell;
    extern "libTES3MP-core" fn libtes3mp_SetObjectDoorDestinationPosition(x: f64, y: f64, z: f64) callconv(.C) void;
    pub const setObjectDoorDestinationPosition = libtes3mp_SetObjectDoorDestinationPosition;
    extern "libTES3MP-core" fn libtes3mp_SetObjectDoorDestinationRotation(x: f64, z: f64) callconv(.C) void;
    pub const setObjectDoorDestinationRotation = libtes3mp_SetObjectDoorDestinationRotation;

    extern "libTES3MP-core" fn libtes3mp_SetPlayerAsObject(pid: c_ushort) callconv(.C) void;
    pub const setPlayerAsObject = libtes3mp_SetPlayerAsObject;

    extern "libTES3MP-core" fn libtes3mp_SetContainerItemRefId(ref_id: [*:0]const u8) callconv(.C) void;
    pub const setContainerItemRefId = libtes3mp_SetContainerItemRefId;
    extern "libTES3MP-core" fn libtes3mp_SetContainerItemCount(count: c_int) callconv(.C) void;
    pub const setContainerItemCount = libtes3mp_SetContainerItemCount;
    extern "libTES3MP-core" fn libtes3mp_SetContainerItemCharge(charge: c_int) callconv(.C) void;
    pub const setContainerItemCharge = libtes3mp_SetContainerItemCharge;
    extern "libTES3MP-core" fn libtes3mp_SetContainerItemEnchantmentCharge(enchantment_charge: f64) callconv(.C) void;
    pub const setContainerItemEnchantmentCharge = libtes3mp_SetContainerItemEnchantmentCharge;
    extern "libTES3MP-core" fn libtes3mp_SetContainerItemSoul(soul: [*:0]const u8) callconv(.C) void;
    pub const setContainerItemSoul = libtes3mp_SetContainerItemSoul;

    extern "libTES3MP-core" fn libtes3mp_SetContainerItemActionCountByIndex(object_index: c_uint, item_index: c_uint, action_count: c_int) callconv(.C) void;
    pub const setContainerItemActionCountByIndex = libtes3mp_SetContainerItemActionCountByIndex;

    extern "libTES3MP-core" fn libtes3mp_AddObject() callconv(.C) void;
    pub const addObject = libtes3mp_AddObject;
    extern "libTES3MP-core" fn libtes3mp_AddClientLocalInteger(internal_index: c_int, int_value: c_int, variable_type: c_uint) callconv(.C) void;
    pub const addClientLocalInteger = libtes3mp_AddClientLocalInteger;
    extern "libTES3MP-core" fn libtes3mp_AddClientLocalFloat(internal_index: c_int, float_value: f64) callconv(.C) void;
    pub const addClientLocalFloat = libtes3mp_AddClientLocalFloat;
    extern "libTES3MP-core" fn libtes3mp_AddContainerItem() callconv(.C) void;
    pub const addContainerItem = libtes3mp_AddContainerItem;

    extern "libTES3MP-core" fn libtes3mp_SendObjectActivate(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectActivate = libtes3mp_SendObjectActivate;
    extern "libTES3MP-core" fn libtes3mp_SendObjectPlace(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectPlace = libtes3mp_SendObjectPlace;
    extern "libTES3MP-core" fn libtes3mp_SendObjectSpawn(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectSpawn = libtes3mp_SendObjectSpawn;
    extern "libTES3MP-core" fn libtes3mp_SendObjectDelete(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectDelete = libtes3mp_SendObjectDelete;
    extern "libTES3MP-core" fn libtes3mp_SendObjectLock(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectLock = libtes3mp_SendObjectLock;
    extern "libTES3MP-core" fn libtes3mp_SendObjectDialogueChoice(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectDialogueChoice = libtes3mp_SendObjectDialogueChoice;
    extern "libTES3MP-core" fn libtes3mp_SendObjectMiscellaneous(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectMiscellaneous = libtes3mp_SendObjectMiscellaneous;
    extern "libTES3MP-core" fn libtes3mp_SendObjectRestock(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectRestock = libtes3mp_SendObjectRestock;
    extern "libTES3MP-core" fn libtes3mp_SendObjectTrap(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectTrap = libtes3mp_SendObjectTrap;
    extern "libTES3MP-core" fn libtes3mp_SendObjectScale(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectScale = libtes3mp_SendObjectScale;
    extern "libTES3MP-core" fn libtes3mp_SendObjectSound(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectSound = libtes3mp_SendObjectSound;
    extern "libTES3MP-core" fn libtes3mp_SendObjectState(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectState = libtes3mp_SendObjectState;
    extern "libTES3MP-core" fn libtes3mp_SendObjectMove(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectMove = libtes3mp_SendObjectMove;
    extern "libTES3MP-core" fn libtes3mp_SendObjectRotate(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendObjectRotate = libtes3mp_SendObjectRotate;
    extern "libTES3MP-core" fn libtes3mp_SendDoorState(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendDoorState = libtes3mp_SendDoorState;
    extern "libTES3MP-core" fn libtes3mp_SendDoorDestination(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendDoorDestination = libtes3mp_SendDoorDestination;
    extern "libTES3MP-core" fn libtes3mp_SendContainer(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendContainer = libtes3mp_SendContainer;
    extern "libTES3MP-core" fn libtes3mp_SendVideoPlay(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendVideoPlay = libtes3mp_SendVideoPlay;
    extern "libTES3MP-core" fn libtes3mp_SendClientScriptLocal(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendClientScriptLocal = libtes3mp_SendClientScriptLocal;
    extern "libTES3MP-core" fn libtes3mp_SendConsoleCommand(send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendConsoleCommand = libtes3mp_SendConsoleCommand;
};
