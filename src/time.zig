const impl = @import("binding.zig").worldstate;

pub const DateTime = struct {
    hour: ?f32 = null,
    day: ?i32 = null,
    month: ?i32 = null,
    year: ?i32 = null,
    days_passed: ?i32 = null,
    timescale: ?f32 = null,
};

/// If should_copy is true, the last read worldstate is used as the base for the write-only
/// worldstate. Use this option after calling readReceivedWorldState() if you do not provide the
/// entire set of time fields.
pub fn set(
    date_time: DateTime,
    should_copy: bool,
    pid: c_ushort,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    if (!should_copy) {
        impl.setHour(date_time.hour.?);
        impl.setDay(date_time.day.?);
        impl.setMonth(date_time.month.?);
        impl.setYear(date_time.year.?);
        impl.setDaysPassed(date_time.days_passed.?);
        impl.setTimeScale(date_time.timescale.?);
    } else {
        impl.copyReceivedWorldStateToStore();
        if (date_time.hour) |hour| impl.setHour(hour);
        if (date_time.day) |day| impl.setDay(day);
        if (date_time.month) |month| impl.setMonth(month);
        if (date_time.year) |year| impl.setYear(year);
        if (date_time.days_passed) |days_passed| impl.setDaysPassed(days_passed);
        if (date_time.timescale) |timescale| impl.setTimeScale(timescale);
    }

    impl.sendWorldTime(pid, for_everyone, skip_attached_player);
}
