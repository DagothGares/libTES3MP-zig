const std = @import("std");
const libTES3MP = @import("libTES3MP-zig");

const Status = libTES3MP.binding.Status;

const server = libTES3MP.binding.server;

export fn sayHello() callconv(.C) Status {
    server.logMessage(.info, "Hello from the libTES3MP-zig example DLL!");

    return .all;
}

export fn libmain() void {
    libTES3MP.binding.bind_OnServerPostInit(&sayHello);
}

comptime {
    std.testing.refAllDecls(@This());
}
