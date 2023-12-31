const std = @import("std");

// This module is not intended to be built directly, except for testing purposes.
// You should include it in your program as a module instead. See the example/ folder.

inline fn thisDir() []const u8 {
    return comptime std.fs.path.dirname(@src().file) orelse ".";
}

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const libTES3MP = b.addSharedLibrary(.{
        .name = "libTES3MP-core",
        .root_source_file = .{ .path = "../lib/libTES3MP-core/src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    switch (optimize) {
        .ReleaseFast, .ReleaseSmall => libTES3MP.strip = true,
        else => {},
    }

    const lib = b.addStaticLibrary(.{
        .name = "libTES3MP-zig",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    switch (optimize) {
        .ReleaseFast, .ReleaseSmall => lib.strip = true,
        else => {},
    }
    //lib.linkLibrary(libTES3MP);
    b.installArtifact(lib);

    // I dunno how to get Zig to compile libTES3MP-core for tests, nevermind actually link it
    // properly.
    const main_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    main_tests.linkLibrary(libTES3MP);

    const run_main_tests = b.addRunArtifact(main_tests);
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_main_tests.step);
}
