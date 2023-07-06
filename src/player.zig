const std = @import("std");
const Allocator = std.mem.Allocator;

const binding = @import("binding.zig");

const cell = binding.cell;
const position = binding.position;

pub const PlayerPosition = struct {
    cell: PlayerCell,
    position: [3]f64,
    rotation: [2]f64,

    pub const PlayerCell = union(enum) {
        interior: [:0]const u8,
        exterior: [2]i32,
    };

    const Self = @This();

    /// Fetches the current position information about a player.
    ///
    /// If the PlayerCell returned is an interior, the caller does not own the interior string,
    /// and its contents will become invalid after the initial callback returns.
    /// Use fetchDupe if you wish to keep the data after the callback returns.
    pub fn fetch(pid: u16) Self {
        const player_cell: PlayerCell = if (cell.isInExterior(pid)) .{ .exterior = .{
            cell.raw.getExteriorX(pid),
            cell.raw.getExteriorY(pid),
        } } else .{ .interior = .{
            std.mem.span(cell.raw.getCell(pid).?),
        } };

        return .{
            .cell = player_cell,
            .position = .{
                position.raw.getPosX(pid),
                position.raw.getPosY(pid),
                position.raw.getPosZ(pid),
            },
            .rotation = .{
                position.raw.getRotX(pid),
                position.raw.getRotZ(pid),
            },
        };
    }

    pub fn fetchDupe(pid: u16, allocator: std.mem.Allocator) Allocator.Error!Self {
        var new = fetch(pid);
        if (new.cell == .interior) {
            new.cell.interior = try allocator.dupe(u8, new.cell.interior);
        }

        return new;
    }

    /// Sets the current cell (interior or exterior), position, and rotation for a player.
    /// This function does not change their position.
    pub fn push(self: Self, pid: u16) void {
        switch (self.cell) {
            .interior => cell.setCell(pid, self.interior),
            .exterior => cell.setExteriorCell(pid, self.exterior[0], self.exterior[1]),
        }

        position.setPos(pid, self.position[0], self.position[1], self.position[2]);
        position.setRot(pid, self.rotation[0], self.rotation[1]);

        cell.sendCell(pid);
        position.sendPos(pid);
    }
};
