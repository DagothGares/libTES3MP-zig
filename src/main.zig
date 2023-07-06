const std = @import("std");

pub const binding = @import("binding.zig");

// Other files not referenced by bindings.zig are WIP.

test "refAll" {
    std.testing.refAllDeclsRecursive(@This());
}
