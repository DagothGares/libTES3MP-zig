const impl = @import("binding.zig").worldstate;

pub fn set(
    old_cells: [][:0]const u8,
    new_cells: [][:0]const u8,
    pid: c_ushort,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    impl.clearDestinationOverrides();
    for (old_cells, new_cells) |old, new| {
        impl.addDestinationOverride(old, new);
    }

    impl.sendWorldDestinationOverride(pid, for_everyone, skip_attached_player);
}
