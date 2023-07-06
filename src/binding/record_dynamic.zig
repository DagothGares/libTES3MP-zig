const std = @import("std");

const shared = @import("shared.zig");

pub const RecordType = enum(u5) {
    activator,
    apparatus,
    armor,
    bodypart,
    book,
    cell,
    clothing,
    container,
    creature,
    door,
    enchantment,
    gamesetting,
    ingredient,
    light,
    lockpick,
    miscellaneous,
    npc,
    potion,
    probe,
    repair,
    script,
    sound,
    spell,
    static,
    weapon,
};

pub const RecordSubType = union(enum) {
    enchantment: EnchantmentSubType,
    spell: SpellSubType,
};

pub const EnchantmentSubType = enum(u2) {
    cast_once = 0,
    when_strikes = 1,
    when_used = 2,
    constant_effect = 3,
};

pub const SpellSubType = enum(u3) {
    spell = 0,
    ability = 1,
    blight = 2,
    disease = 3,
    curse = 4,
    power = 5,
};

pub fn clearRecords() void {
    return raw.clearRecords();
}

pub fn getRecordType() RecordType {
    return @enumFromInt(raw.getRecordType());
}
pub fn getRecordCount() u32 {
    return raw.getRecordCount();
}
pub fn getRecordEffectCount(record_index: u32) u32 {
    shared.triggerSafetyCheck(getRecordCount(), record_index);

    return raw.getRecordEffectCount(record_index);
}

pub fn getRecordId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return std.mem.span(raw.getRecordId(index).?);
}
pub fn getRecordBaseId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return std.mem.span(raw.getRecordBaseId(index).?);
}

pub fn getRecordSubtype(index: u32) RecordSubType {
    shared.triggerSafetyCheck(getRecordCount(), index);

    switch (@as(RecordType, @enumFromInt(raw.getRecordType()))) {
        .enchantment => return .{ .enchantment = @enumFromInt(raw.getRecordSubtype(index)) },
        .spell => return .{ .spell = @enumFromInt(raw.getRecordSubtype(index)) },
        else => unreachable,
    }
}
pub fn getRecordName(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return std.mem.span(raw.getRecordName(index).?);
}
pub fn getRecordModel(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return std.mem.span(raw.getRecordModel(index).?);
}
pub fn getRecordIcon(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return std.mem.span(raw.getRecordIcon(index).?);
}
pub fn getRecordScript(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return std.mem.span(raw.getRecordScript(index).?);
}
pub fn getRecordEnchantmentId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return std.mem.span(raw.getRecordEnchantmentId(index).?);
}
pub fn getRecordEnchantmentCharge(index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return raw.getRecordEnchantmentCharge(index);
}

pub fn getRecordAutoCalc(index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return raw.getRecordAutoCalc(index);
}
pub fn getRecordCharge(index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return raw.getRecordCharge(index);
}
pub fn getRecordCost(index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return raw.getRecordCost(index);
}
pub fn getRecordFlags(index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return raw.getRecordFlags(index);
}
pub fn getRecordValue(index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return raw.getRecordValue(index);
}
pub fn getRecordWeight(index: u32) f64 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return raw.getRecordWeight(index);
}
pub fn getRecordQuantity(index: u32) u32 {
    shared.triggerSafetyCheck(getRecordCount(), index);

    return raw.getRecordQuantity(index);
}

pub fn getRecordEffectId(record_index: u32, effect_index: u32) u32 {
    shared.triggerSafetyCheck(getRecordCount(), record_index);
    shared.triggerSafetyCheck(raw.getRecordEffectCount(record_index), effect_index);

    return raw.getRecordEffectId(record_index, effect_index);
}
pub fn getRecordEffectAttribute(record_index: u32, effect_index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), record_index);
    shared.triggerSafetyCheck(raw.getRecordEffectCount(record_index), effect_index);

    return raw.getRecordEffectAttribute(record_index, effect_index);
}
pub fn getRecordEffectSkill(record_index: u32, effect_index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), record_index);
    shared.triggerSafetyCheck(raw.getRecordEffectCount(record_index), effect_index);

    return raw.getRecordEffectSkill(record_index, effect_index);
}
// TODO: this might be an enum
pub fn getRecordEffectRangeType(record_index: u32, effect_index: u32) u32 {
    shared.triggerSafetyCheck(getRecordCount(), record_index);
    shared.triggerSafetyCheck(raw.getRecordEffectCount(record_index), effect_index);

    return raw.getRecordEffectRangeType(record_index, effect_index);
}
pub fn getRecordEffectArea(record_index: u32, effect_index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), record_index);
    shared.triggerSafetyCheck(raw.getRecordEffectCount(record_index), effect_index);

    return raw.getRecordEffectArea(record_index, effect_index);
}
pub fn getRecordEffectDuration(record_index: u32, effect_index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), record_index);
    shared.triggerSafetyCheck(raw.getRecordEffectCount(record_index), effect_index);

    return raw.getRecordEffectDuration(record_index, effect_index);
}
pub fn getRecordEffectMagnitudeMax(record_index: u32, effect_index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), record_index);
    shared.triggerSafetyCheck(raw.getRecordEffectCount(record_index), effect_index);

    return raw.getRecordEffectMagnitudeMax(record_index, effect_index);
}
pub fn getRecordEffectMagnitudeMin(record_index: u32, effect_index: u32) i32 {
    shared.triggerSafetyCheck(getRecordCount(), record_index);
    shared.triggerSafetyCheck(raw.getRecordEffectCount(record_index), effect_index);

    return raw.getRecordEffectMagnitudeMin(record_index, effect_index);
}

pub fn setRecordType(record_type: RecordType) void {
    return raw.setRecordType(@intFromEnum(record_type));
}

pub fn setRecordId(id: [:0]const u8) void {
    return raw.setRecordId(id);
}
pub fn setRecordBaseId(base_id: [:0]const u8) void {
    return raw.setRecordBaseId(base_id);
}
pub fn setRecordInventoryBaseId(inventory_base_id: [:0]const u8) void {
    return raw.setRecordInventoryBaseId(inventory_base_id);
}

pub fn setRecordSubtype(subtype: RecordSubType) void {
    switch (subtype) {
        inline else => |st| return raw.setRecordSubtype(@intFromEnum(st)),
    }
}
pub fn setRecordName(name: [:0]const u8) void {
    return raw.setRecordName(name);
}
pub fn setRecordModel(model: [:0]const u8) void {
    return raw.setRecordModel(model);
}
pub fn setRecordIcon(icon: [:0]const u8) void {
    return raw.setRecordIcon(icon);
}
pub fn setRecordScript(script: [:0]const u8) void {
    return raw.setRecordScript(script);
}
pub fn setRecordEnchantmentId(enchantment_id: [:0]const u8) void {
    return raw.setRecordEnchantmentId(enchantment_id);
}
pub fn setRecordEnchantmentCharge(enchantment_charge: i32) void {
    return raw.setRecordEnchantmentCharge(enchantment_charge);
}

pub fn setRecordAutoCalc(auto_calc: i32) void {
    return raw.setRecordAutoCalc(auto_calc);
}
pub fn setRecordCharge(charge: i32) void {
    return raw.setRecordCharge(charge);
}
pub fn setRecordCost(cost: i32) void {
    return raw.setRecordCost(cost);
}
pub fn setRecordFlags(flags: i32) void {
    return raw.setRecordFlags(flags);
}
pub fn setRecordValue(value: i32) void {
    return raw.setRecordValue(value);
}
pub fn setRecordWeight(weight: f64) void {
    return raw.setRecordWeight(weight);
}
pub fn setRecordQuality(quality: f64) void {
    return raw.setRecordQuality(quality);
}
pub fn setRecordUses(uses: i32) void {
    return raw.setRecordUses(uses);
}
pub fn setRecordTime(time: i32) void {
    return raw.setRecordTime(time);
}
pub fn setRecordRadius(radius: i32) void {
    return raw.setRecordRadius(radius);
}
pub fn setRecordColor(red: u32, green: u32, blue: u32) void {
    return raw.setRecordColor(red, green, blue);
}

pub fn setRecordArmorRating(armor_rating: i32) void {
    return raw.setRecordArmorRating(armor_rating);
}
pub fn setRecordHealth(health: i32) void {
    return raw.setRecordHealth(health);
}

pub fn setRecordDamageChop(min_damage: u32, max_damage: u32) void {
    return raw.setRecordDamageChop(min_damage, max_damage);
}
pub fn setRecordDamageSlash(min_damage: u32, max_damage: u32) void {
    return raw.setRecordDamageSlash(min_damage, max_damage);
}
pub fn setRecordDamageThrust(min_damage: u32, max_damage: u32) void {
    return raw.setRecordDamageThrust(min_damage, max_damage);
}
pub fn setRecordReach(reach: f64) void {
    return raw.setRecordReach(reach);
}
pub fn setRecordSpeed(speed: f64) void {
    return raw.setRecordSpeed(speed);
}

pub fn setRecordKeyState(key_state: bool) void {
    return raw.setRecordKeyState(key_state);
}
pub fn setRecordScrollState(scroll_state: bool) void {
    return raw.setRecordScrollState(scroll_state);
}
pub fn setRecordSkillId(skill_id: i32) void {
    return raw.setRecordSkillId(skill_id);
}
pub fn setRecordText(text: [:0]const u8) void {
    return raw.setRecordText(text);
}

pub fn setRecordHair(hair: [:0]const u8) void {
    return raw.setRecordHair(hair);
}
pub fn setRecordHead(head: [:0]const u8) void {
    return raw.setRecordHead(head);
}
pub fn setRecordGender(gender: u32) void {
    return raw.setRecordGender(gender);
}
pub fn setRecordRace(race: [:0]const u8) void {
    return raw.setRecordRace(race);
}
pub fn setRecordClass(char_class: [:0]const u8) void {
    return raw.setRecordClass(char_class);
}
pub fn setRecordFaction(faction: [:0]const u8) void {
    return raw.setRecordFaction(faction);
}

pub fn setRecordScale(scale: f64) void {
    return raw.setRecordScale(scale);
}
pub fn setRecordBloodType(blood_type: i32) void {
    return raw.setRecordBloodType(blood_type);
}
pub fn setRecordVampireState(vampire_state: bool) void {
    return raw.setRecordVampireState(vampire_state);
}

pub fn setRecordLevel(level: i32) void {
    return raw.setRecordLevel(level);
}
pub fn setRecordMagicka(magicka: i32) void {
    return raw.setRecordMagicka(magicka);
}
pub fn setRecordFatigue(fatigue: i32) void {
    return raw.setRecordFatigue(fatigue);
}

pub fn setRecordSoulValue(soul_value: i32) void {
    return raw.setRecordSoulValue(soul_value);
}

pub fn setRecordAIFight(ai_fight: i32) void {
    return raw.setRecordAIFight(ai_fight);
}
pub fn setRecordAIFlee(ai_flee: i32) void {
    return raw.setRecordAIFlee(ai_flee);
}
pub fn setRecordAIAlarm(ai_alarm: i32) void {
    return raw.setRecordAIAlarm(ai_alarm);
}
pub fn setRecordAIServices(ai_services: i32) void {
    return raw.setRecordAIServices(ai_services);
}

pub fn setRecordSound(sound: [:0]const u8) void {
    return raw.setRecordSound(sound);
}
pub fn setRecordVolume(volume: f64) void {
    return raw.setRecordVolume(volume);
}
pub fn setRecordMinRange(min_range: f64) void {
    return raw.setRecordMinRange(min_range);
}
pub fn setRecordMaxRange(max_range: f64) void {
    return raw.setRecordMaxRange(max_range);
}
pub fn setRecordOpenSound(sound: [:0]const u8) void {
    return raw.setRecordOpenSound(sound);
}
pub fn setRecordCloseSound(sound: [:0]const u8) void {
    return raw.setRecordCloseSound(sound);
}

pub fn setRecordScriptText(script_text: [:0]const u8) void {
    return raw.setRecordScriptText(script_text);
}
pub fn setRecordIntegerVariable(int_var: i32) void {
    return raw.setRecordIntegerVariable(int_var);
}
pub fn setRecordFloatVariable(float_var: f64) void {
    return raw.setRecordFloatVariable(float_var);
}
pub fn setRecordStringVariable(string_var: [:0]const u8) void {
    return raw.setRecordStringVariable(string_var);
}

pub fn setRecordIdByIndex(index: u32, id: [:0]const u8) void {
    return raw.setRecordIdByIndex(index, id);
}
pub fn setRecordEnchantmentIdByIndex(index: u32, enchantment_id: [:0]const u8) void {
    return raw.setRecordEnchantmentIdByIndex(index, enchantment_id);
}

pub fn setRecordEffectId(effect_id: u32) void {
    return raw.setRecordEffectId(effect_id);
}
pub fn setRecordEffectAttribute(attribute_id: i32) void {
    return raw.setRecordEffectAttribute(attribute_id);
}
pub fn setRecordEffectSkill(skill_id: i32) void {
    return raw.setRecordEffectSkill(skill_id);
}
pub fn setRecordEffectRangeType(range_type: u32) void {
    return raw.setRecordEffectRangeType(range_type);
}
pub fn setRecordEffectArea(area: i32) void {
    return raw.setRecordEffectArea(area);
}
pub fn setRecordEffectDuration(duration: i32) void {
    return raw.setRecordEffectDuration(duration);
}
pub fn setRecordEffectMagnitudeMax(magnitude_max: i32) void {
    return raw.setRecordEffectMagnitudeMax(magnitude_max);
}
pub fn setRecordEffectMagnitudeMin(magnitude_min: i32) void {
    return raw.setRecordEffectMagnitudeMin(magnitude_min);
}

pub fn setRecordBodyPartType(part_type: u32) void {
    return raw.setRecordBodyPartType(part_type);
}
pub fn setRecordBodyPartIdForMale(part_id: [:0]const u8) void {
    return raw.setRecordBodyPartIdForMale(part_id);
}
pub fn setRecordBodyPartIdForFemale(part_id: [:0]const u8) void {
    return raw.setRecordBodyPartIdForFemale(part_id);
}

pub fn setRecordInventoryItemId(item_id: [:0]const u8) void {
    return raw.setRecordInventoryItemId(item_id);
}
pub fn setRecordInventoryItemCount(count: u32) void {
    return raw.setRecordInventoryItemCount(count);
}

pub fn addRecord() void {
    return raw.addRecord();
}
pub fn addRecordEffect() void {
    return raw.addRecordEffect();
}
pub fn addRecordBodyPart() void {
    return raw.addRecordBodyPart();
}
pub fn addRecordInventoryItem() void {
    return raw.addRecordInventoryItem();
}

pub fn sendRecordDynamic(
    pid: u16,
    send_to_other_players: bool,
    skip_attached_player: bool,
) void {
    return raw.sendRecordDynamic(pid, send_to_other_players, skip_attached_player);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_ClearRecords() callconv(.C) void;
    pub const clearRecords = libtes3mp_ClearRecords;

    extern "libTES3MP-core" fn libtes3mp_GetRecordType() callconv(.C) c_ushort;
    pub const getRecordType = libtes3mp_GetRecordType;
    extern "libTES3MP-core" fn libtes3mp_GetRecordCount() callconv(.C) c_uint;
    pub const getRecordCount = libtes3mp_GetRecordCount;
    extern "libTES3MP-core" fn libtes3mp_GetRecordEffectCount(record_index: c_uint) callconv(.C) c_uint;
    pub const getRecordEffectCount = libtes3mp_GetRecordEffectCount;

    extern "libTES3MP-core" fn libtes3mp_GetRecordId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getRecordId = libtes3mp_GetRecordId;
    extern "libTES3MP-core" fn libtes3mp_GetRecordBaseId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getRecordBaseId = libtes3mp_GetRecordBaseId;

    extern "libTES3MP-core" fn libtes3mp_GetRecordSubtype(index: c_uint) callconv(.C) c_int;
    pub const getRecordSubtype = libtes3mp_GetRecordSubtype;
    extern "libTES3MP-core" fn libtes3mp_GetRecordName(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getRecordName = libtes3mp_GetRecordName;
    extern "libTES3MP-core" fn libtes3mp_GetRecordModel(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getRecordModel = libtes3mp_GetRecordModel;
    extern "libTES3MP-core" fn libtes3mp_GetRecordIcon(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getRecordIcon = libtes3mp_GetRecordIcon;
    extern "libTES3MP-core" fn libtes3mp_GetRecordScript(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getRecordScript = libtes3mp_GetRecordScript;
    extern "libTES3MP-core" fn libtes3mp_GetRecordEnchantmentId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getRecordEnchantmentId = libtes3mp_GetRecordEnchantmentId;
    extern "libTES3MP-core" fn libtes3mp_GetRecordEnchantmentCharge(index: c_uint) callconv(.C) c_int;
    pub const getRecordEnchantmentCharge = libtes3mp_GetRecordEnchantmentCharge;

    extern "libTES3MP-core" fn libtes3mp_GetRecordAutoCalc(index: c_uint) callconv(.C) c_int;
    pub const getRecordAutoCalc = libtes3mp_GetRecordAutoCalc;
    extern "libTES3MP-core" fn libtes3mp_GetRecordCharge(index: c_uint) callconv(.C) c_int;
    pub const getRecordCharge = libtes3mp_GetRecordCharge;
    extern "libTES3MP-core" fn libtes3mp_GetRecordCost(index: c_uint) callconv(.C) c_int;
    pub const getRecordCost = libtes3mp_GetRecordCost;
    extern "libTES3MP-core" fn libtes3mp_GetRecordFlags(index: c_uint) callconv(.C) c_int;
    pub const getRecordFlags = libtes3mp_GetRecordFlags;
    extern "libTES3MP-core" fn libtes3mp_GetRecordValue(index: c_uint) callconv(.C) c_int;
    pub const getRecordValue = libtes3mp_GetRecordValue;
    extern "libTES3MP-core" fn libtes3mp_GetRecordWeight(index: c_uint) callconv(.C) f64;
    pub const getRecordWeight = libtes3mp_GetRecordWeight;
    extern "libTES3MP-core" fn libtes3mp_GetRecordQuantity(index: c_uint) callconv(.C) c_uint;
    pub const getRecordQuantity = libtes3mp_GetRecordQuantity;

    extern "libTES3MP-core" fn libtes3mp_GetRecordEffectId(record_index: c_uint, effect_index: c_uint) callconv(.C) c_uint;
    pub const getRecordEffectId = libtes3mp_GetRecordEffectId;
    extern "libTES3MP-core" fn libtes3mp_GetRecordEffectAttribute(record_index: c_uint, effect_index: c_uint) callconv(.C) c_int;
    pub const getRecordEffectAttribute = libtes3mp_GetRecordEffectAttribute;
    extern "libTES3MP-core" fn libtes3mp_GetRecordEffectSkill(record_index: c_uint, effect_index: c_uint) callconv(.C) c_int;
    pub const getRecordEffectSkill = libtes3mp_GetRecordEffectSkill;
    extern "libTES3MP-core" fn libtes3mp_GetRecordEffectRangeType(record_index: c_uint, effect_index: c_uint) callconv(.C) c_uint;
    pub const getRecordEffectRangeType = libtes3mp_GetRecordEffectRangeType;
    extern "libTES3MP-core" fn libtes3mp_GetRecordEffectArea(record_index: c_uint, effect_index: c_uint) callconv(.C) c_int;
    pub const getRecordEffectArea = libtes3mp_GetRecordEffectArea;
    extern "libTES3MP-core" fn libtes3mp_GetRecordEffectDuration(record_index: c_uint, effect_index: c_uint) callconv(.C) c_int;
    pub const getRecordEffectDuration = libtes3mp_GetRecordEffectDuration;
    extern "libTES3MP-core" fn libtes3mp_GetRecordEffectMagnitudeMax(record_index: c_uint, effect_index: c_uint) callconv(.C) c_int;
    pub const getRecordEffectMagnitudeMax = libtes3mp_GetRecordEffectMagnitudeMax;
    extern "libTES3MP-core" fn libtes3mp_GetRecordEffectMagnitudeMin(record_index: c_uint, effect_index: c_uint) callconv(.C) c_int;
    pub const getRecordEffectMagnitudeMin = libtes3mp_GetRecordEffectMagnitudeMin;

    extern "libTES3MP-core" fn libtes3mp_SetRecordType(record_type: c_uint) callconv(.C) void;
    pub const setRecordType = libtes3mp_SetRecordType;

    extern "libTES3MP-core" fn libtes3mp_SetRecordId(id: [*:0]const u8) callconv(.C) void;
    pub const setRecordId = libtes3mp_SetRecordId;
    extern "libTES3MP-core" fn libtes3mp_SetRecordBaseId(base_id: [*:0]const u8) callconv(.C) void;
    pub const setRecordBaseId = libtes3mp_SetRecordBaseId;
    extern "libTES3MP-core" fn libtes3mp_SetRecordInventoryBaseId(inventory_base_id: [*:0]const u8) callconv(.C) void;
    pub const setRecordInventoryBaseId = libtes3mp_SetRecordInventoryBaseId;

    extern "libTES3MP-core" fn libtes3mp_SetRecordSubtype(subtype: c_uint) callconv(.C) void;
    pub const setRecordSubtype = libtes3mp_SetRecordSubtype;
    extern "libTES3MP-core" fn libtes3mp_SetRecordName(name: [*:0]const u8) callconv(.C) void;
    pub const setRecordName = libtes3mp_SetRecordName;
    extern "libTES3MP-core" fn libtes3mp_SetRecordModel(model: [*:0]const u8) callconv(.C) void;
    pub const setRecordModel = libtes3mp_SetRecordModel;
    extern "libTES3MP-core" fn libtes3mp_SetRecordIcon(icon: [*:0]const u8) callconv(.C) void;
    pub const setRecordIcon = libtes3mp_SetRecordIcon;
    extern "libTES3MP-core" fn libtes3mp_SetRecordScript(script: [*:0]const u8) callconv(.C) void;
    pub const setRecordScript = libtes3mp_SetRecordScript;
    extern "libTES3MP-core" fn libtes3mp_SetRecordEnchantmentId(enchantment_id: [*:0]const u8) callconv(.C) void;
    pub const setRecordEnchantmentId = libtes3mp_SetRecordEnchantmentId;
    extern "libTES3MP-core" fn libtes3mp_SetRecordEnchantmentCharge(enchantment_charge: c_int) callconv(.C) void;
    pub const setRecordEnchantmentCharge = libtes3mp_SetRecordEnchantmentCharge;

    extern "libTES3MP-core" fn libtes3mp_SetRecordAutoCalc(auto_calc: c_int) callconv(.C) void;
    pub const setRecordAutoCalc = libtes3mp_SetRecordAutoCalc;
    extern "libTES3MP-core" fn libtes3mp_SetRecordCharge(charge: c_int) callconv(.C) void;
    pub const setRecordCharge = libtes3mp_SetRecordCharge;
    extern "libTES3MP-core" fn libtes3mp_SetRecordCost(cost: c_int) callconv(.C) void;
    pub const setRecordCost = libtes3mp_SetRecordCost;
    extern "libTES3MP-core" fn libtes3mp_SetRecordFlags(flags: c_int) callconv(.C) void;
    pub const setRecordFlags = libtes3mp_SetRecordFlags;
    extern "libTES3MP-core" fn libtes3mp_SetRecordValue(value: c_int) callconv(.C) void;
    pub const setRecordValue = libtes3mp_SetRecordValue;
    extern "libTES3MP-core" fn libtes3mp_SetRecordWeight(weight: f64) callconv(.C) void;
    pub const setRecordWeight = libtes3mp_SetRecordWeight;
    extern "libTES3MP-core" fn libtes3mp_SetRecordQuality(quality: f64) callconv(.C) void;
    pub const setRecordQuality = libtes3mp_SetRecordQuality;
    extern "libTES3MP-core" fn libtes3mp_SetRecordUses(uses: c_int) callconv(.C) void;
    pub const setRecordUses = libtes3mp_SetRecordUses;
    extern "libTES3MP-core" fn libtes3mp_SetRecordTime(time: c_int) callconv(.C) void;
    pub const setRecordTime = libtes3mp_SetRecordTime;
    extern "libTES3MP-core" fn libtes3mp_SetRecordRadius(radius: c_int) callconv(.C) void;
    pub const setRecordRadius = libtes3mp_SetRecordRadius;
    extern "libTES3MP-core" fn libtes3mp_SetRecordColor(red: c_uint, green: c_uint, blue: c_uint) callconv(.C) void;
    pub const setRecordColor = libtes3mp_SetRecordColor;

    extern "libTES3MP-core" fn libtes3mp_SetRecordArmorRating(armor_rating: c_int) callconv(.C) void;
    pub const setRecordArmorRating = libtes3mp_SetRecordArmorRating;
    extern "libTES3MP-core" fn libtes3mp_SetRecordHealth(health: c_int) callconv(.C) void;
    pub const setRecordHealth = libtes3mp_SetRecordHealth;

    extern "libTES3MP-core" fn libtes3mp_SetRecordDamageChop(min_damage: c_uint, max_damage: c_uint) callconv(.C) void;
    pub const setRecordDamageChop = libtes3mp_SetRecordDamageChop;
    extern "libTES3MP-core" fn libtes3mp_SetRecordDamageSlash(min_damage: c_uint, max_damage: c_uint) callconv(.C) void;
    pub const setRecordDamageSlash = libtes3mp_SetRecordDamageSlash;
    extern "libTES3MP-core" fn libtes3mp_SetRecordDamageThrust(min_damage: c_uint, max_damage: c_uint) callconv(.C) void;
    pub const setRecordDamageThrust = libtes3mp_SetRecordDamageThrust;
    extern "libTES3MP-core" fn libtes3mp_SetRecordReach(reach: f64) callconv(.C) void;
    pub const setRecordReach = libtes3mp_SetRecordReach;
    extern "libTES3MP-core" fn libtes3mp_SetRecordSpeed(speed: f64) callconv(.C) void;
    pub const setRecordSpeed = libtes3mp_SetRecordSpeed;

    extern "libTES3MP-core" fn libtes3mp_SetRecordKeyState(key_state: bool) callconv(.C) void;
    pub const setRecordKeyState = libtes3mp_SetRecordKeyState;
    extern "libTES3MP-core" fn libtes3mp_SetRecordScrollState(scroll_state: bool) callconv(.C) void;
    pub const setRecordScrollState = libtes3mp_SetRecordScrollState;
    extern "libTES3MP-core" fn libtes3mp_SetRecordSkillId(skill_id: c_int) callconv(.C) void;
    pub const setRecordSkillId = libtes3mp_SetRecordSkillId;
    extern "libTES3MP-core" fn libtes3mp_SetRecordText(text: [*:0]const u8) callconv(.C) void;
    pub const setRecordText = libtes3mp_SetRecordText;

    extern "libTES3MP-core" fn libtes3mp_SetRecordHair(hair: [*:0]const u8) callconv(.C) void;
    pub const setRecordHair = libtes3mp_SetRecordHair;
    extern "libTES3MP-core" fn libtes3mp_SetRecordHead(head: [*:0]const u8) callconv(.C) void;
    pub const setRecordHead = libtes3mp_SetRecordHead;
    extern "libTES3MP-core" fn libtes3mp_SetRecordGender(gender: c_uint) callconv(.C) void;
    pub const setRecordGender = libtes3mp_SetRecordGender;
    extern "libTES3MP-core" fn libtes3mp_SetRecordRace(race: [*:0]const u8) callconv(.C) void;
    pub const setRecordRace = libtes3mp_SetRecordRace;
    extern "libTES3MP-core" fn libtes3mp_SetRecordClass(char_class: [*:0]const u8) callconv(.C) void;
    pub const setRecordClass = libtes3mp_SetRecordClass;
    extern "libTES3MP-core" fn libtes3mp_SetRecordFaction(faction: [*:0]const u8) callconv(.C) void;
    pub const setRecordFaction = libtes3mp_SetRecordFaction;

    extern "libTES3MP-core" fn libtes3mp_SetRecordScale(scale: f64) callconv(.C) void;
    pub const setRecordScale = libtes3mp_SetRecordScale;
    extern "libTES3MP-core" fn libtes3mp_SetRecordBloodType(blood_type: c_int) callconv(.C) void;
    pub const setRecordBloodType = libtes3mp_SetRecordBloodType;
    extern "libTES3MP-core" fn libtes3mp_SetRecordVampireState(vampire_state: bool) callconv(.C) void;
    pub const setRecordVampireState = libtes3mp_SetRecordVampireState;

    extern "libTES3MP-core" fn libtes3mp_SetRecordLevel(level: c_int) callconv(.C) void;
    pub const setRecordLevel = libtes3mp_SetRecordLevel;
    extern "libTES3MP-core" fn libtes3mp_SetRecordMagicka(magicka: c_int) callconv(.C) void;
    pub const setRecordMagicka = libtes3mp_SetRecordMagicka;
    extern "libTES3MP-core" fn libtes3mp_SetRecordFatigue(fatigue: c_int) callconv(.C) void;
    pub const setRecordFatigue = libtes3mp_SetRecordFatigue;

    extern "libTES3MP-core" fn libtes3mp_SetRecordSoulValue(soul_value: c_int) callconv(.C) void;
    pub const setRecordSoulValue = libtes3mp_SetRecordSoulValue;

    extern "libTES3MP-core" fn libtes3mp_SetRecordAIFight(ai_fight: c_int) callconv(.C) void;
    pub const setRecordAIFight = libtes3mp_SetRecordAIFight;
    extern "libTES3MP-core" fn libtes3mp_SetRecordAIFlee(ai_flee: c_int) callconv(.C) void;
    pub const setRecordAIFlee = libtes3mp_SetRecordAIFlee;
    extern "libTES3MP-core" fn libtes3mp_SetRecordAIAlarm(ai_alarm: c_int) callconv(.C) void;
    pub const setRecordAIAlarm = libtes3mp_SetRecordAIAlarm;
    extern "libTES3MP-core" fn libtes3mp_SetRecordAIServices(ai_services: c_int) callconv(.C) void;
    pub const setRecordAIServices = libtes3mp_SetRecordAIServices;

    extern "libTES3MP-core" fn libtes3mp_SetRecordSound(sound: [*:0]const u8) callconv(.C) void;
    pub const setRecordSound = libtes3mp_SetRecordSound;
    extern "libTES3MP-core" fn libtes3mp_SetRecordVolume(volume: f64) callconv(.C) void;
    pub const setRecordVolume = libtes3mp_SetRecordVolume;
    extern "libTES3MP-core" fn libtes3mp_SetRecordMinRange(min_range: f64) callconv(.C) void;
    pub const setRecordMinRange = libtes3mp_SetRecordMinRange;
    extern "libTES3MP-core" fn libtes3mp_SetRecordMaxRange(max_range: f64) callconv(.C) void;
    pub const setRecordMaxRange = libtes3mp_SetRecordMaxRange;
    extern "libTES3MP-core" fn libtes3mp_SetRecordOpenSound(sound: [*:0]const u8) callconv(.C) void;
    pub const setRecordOpenSound = libtes3mp_SetRecordOpenSound;
    extern "libTES3MP-core" fn libtes3mp_SetRecordCloseSound(sound: [*:0]const u8) callconv(.C) void;
    pub const setRecordCloseSound = libtes3mp_SetRecordCloseSound;

    extern "libTES3MP-core" fn libtes3mp_SetRecordScriptText(script_text: [*:0]const u8) callconv(.C) void;
    pub const setRecordScriptText = libtes3mp_SetRecordScriptText;
    extern "libTES3MP-core" fn libtes3mp_SetRecordIntegerVariable(int_var: c_int) callconv(.C) void;
    pub const setRecordIntegerVariable = libtes3mp_SetRecordIntegerVariable;
    extern "libTES3MP-core" fn libtes3mp_SetRecordFloatVariable(float_var: f64) callconv(.C) void;
    pub const setRecordFloatVariable = libtes3mp_SetRecordFloatVariable;
    extern "libTES3MP-core" fn libtes3mp_SetRecordStringVariable(string_var: [*:0]const u8) callconv(.C) void;
    pub const setRecordStringVariable = libtes3mp_SetRecordStringVariable;

    extern "libTES3MP-core" fn libtes3mp_SetRecordIdByIndex(index: c_uint, id: [*:0]const u8) callconv(.C) void;
    pub const setRecordIdByIndex = libtes3mp_SetRecordIdByIndex;
    extern "libTES3MP-core" fn libtes3mp_SetRecordEnchantmentIdByIndex(index: c_uint, enchantment_id: [*:0]const u8) callconv(.C) void;
    pub const setRecordEnchantmentIdByIndex = libtes3mp_SetRecordEnchantmentIdByIndex;

    extern "libTES3MP-core" fn libtes3mp_SetRecordEffectId(effect_id: c_uint) callconv(.C) void;
    pub const setRecordEffectId = libtes3mp_SetRecordEffectId;
    extern "libTES3MP-core" fn libtes3mp_SetRecordEffectAttribute(attribute_id: c_int) callconv(.C) void;
    pub const setRecordEffectAttribute = libtes3mp_SetRecordEffectAttribute;
    extern "libTES3MP-core" fn libtes3mp_SetRecordEffectSkill(skill_id: c_int) callconv(.C) void;
    pub const setRecordEffectSkill = libtes3mp_SetRecordEffectSkill;
    extern "libTES3MP-core" fn libtes3mp_SetRecordEffectRangeType(range_type: c_uint) callconv(.C) void;
    pub const setRecordEffectRangeType = libtes3mp_SetRecordEffectRangeType;
    extern "libTES3MP-core" fn libtes3mp_SetRecordEffectArea(area: c_int) callconv(.C) void;
    pub const setRecordEffectArea = libtes3mp_SetRecordEffectArea;
    extern "libTES3MP-core" fn libtes3mp_SetRecordEffectDuration(duration: c_int) callconv(.C) void;
    pub const setRecordEffectDuration = libtes3mp_SetRecordEffectDuration;
    extern "libTES3MP-core" fn libtes3mp_SetRecordEffectMagnitudeMax(magnitude_max: c_int) callconv(.C) void;
    pub const setRecordEffectMagnitudeMax = libtes3mp_SetRecordEffectMagnitudeMax;
    extern "libTES3MP-core" fn libtes3mp_SetRecordEffectMagnitudeMin(magnitude_min: c_int) callconv(.C) void;
    pub const setRecordEffectMagnitudeMin = libtes3mp_SetRecordEffectMagnitudeMin;

    extern "libTES3MP-core" fn libtes3mp_SetRecordBodyPartType(part_type: c_uint) callconv(.C) void;
    pub const setRecordBodyPartType = libtes3mp_SetRecordBodyPartType;
    extern "libTES3MP-core" fn libtes3mp_SetRecordBodyPartIdForMale(part_id: [*:0]const u8) callconv(.C) void;
    pub const setRecordBodyPartIdForMale = libtes3mp_SetRecordBodyPartIdForMale;
    extern "libTES3MP-core" fn libtes3mp_SetRecordBodyPartIdForFemale(part_id: [*:0]const u8) callconv(.C) void;
    pub const setRecordBodyPartIdForFemale = libtes3mp_SetRecordBodyPartIdForFemale;

    extern "libTES3MP-core" fn libtes3mp_SetRecordInventoryItemId(item_id: [*:0]const u8) callconv(.C) void;
    pub const setRecordInventoryItemId = libtes3mp_SetRecordInventoryItemId;
    extern "libTES3MP-core" fn libtes3mp_SetRecordInventoryItemCount(count: c_uint) callconv(.C) void;
    pub const setRecordInventoryItemCount = libtes3mp_SetRecordInventoryItemCount;

    extern "libTES3MP-core" fn libtes3mp_AddRecord() callconv(.C) void;
    pub const addRecord = libtes3mp_AddRecord;
    extern "libTES3MP-core" fn libtes3mp_AddRecordEffect() callconv(.C) void;
    pub const addRecordEffect = libtes3mp_AddRecordEffect;
    extern "libTES3MP-core" fn libtes3mp_AddRecordBodyPart() callconv(.C) void;
    pub const addRecordBodyPart = libtes3mp_AddRecordBodyPart;
    extern "libTES3MP-core" fn libtes3mp_AddRecordInventoryItem() callconv(.C) void;
    pub const addRecordInventoryItem = libtes3mp_AddRecordInventoryItem;

    extern "libTES3MP-core" fn libtes3mp_SendRecordDynamic(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendRecordDynamic = libtes3mp_SendRecordDynamic;
};
