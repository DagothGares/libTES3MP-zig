const std = @import("std");

const impl = @import("binding.zig").worldstate;

const Allocator = std.mem.Allocator;

// This structure is optimized for storing a received weather state. If you wish to just push a new
// weather state, you can simply use copyReceivedWorldStateToStore, set the fields that you want to
// change, and then sendWorldWeather.

region: [:0]const u8 = impl.getWeatherRegion(),
current: impl.Weather = impl.getWeatherCurrent(),
next: impl.Weather = impl.getWeatherNext(),
queued: impl.Weather = impl.getWeatherQueued(),
transition_factor: f32 = impl.getWeatherTransitionFactor(),

const Self = @This();

/// Fetches a copy of the weather data for the latest read-only worldstate.
/// If you do not need to keep this around in memory after your initial callback ends,
/// instead consider initializing your Weather struct as
/// = .{};
/// as all fields are initialized by default.
///
/// Callers are expected to first call readReceivedWorldState(), if necessary.
pub fn fetchDupe(allocator: Allocator) Allocator.Error!Self {
    return .{
        .region = try allocator.dupe(u8, impl.getWeatherRegion()),
    };
}

/// You only need to call this if you used fetchDupe.
pub fn deinit(self: *Self, allocator: Allocator) void {
    allocator.free(self.region);

    self.* = undefined;
}

pub fn push(
    self: Self,
    force_state: bool,
    pid: c_ushort,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    impl.setWeatherForceState(force_state);
    impl.setWeatherRegion(self.region);
    impl.setWeatherCurrent(self.current);
    impl.setWeatherNext(self.next);
    impl.setWeatherQueued(self.queued);
    impl.setWeatherTransitionFactor(self.transition_factor);

    impl.sendWorldWeather(pid, for_everyone, skip_attached_player);
}
