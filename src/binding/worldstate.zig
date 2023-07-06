const std = @import("std");

const shared = @import("shared.zig");

pub const Weather = enum(u4) {
    clear,
    cloudy,
    foggy,
    overcast,
    rain,
    thunder,
    ash,
    blight,
    snow,
    blizzard,
};

pub const VariableType = @import("object.zig").VariableType;

pub fn readReceivedWorldstate() void {
    return raw.readReceivedWorldstate();
}

pub fn copyReceivedWorldstateToStore() void {
    return raw.copyReceivedWorldstateToStore();
}

pub fn clearKillChanges() void {
    return raw.clearKillChanges();
}
pub fn clearMapChanges() void {
    return raw.clearMapChanges();
}
pub fn clearClientGlobals() void {
    return raw.clearClientGlobals();
}

pub fn getKillChangesSize() c_uint {
    return raw.getKillChangesSize();
}
pub fn getMapChangesSize() c_uint {
    return raw.getMapChangesSize();
}
pub fn getClientGlobalsSize() u32 {
    return raw.getClientGlobalsSize();
}

pub fn getKillRefId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getKillChangesSize(), index);

    return std.mem.span(raw.getKillRefId(index).?);
}
pub fn getKillNumber(index: u32) i32 {
    shared.triggerSafetyCheck(getKillChangesSize(), index);

    return raw.getKillNumber(index);
}

pub fn getWeatherRegion() [:0]const u8 {
    return std.mem.span(raw.getWeatherRegion().?);
}
pub fn getWeatherCurrent() Weather {
    return @enumFromInt(raw.getWeatherCurrent());
}
pub fn getWeatherNext() Weather {
    return @enumFromInt(raw.getWeatherNext());
}
pub fn getWeatherQueued() Weather {
    return @enumFromInt(raw.getWeatherQueued());
}
pub fn getWeatherTransitionFactor() f64 {
    return raw.getWeatherTransitionFactor();
}

pub fn getMapTileCellX(index: u32) i32 {
    shared.triggerSafetyCheck(getMapChangesSize(), index);

    return raw.getMapTileCellX(index);
}
pub fn getMapTileCellY(index: u32) i32 {
    shared.triggerSafetyCheck(getMapChangesSize(), index);

    return raw.getMapTileCellY(index);
}

pub fn getClientGlobalId(index: u32) [:0]const u8 {
    shared.triggerSafetyCheck(getClientGlobalsSize(), index);

    return std.mem.span(raw.getClientGlobalId(index).?);
}
pub fn getClientGlobalVariableType(index: u32) VariableType {
    shared.triggerSafetyCheck(getClientGlobalsSize(), index);

    return @enumFromInt(raw.getClientGlobalVariableType(index));
}
pub fn getClientGlobal(index: u32) union(enum) { int: i32, float: f64 } {
    return switch (getClientGlobalVariableType(index)) {
        .short, .long => .{ .int = raw.getClientGlobalIntValue(index) },
        .float => .{ .float = raw.getClientGlobalFloatValue(index) },
        else => unreachable,
    };
}

pub fn setAuthorityRegion(authority_region: [:0]const u8) void {
    return raw.setAuthorityRegion(authority_region);
}

pub fn setWeatherRegion(region: [:0]const u8) void {
    return raw.setWeatherRegion(region);
}
pub fn setWeatherForceState(force_state: bool) void {
    return raw.setWeatherForceState(force_state);
}
pub fn setWeatherCurrent(current_weather: Weather) void {
    return raw.setWeatherCurrent(@intFromEnum(current_weather));
}
pub fn setWeatherNext(next_weather: Weather) void {
    return raw.setWeatherNext(@intFromEnum(next_weather));
}
pub fn setWeatherQueued(queued_weather: Weather) void {
    return raw.setWeatherQueued(@intFromEnum(queued_weather));
}
pub fn setWeatherTransitionFactor(transition_factor: f64) void {
    return raw.setWeatherTransitionFactor(transition_factor);
}

pub fn setHour(hour: f64) void {
    return raw.setHour(hour);
}
pub fn setDay(day: i32) void {
    return raw.setDay(day);
}
pub fn setMonth(month: i32) void {
    return raw.setMonth(month);
}
pub fn setYear(year: i32) void {
    return raw.setYear(year);
}
pub fn setDaysPassed(days_passed: i32) void {
    return raw.setDaysPassed(days_passed);
}
pub fn setTimeScale(time_scale: f64) void {
    return raw.setTimeScale(time_scale);
}

pub fn setPlayerCollisionState(state: bool) void {
    return raw.setPlayerCollisionState(state);
}
pub fn setActorCollisionState(state: bool) void {
    return raw.setActorCollisionState(state);
}
pub fn setPlacedObjectCollisionState(state: bool) void {
    return raw.setPlacedObjectCollisionState(state);
}
pub fn useActorCollisionForPlacedObjects(use_actor_collision: bool) void {
    return raw.useActorCollisionForPlacedObjects(use_actor_collision);
}

pub fn addKill(ref_id: [:0]const u8, number: i32) void {
    return raw.addKill(ref_id, number);
}
pub fn addClientGlobal(id: [:0]const u8, value: anytype) void {
    const T = @TypeOf(value);
    switch (@typeInfo(T)) {
        .Int => |int| {
            if (int.bits <= @typeInfo(c_ushort).Int.bits) {
                return raw.addClientGlobalInteger(id, value, @intFromEnum(VariableType.short));
            } else if (int.bits <= @typeInfo(c_int).Int.bits) {
                return raw.addClientGlobalInteger(id, value, @intFromEnum(VariableType.long));
            } else {
                @compileError("addClientGlobal cannot be used with " ++ @typeName(T));
            }
        },
        .Float => |float| {
            if (float.bits <= 64) {
                return raw.addClientGlobalFloat(id, value);
            } else {
                @compileError("addClientGlobal cannot be used with " ++ @typeName(T));
            }
        },
        else => @compileError("addClientGlobal cannot be used with " ++ @typeName(T)),
    }
}
pub fn addSynchronizedClientScriptId(script_id: [:0]const u8) void {
    return raw.addSynchronizedClientScriptId(script_id);
}
pub fn addSynchronizedClientGlobalId(global_id: [:0]const u8) void {
    return raw.addSynchronizedClientGlobalId(global_id);
}
pub fn addEnforcedCollisionRefId(ref_id: [:0]const u8) void {
    return raw.addEnforcedCollisionRefId(ref_id);
}
pub fn addCellToReset(cell_description: [:0]const u8) void {
    return raw.addCellToReset(cell_description);
}
pub fn addDestinationOverride(old_cell_description: [:0]const u8, new_cell_description: [:0]const u8) void {
    return raw.addDestinationOverride(old_cell_description, new_cell_description);
}

pub fn clearSynchronizedClientScriptIds() void {
    return raw.clearSynchronizedClientScriptIds();
}
pub fn clearSynchronizedClientGlobalIds() void {
    return raw.clearSynchronizedClientGlobalIds();
}
pub fn clearEnforcedCollisionRefIds() void {
    return raw.clearEnforcedCollisionRefIds();
}
pub fn clearCellsToReset() void {
    return raw.clearCellsToReset();
}
pub fn clearDestinationOverrides() void {
    return raw.clearDestinationOverrides();
}

pub fn saveMapTileImageFile(index: u32, file_path: [:0]const u8) void {
    shared.triggerSafetyCheck(getMapChangesSize(), index);

    return raw.saveMapTileImageFile(index, file_path);
}
pub fn loadMapTileImageFile(cell_x: i32, cell_y: i32, file_path: [:0]const u8) void {
    return raw.loadMapTileImageFile(cell_x, cell_y, file_path);
}

pub fn sendClientScriptGlobal(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendClientScriptGlobal(pid, send_to_other_players, skip_attached_player);
}
pub fn sendClientScriptSettings(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendClientScriptSettings(pid, send_to_other_players, skip_attached_player);
}
pub fn sendWorldKillCount(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendWorldKillCount(pid, send_to_other_players, skip_attached_player);
}
pub fn sendWorldMap(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendWorldMap(pid, send_to_other_players, skip_attached_player);
}
pub fn sendWorldTime(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendWorldTime(pid, send_to_other_players, skip_attached_player);
}
pub fn sendWorldWeather(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendWorldWeather(pid, send_to_other_players, skip_attached_player);
}
pub fn sendWorldCollisionOverride(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendWorldCollisionOverride(pid, send_to_other_players, skip_attached_player);
}
pub fn sendCellReset(pid: u16, send_to_other_players: bool) void {
    return raw.sendCellReset(pid, send_to_other_players);
}
pub fn sendWorldDestinationOverride(pid: u16, send_to_other_players: bool, skip_attached_player: bool) void {
    return raw.sendWorldDestinationOverride(pid, send_to_other_players, skip_attached_player);
}
pub fn sendWorldRegionAuthority(pid: u16) void {
    return raw.sendWorldRegionAuthority(pid);
}

pub const raw = struct {
    extern "libTES3MP-core" fn libtes3mp_ReadReceivedWorldstate() callconv(.C) void;
    pub const readReceivedWorldstate = libtes3mp_ReadReceivedWorldstate;

    extern "libTES3MP-core" fn libtes3mp_CopyReceivedWorldstateToStore() callconv(.C) void;
    pub const copyReceivedWorldstateToStore = libtes3mp_CopyReceivedWorldstateToStore;

    extern "libTES3MP-core" fn libtes3mp_ClearKillChanges() callconv(.C) void;
    pub const clearKillChanges = libtes3mp_ClearKillChanges;
    extern "libTES3MP-core" fn libtes3mp_ClearMapChanges() callconv(.C) void;
    pub const clearMapChanges = libtes3mp_ClearMapChanges;
    extern "libTES3MP-core" fn libtes3mp_ClearClientGlobals() callconv(.C) void;
    pub const clearClientGlobals = libtes3mp_ClearClientGlobals;

    extern "libTES3MP-core" fn libtes3mp_GetKillChangesSize() callconv(.C) c_uint;
    pub const getKillChangesSize = libtes3mp_GetKillChangesSize;
    extern "libTES3MP-core" fn libtes3mp_GetMapChangesSize() callconv(.C) c_uint;
    pub const getMapChangesSize = libtes3mp_GetMapChangesSize;
    extern "libTES3MP-core" fn libtes3mp_GetClientGlobalsSize() callconv(.C) c_uint;
    pub const getClientGlobalsSize = libtes3mp_GetClientGlobalsSize;

    extern "libTES3MP-core" fn libtes3mp_GetKillRefId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getKillRefId = libtes3mp_GetKillRefId;
    extern "libTES3MP-core" fn libtes3mp_GetKillNumber(index: c_uint) callconv(.C) c_int;
    pub const getKillNumber = libtes3mp_GetKillNumber;

    extern "libTES3MP-core" fn libtes3mp_GetWeatherRegion() callconv(.C) ?[*:0]const u8;
    pub const getWeatherRegion = libtes3mp_GetWeatherRegion;
    extern "libTES3MP-core" fn libtes3mp_GetWeatherCurrent() callconv(.C) c_int;
    pub const getWeatherCurrent = libtes3mp_GetWeatherCurrent;
    extern "libTES3MP-core" fn libtes3mp_GetWeatherNext() callconv(.C) c_int;
    pub const getWeatherNext = libtes3mp_GetWeatherNext;
    extern "libTES3MP-core" fn libtes3mp_GetWeatherQueued() callconv(.C) c_int;
    pub const getWeatherQueued = libtes3mp_GetWeatherQueued;
    extern "libTES3MP-core" fn libtes3mp_GetWeatherTransitionFactor() callconv(.C) f64;
    pub const getWeatherTransitionFactor = libtes3mp_GetWeatherTransitionFactor;

    extern "libTES3MP-core" fn libtes3mp_GetMapTileCellX(index: c_uint) callconv(.C) c_int;
    pub const getMapTileCellX = libtes3mp_GetMapTileCellX;
    extern "libTES3MP-core" fn libtes3mp_GetMapTileCellY(index: c_uint) callconv(.C) c_int;
    pub const getMapTileCellY = libtes3mp_GetMapTileCellY;

    extern "libTES3MP-core" fn libtes3mp_GetClientGlobalId(index: c_uint) callconv(.C) ?[*:0]const u8;
    pub const getClientGlobalId = libtes3mp_GetClientGlobalId;
    extern "libTES3MP-core" fn libtes3mp_GetClientGlobalVariableType(index: c_uint) callconv(.C) c_ushort;
    pub const getClientGlobalVariableType = libtes3mp_GetClientGlobalVariableType;
    extern "libTES3MP-core" fn libtes3mp_GetClientGlobalIntValue(index: c_uint) callconv(.C) c_int;
    pub const getClientGlobalIntValue = libtes3mp_GetClientGlobalIntValue;
    extern "libTES3MP-core" fn libtes3mp_GetClientGlobalFloatValue(index: c_uint) callconv(.C) f64;
    pub const getClientGlobalFloatValue = libtes3mp_GetClientGlobalFloatValue;

    extern "libTES3MP-core" fn libtes3mp_SetAuthorityRegion(authority_region: [*:0]const u8) callconv(.C) void;
    pub const setAuthorityRegion = libtes3mp_SetAuthorityRegion;

    extern "libTES3MP-core" fn libtes3mp_SetWeatherRegion(region: [*:0]const u8) callconv(.C) void;
    pub const setWeatherRegion = libtes3mp_SetWeatherRegion;
    extern "libTES3MP-core" fn libtes3mp_SetWeatherForceState(force_state: bool) callconv(.C) void;
    pub const setWeatherForceState = libtes3mp_SetWeatherForceState;
    extern "libTES3MP-core" fn libtes3mp_SetWeatherCurrent(current_weather: c_int) callconv(.C) void;
    pub const setWeatherCurrent = libtes3mp_SetWeatherCurrent;
    extern "libTES3MP-core" fn libtes3mp_SetWeatherNext(next_weather: c_int) callconv(.C) void;
    pub const setWeatherNext = libtes3mp_SetWeatherNext;
    extern "libTES3MP-core" fn libtes3mp_SetWeatherQueued(queued_weather: c_int) callconv(.C) void;
    pub const setWeatherQueued = libtes3mp_SetWeatherQueued;
    extern "libTES3MP-core" fn libtes3mp_SetWeatherTransitionFactor(transition_factor: f64) callconv(.C) void;
    pub const setWeatherTransitionFactor = libtes3mp_SetWeatherTransitionFactor;

    extern "libTES3MP-core" fn libtes3mp_SetHour(hour: f64) callconv(.C) void;
    pub const setHour = libtes3mp_SetHour;
    extern "libTES3MP-core" fn libtes3mp_SetDay(day: c_int) callconv(.C) void;
    pub const setDay = libtes3mp_SetDay;
    extern "libTES3MP-core" fn libtes3mp_SetMonth(month: c_int) callconv(.C) void;
    pub const setMonth = libtes3mp_SetMonth;
    extern "libTES3MP-core" fn libtes3mp_SetYear(year: c_int) callconv(.C) void;
    pub const setYear = libtes3mp_SetYear;
    extern "libTES3MP-core" fn libtes3mp_SetDaysPassed(days_passed: c_int) callconv(.C) void;
    pub const setDaysPassed = libtes3mp_SetDaysPassed;
    extern "libTES3MP-core" fn libtes3mp_SetTimeScale(time_scale: f64) callconv(.C) void;
    pub const setTimeScale = libtes3mp_SetTimeScale;

    extern "libTES3MP-core" fn libtes3mp_SetPlayerCollisionState(state: bool) callconv(.C) void;
    pub const setPlayerCollisionState = libtes3mp_SetPlayerCollisionState;
    extern "libTES3MP-core" fn libtes3mp_SetActorCollisionState(state: bool) callconv(.C) void;
    pub const setActorCollisionState = libtes3mp_SetActorCollisionState;
    extern "libTES3MP-core" fn libtes3mp_SetPlacedObjectCollisionState(state: bool) callconv(.C) void;
    pub const setPlacedObjectCollisionState = libtes3mp_SetPlacedObjectCollisionState;
    extern "libTES3MP-core" fn libtes3mp_UseActorCollisionForPlacedObjects(use_actor_collision: bool) callconv(.C) void;
    pub const useActorCollisionForPlacedObjects = libtes3mp_UseActorCollisionForPlacedObjects;

    extern "libTES3MP-core" fn libtes3mp_AddKill(ref_id: [*:0]const u8, number: c_int) callconv(.C) void;
    pub const addKill = libtes3mp_AddKill;
    extern "libTES3MP-core" fn libtes3mp_AddClientGlobalInteger(id: [*:0]const u8, int_value: c_int, variable_type: c_uint) callconv(.C) void;
    pub const addClientGlobalInteger = libtes3mp_AddClientGlobalInteger;
    extern "libTES3MP-core" fn libtes3mp_AddClientGlobalFloat(id: [*:0]const u8, float_value: f64) callconv(.C) void;
    pub const addClientGlobalFloat = libtes3mp_AddClientGlobalFloat;
    extern "libTES3MP-core" fn libtes3mp_AddSynchronizedClientScriptId(script_id: [*:0]const u8) callconv(.C) void;
    pub const addSynchronizedClientScriptId = libtes3mp_AddSynchronizedClientScriptId;
    extern "libTES3MP-core" fn libtes3mp_AddSynchronizedClientGlobalId(global_id: [*:0]const u8) callconv(.C) void;
    pub const addSynchronizedClientGlobalId = libtes3mp_AddSynchronizedClientGlobalId;
    extern "libTES3MP-core" fn libtes3mp_AddEnforcedCollisionRefId(ref_id: [*:0]const u8) callconv(.C) void;
    pub const addEnforcedCollisionRefId = libtes3mp_AddEnforcedCollisionRefId;
    extern "libTES3MP-core" fn libtes3mp_AddCellToReset(cell_description: [*:0]const u8) callconv(.C) void;
    pub const addCellToReset = libtes3mp_AddCellToReset;
    extern "libTES3MP-core" fn libtes3mp_AddDestinationOverride(old_cell_description: [*:0]const u8, new_cell_description: [*:0]const u8) callconv(.C) void;
    pub const addDestinationOverride = libtes3mp_AddDestinationOverride;

    extern "libTES3MP-core" fn libtes3mp_ClearSynchronizedClientScriptIds() callconv(.C) void;
    pub const clearSynchronizedClientScriptIds = libtes3mp_ClearSynchronizedClientScriptIds;
    extern "libTES3MP-core" fn libtes3mp_ClearSynchronizedClientGlobalIds() callconv(.C) void;
    pub const clearSynchronizedClientGlobalIds = libtes3mp_ClearSynchronizedClientGlobalIds;
    extern "libTES3MP-core" fn libtes3mp_ClearEnforcedCollisionRefIds() callconv(.C) void;
    pub const clearEnforcedCollisionRefIds = libtes3mp_ClearEnforcedCollisionRefIds;
    extern "libTES3MP-core" fn libtes3mp_ClearCellsToReset() callconv(.C) void;
    pub const clearCellsToReset = libtes3mp_ClearCellsToReset;
    extern "libTES3MP-core" fn libtes3mp_ClearDestinationOverrides() callconv(.C) void;
    pub const clearDestinationOverrides = libtes3mp_ClearDestinationOverrides;

    extern "libTES3MP-core" fn libtes3mp_SaveMapTileImageFile(index: c_uint, file_path: [*:0]const u8) callconv(.C) void;
    pub const saveMapTileImageFile = libtes3mp_SaveMapTileImageFile;
    extern "libTES3MP-core" fn libtes3mp_LoadMapTileImageFile(cell_x: c_int, cell_y: c_int, file_path: [*:0]const u8) callconv(.C) void;
    pub const loadMapTileImageFile = libtes3mp_LoadMapTileImageFile;

    extern "libTES3MP-core" fn libtes3mp_SendClientScriptGlobal(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendClientScriptGlobal = libtes3mp_SendClientScriptGlobal;
    extern "libTES3MP-core" fn libtes3mp_SendClientScriptSettings(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendClientScriptSettings = libtes3mp_SendClientScriptSettings;
    extern "libTES3MP-core" fn libtes3mp_SendWorldKillCount(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendWorldKillCount = libtes3mp_SendWorldKillCount;
    extern "libTES3MP-core" fn libtes3mp_SendWorldMap(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendWorldMap = libtes3mp_SendWorldMap;
    extern "libTES3MP-core" fn libtes3mp_SendWorldTime(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendWorldTime = libtes3mp_SendWorldTime;
    extern "libTES3MP-core" fn libtes3mp_SendWorldWeather(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendWorldWeather = libtes3mp_SendWorldWeather;
    extern "libTES3MP-core" fn libtes3mp_SendWorldCollisionOverride(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendWorldCollisionOverride = libtes3mp_SendWorldCollisionOverride;
    extern "libTES3MP-core" fn libtes3mp_SendCellReset(pid: c_ushort, send_to_other_players: bool) callconv(.C) void;
    pub const sendCellReset = libtes3mp_SendCellReset;
    extern "libTES3MP-core" fn libtes3mp_SendWorldDestinationOverride(pid: c_ushort, send_to_other_players: bool, skip_attached_player: bool) callconv(.C) void;
    pub const sendWorldDestinationOverride = libtes3mp_SendWorldDestinationOverride;
    extern "libTES3MP-core" fn libtes3mp_SendWorldRegionAuthority(pid: c_ushort) callconv(.C) void;
    pub const sendWorldRegionAuthority = libtes3mp_SendWorldRegionAuthority;
};
