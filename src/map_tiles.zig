const std = @import("std");

const Allocator = std.mem.Allocator;

const impl = @import("binding.zig").worldstate;

len: u32,
/// You will not get bounds checking with this unless you slice it to [0..len]!
x: [*]i32,
/// You will not get bounds checking with this unless you slice it to [0..len]!
y: [*]i32,

const Self = @This();

/// Fetches the X and Y coordinates of all the map tiles in the latest read-only worldstate.
///
/// Callers are expected to first call readReceivedWorldState(), if necessary.
pub fn fetch(allocator: Allocator) Allocator.Error!Self {
    const len = impl.getMapChangesSize();

    const xy = try allocator.alloc(i32, len * 2);
    errdefer allocator.free(xy);

    // It's more efficient to do it this way, as MapTile x and y fields should be next to eachother
    // in memory.
    for (xy[0..len], xy[len..], 0..) |*x, *y, i| {
        x.* = impl.getMapTileCellX(i);
        y.* = impl.getMapTileCellY(i);
    }

    return .{
        .len = len,
        .x = xy[0..],
        .y = xy[len..],
    };
}

/// Saves the image data of the map tiles from the read-only worldstate as PNGs.
///
/// Callers are expected to first call readReceivedWorldState(), if necessary.
///
/// This cannot be called from outside an initial callback; SaveMapTileImageFile only saves images
/// from the read worldstate's map changes at the time of calling.
pub fn save(paths: [][:0]const u8) void {
    std.debug.assert(paths.len == impl.getMapChangesSize());

    for (0.., paths) |i, path| {
        impl.saveMapTileImageFile(i, path);
    }
}

pub fn deinit(self: *Self, allocator: Allocator) void {
    allocator.free(self.x[0..self.len]);
    allocator.free(self.y[0..self.len]);

    self.* = undefined;
}

/// Loads PNG files as the image data for map tiles into the write-only worldstate, and pushes it
/// to the server.
pub fn push(
    self: Self,
    paths: [][:0]const u8,
    pid: c_ushort,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    impl.clearMapChanges();

    for (self.tile_x[0..self.len], self.tile_y[0..self.len], paths[0..self.len]) |x, y, path| {
        impl.loadMapTileImageFile(x, y, path);
    }

    impl.sendWorldMap(pid, for_everyone, skip_attached_player);
}
