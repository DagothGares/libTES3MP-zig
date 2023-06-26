const std = @import("std");

pub const Weather = enum(u4) {
    Clear,
    Cloudy,
    Foggy,
    Overcast,
    Rain,
    Thunder,
    Ash,
    Blight,
    Snow,
    Blizzard,
};

pub const VariableType = enum(u3) {
    Short,
    Long,
    Float,

    /// It is unclear if this type is implemented,
    /// and what the difference is from a standard long.
    Int,
    /// It is unclear if this type is implemented.
    String,
};

const VariableTypeError = error{MustBeInteger};

pub fn readReceivedWorldState() void {
    return impl_ReadReceivedWorldstate();
}

/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn copyReceivedWorldStateToStore() void {
    return impl_CopyReceivedWorldstateToStore();
}

pub fn clearKillChanges() void {
    return impl_ClearKillChanges();
}
pub fn clearMapChanges() void {
    return impl_ClearMapChanges();
}
pub fn clearClientGlobals() void {
    return impl_ClearClientGlobals();
}

/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getKillChangesSize() c_uint {
    return impl_GetKillChangesSize();
}
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getMapChangesSize() c_uint {
    return impl_GetMapChangesSize();
}
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getClientGlobalsSize() c_uint {
    return impl_GetClientGlobalsSize();
}

/// Callers are expected to first call readReceivedWorldstate(), if necessary.
///
/// TES3MP owns the value returned by this function. Copy the contents if you wish to keep it
/// after your initial callback returns.
pub fn getKillRefId(index: c_uint) [:0]const u8 {
    std.debug.assert(getKillChangesSize() > index);

    return std.mem.span(impl_GetKillRefId(index).?);
}
pub fn getKillNumber(index: c_uint) c_uint {
    std.debug.assert(getKillChangesSize() > index);

    return impl_GetKillNumber(index);
}

/// Callers are expected to first call readReceivedWorldstate(), if necessary.
///
/// TES3MP owns the value returned by this function. Copy the contents if you wish to keep it
/// after your initial callback returns.
pub fn getWeatherRegion() [:0]const u8 {
    return std.mem.span(impl_GetWeatherRegion().?);
}
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getWeatherCurrent() Weather {
    return @enumFromInt(Weather, impl_GetWeatherCurrent());
}
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getWeatherNext() Weather {
    return @enumFromInt(Weather, impl_GetWeatherNext());
}
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getWeatherQueued() Weather {
    return @enumFromInt(Weather, impl_GetWeatherQueued());
}
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getWeatherTransitionFactor() f32 {
    return @floatCast(f32, impl_GetWeatherTransitionFactor());
}

/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getMapTileCellX(index: c_uint) c_int {
    std.debug.assert(getMapChangesSize() > index);

    return impl_GetMapTileCellX(index);
}
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getMapTileCellY(index: c_uint) c_int {
    std.debug.assert(getMapChangesSize() > index);

    return impl_GetMapTileCellY(index);
}

/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getClientGlobalId(index: c_uint) [:0]const u8 {
    std.debug.assert(getClientGlobalsSize() > index);

    return impl_GetClientGlobalId(index);
}
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getClientGlobalVariableType(index: c_uint) VariableType {
    std.debug.assert(getClientGlobalsSize() > index);

    return @enumFromInt(VariableType, impl_GetClientGlobalVariableType(index));
}
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getClientGlobalIntValue(index: c_uint) c_int {
    std.debug.assert(getClientGlobalsSize() > index);

    return impl_GetClientGlobalIntValue(index);
}
/// Callers are expected to first call readReceivedWorldstate(), if necessary.
pub fn getClientGlobalFloatValue(index: c_uint) f32 {
    std.debug.assert(getClientGlobalsSize() > index);

    return @floatCast(f32, impl_GetClientGlobalFloatValue(index));
}

pub fn setAuthorityRegion(authority_region: [:0]const u8) void {
    return impl_SetAuthorityRegion(authority_region);
}

pub fn setWeatherRegion(region: [:0]const u8) void {
    return impl_SetWeatherRegion(region);
}
pub fn setWeatherForceState(state: bool) void {
    return impl_SetWeatherForceState(state);
}
pub fn setWeatherCurrent(current_weather: Weather) void {
    return impl_SetWeatherCurrent(@intFromEnum(current_weather));
}
pub fn setWeatherNext(next_weather: Weather) void {
    return impl_SetWeatherNext(@intFromEnum(next_weather));
}
pub fn setWeatherQueued(queued_weather: Weather) void {
    return impl_SetWeatherQueued(@intFromEnum(queued_weather));
}
/// Despite SetWeatherTransitionFactor claiming to use a double, it actually stores a float.
pub fn setWeatherTransitionFactor(transition_factor: f32) void {
    return impl_SetWeatherTransitionFactor(transition_factor);
}

/// Despite SetHour claiming to use a double, it actually stores a float.
pub fn setHour(hour: f32) void {
    return impl_SetHour(hour);
}
pub fn setDay(day: c_int) void {
    return impl_SetDay(day);
}
pub fn setMonth(month: c_int) void {
    return impl_SetMonth(month);
}
pub fn setYear(year: c_int) void {
    return impl_SetYear(year);
}
pub fn setDaysPassed(days_passed: c_int) void {
    return impl_SetDaysPassed(days_passed);
}
/// Despite SetTimeScale claiming to use a double, it actually stores a float.
pub fn setTimeScale(timescale: f32) void {
    return impl_SetTimeScale(timescale);
}

pub fn setPlayerCollisionState(state: bool) void {
    return impl_SetPlayerCollisionState(state);
}
pub fn setActorCollisionState(state: bool) void {
    return impl_SetActorCollisionState(state);
}
pub fn setPlacedObjectCollisionState(state: bool) void {
    return impl_SetPlacedObjectCollisionState(state);
}
pub fn useActorCollisionForPlacedObjects(use_actor_collision: bool) void {
    return impl_UseActorCollisionForPlacedObjects(use_actor_collision);
}

pub fn addKill(ref_id: [:0]const u8, count: c_int) void {
    return impl_AddKill(ref_id, count);
}
pub fn addClientGlobalVariable(
    id: [:0]const u8,
    value: anytype,
) void {
    switch (@typeInfo(@TypeOf(value))) {
        .Int => if (@bitSizeOf(value) <= @bitSizeOf(c_ushort))
            return impl_AddClientGlobalInteger(id, @as(c_ushort, value), 0)
        else if (@bitSizeOf(value) <= @bitSizeOf(c_uint))
            return impl_AddClientGlobalInteger(id, @as(c_uint, value), 1)
        else
            @compileError("Cannot add client global variable larger than c_uint"),
        .Float => if (@bitSizeOf(value) <= @bitSizeOf(f32))
            return impl_AddClientGlobalFloat(id, @as(f32, value), 2)
        else
            @compileError("Cannot add client global variable larger than f32"),
        else => @compileError("Not implemented for type " ++ @typeName(@TypeOf(value))),
    }
}
pub fn addSynchronizedClientScriptId(script_id: [:0]const u8) void {
    return impl_AddSynchronizedClientScriptId(script_id);
}
pub fn addSynchronizedClientGlobalId(global_id: [:0]const u8) void {
    return impl_AddSynchronizedClientGlobalId(global_id);
}
pub fn addEnforcedCollisionRefId(ref_id: [:0]const u8) void {
    return impl_AddEnforcedCollisionRefId(ref_id);
}
pub fn addCellToReset(cell_description: [:0]const u8) void {
    return impl_AddCellToReset(cell_description);
}
pub fn addDestinationOverride(old_cell: [:0]const u8, new_cell: [:0]const u8) void {
    return impl_AddDestinationOverride(old_cell, new_cell);
}

pub fn clearSynchronizedClientScriptIds() void {
    return impl_ClearSynchronizedClientScriptIds();
}
pub fn clearSynchronizedClientGlobalIds() void {
    return impl_ClearSynchronizedClientGlobalIds();
}
pub fn clearEnforcedCollisionRefIds() void {
    return impl_ClearEnforcedCollisionRefIds();
}
pub fn clearCellsToReset() void {
    return impl_ClearCellsToReset();
}
pub fn clearDestinationOverrides() void {
    return impl_ClearDestinationOverrides();
}

pub fn saveMapTileImageFile(index: c_uint, file_path: [:0]const u8) void {
    return impl_SaveMapTileImageFile(index, file_path);
}
pub fn loadMapTileImageFile(x: c_int, y: c_int, file_path: [:0]const u8) void {
    return impl_LoadMapTileImageFile(x, y, file_path);
}

pub fn sendClientScriptGlobal(pid: c_ushort, for_everyone: bool, skip_attached_player: bool) void {
    return impl_SendClientScriptGlobal(pid, for_everyone, skip_attached_player);
}
pub fn sendClientScriptSettings(
    pid: c_ushort,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    return impl_SendClientScriptSettings(pid, for_everyone, skip_attached_player);
}
pub fn sendWorldKillCount(pid: c_ushort, for_everyone: bool, skip_attached_player: bool) void {
    return impl_SendWorldKillCount(pid, for_everyone, skip_attached_player);
}
pub fn sendWorldRegionAuthority(pid: c_ushort) void {
    return impl_SendWorldRegionAuthority(pid);
}
pub fn sendWorldMap(pid: c_ushort, for_everyone: bool, skip_attached_player: bool) void {
    return impl_SendWorldMap(pid, for_everyone, skip_attached_player);
}
pub fn sendWorldTime(pid: c_ushort, for_everyone: bool, skip_attached_player: bool) void {
    return impl_SendWorldTime(pid, for_everyone, skip_attached_player);
}
pub fn sendWorldWeather(pid: c_ushort, for_everyone: bool, skip_attached_player: bool) void {
    return impl_SendWorldWeather(pid, for_everyone, skip_attached_player);
}
pub fn sendWorldCollisionOverride(
    pid: c_ushort,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    return impl_SendWorldCollisionOverride(pid, for_everyone, skip_attached_player);
}
pub fn sendCellReset(pid: c_ushort, for_everyone: bool) void {
    return impl_SendCellReset(pid, for_everyone);
}
pub fn sendWorldDestinationOverride(
    pid: c_ushort,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    return impl_SendWorldDestinationOverride(pid, for_everyone, skip_attached_player);
}

extern "libTES3MP-core" fn impl_ReadReceivedWorldstate() callconv(.C) void;

extern "libTES3MP-core" fn impl_CopyReceivedWorldstateToStore() callconv(.C) void;

extern "libTES3MP-core" fn impl_ClearKillChanges() callconv(.C) void;
extern "libTES3MP-core" fn impl_ClearMapChanges() callconv(.C) void;
extern "libTES3MP-core" fn impl_ClearClientGlobals() callconv(.C) void;

extern "libTES3MP-core" fn impl_GetKillChangesSize() callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetMapChangesSize() callconv(.C) c_uint;
extern "libTES3MP-core" fn impl_GetClientGlobalsSize() callconv(.C) c_uint;

extern "libTES3MP-core" fn impl_GetKillRefId(c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetKillNumber(c_uint) callconv(.C) c_uint;

extern "libTES3MP-core" fn impl_GetWeatherRegion() callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetWeatherCurrent() callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetWeatherNext() callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetWeatherQueued() callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetWeatherTransitionFactor() callconv(.C) f64;

extern "libTES3MP-core" fn impl_GetMapTileCellX(c_uint) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetMapTileCellY(c_uint) callconv(.C) c_int;

extern "libTES3MP-core" fn impl_GetClientGlobalId(c_uint) callconv(.C) ?[*:0]const u8;
extern "libTES3MP-core" fn impl_GetClientGlobalVariableType(c_uint) callconv(.C) c_ushort;
extern "libTES3MP-core" fn impl_GetClientGlobalIntValue(c_uint) callconv(.C) c_int;
extern "libTES3MP-core" fn impl_GetClientGlobalFloatValue(c_uint) callconv(.C) f64;

extern "libTES3MP-core" fn impl_SetAuthorityRegion([*:0]const u8) callconv(.C) void;

extern "libTES3MP-core" fn impl_SetWeatherRegion([*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetWeatherForceState(bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetWeatherCurrent(c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetWeatherNext(c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetWeatherQueued(c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetWeatherTransitionFactor(f64) callconv(.C) void;

extern "libTES3MP-core" fn impl_SetHour(f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetDay(c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetMonth(c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetYear(c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetDaysPassed(c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetTimeScale(f64) callconv(.C) void;

extern "libTES3MP-core" fn impl_SetPlayerCollisionState(bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetActorCollisionState(bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SetPlacedObjectCollisionState(bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_UseActorCollisionForPlacedObjects(bool) callconv(.C) void;

extern "libTES3MP-core" fn impl_AddKill([*:0]const u8, c_int) callconv(.C) void;
extern "libTES3MP-core" fn impl_AddClientGlobalInteger([*:0]const u8, c_int, c_uint) callconv(.C) void;
extern "libTES3MP-core" fn impl_AddClientGlobalFloat([*:0]const u8, f64) callconv(.C) void;
extern "libTES3MP-core" fn impl_AddSynchronizedClientScriptId([*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_AddSynchronizedClientGlobalId([*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_AddEnforcedCollisionRefId([*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_AddCellToReset([*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_AddDestinationOverride([*:0]const u8, [*:0]const u8) callconv(.C) void;

extern "libTES3MP-core" fn impl_ClearSynchronizedClientScriptIds() callconv(.C) void;
extern "libTES3MP-core" fn impl_ClearSynchronizedClientGlobalIds() callconv(.C) void;
extern "libTES3MP-core" fn impl_ClearEnforcedCollisionRefIds() callconv(.C) void;
extern "libTES3MP-core" fn impl_ClearCellsToReset() callconv(.C) void;
extern "libTES3MP-core" fn impl_ClearDestinationOverrides() callconv(.C) void;

extern "libTES3MP-core" fn impl_SaveMapTileImageFile(c_uint, [*:0]const u8) callconv(.C) void;
extern "libTES3MP-core" fn impl_LoadMapTileImageFile(c_int, c_int, [*:0]const u8) callconv(.C) void;

extern "libTES3MP-core" fn impl_SendClientScriptGlobal(c_ushort, bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendClientScriptSettings(c_ushort, bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendWorldKillCount(c_ushort, bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendWorldRegionAuthority(c_ushort) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendWorldMap(c_ushort, bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendWorldTime(c_ushort, bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendWorldWeather(c_ushort, bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendWorldCollisionOverride(c_ushort, bool, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendCellReset(c_ushort, bool) callconv(.C) void;
extern "libTES3MP-core" fn impl_SendWorldDestinationOverride(c_ushort, bool, bool) callconv(.C) void;
