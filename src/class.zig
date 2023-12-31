const std = @import("std");

const Allocator = std.mem.Allocator;

const impl = @import("binding.zig").class;

pub const Class = union(enum) {
    default: [:0]const u8,
    custom: CustomClass,

    // for some reason zls doesn't like this just being named Custom, even though std.builtin.Type
    // does it the same way
    pub const CustomClass = struct {
        name: [:0]const u8,
        description: [:0]const u8,
        // TODO: make things below this line into a packed u64 once packed structs work properly
        attributes: [2]impl.Attribute,
        specialization: impl.Specialization,
        skills_major: [5]impl.Skill,
        skills_minor: [5]impl.Skill,
    };

    const Self = @This();

    /// Fetches the class information for a given player.
    ///
    /// TES3MP owns the strings held in objects returned by this function. Use fetchDupe if you
    /// wish to keep them after your initial callback returns.
    pub fn fetch(pid: c_ushort) Class {
        if (impl.isClassDefault(pid)) {
            return .{ .default = impl.getDefaultClass(pid) };
        } else {
            return .{
                .custom = .{
                    .name = impl.getClassName(pid),
                    .description = impl.getClassDesc(pid),
                    .attributes = blk: {
                        var attributes: [2]impl.Attribute = undefined;
                        for (attributes, 0..) |*attr, i| {
                            attr.* = impl.getClassMajorAttribute(pid, i);
                        }
                        break :blk attributes;
                    },
                    .specialization = impl.getClassSpecialization(pid),
                    .skills_major = blk: {
                        var skills: [5]impl.Skill = undefined;
                        for (skills, 0..) |*skill, i| {
                            skill.* = impl.getClassMajorSkill(pid, i);
                        }
                        break :blk skills;
                    },
                    .skills_minor = blk: {
                        var skills: [5]impl.Skill = undefined;
                        for (skills, 0..) |*skill, i| {
                            skill.* = impl.getClassMinorSkill(pid, i);
                        }
                        break :blk skills;
                    },
                    //.skills_major = fetchSkills(pid, impl.getClassMajorSkill),
                    //.skills_minor = fetchSkills(pid, impl.getClassMinorSkill),
                },
            };
        }
    }

    /// Fetches a copy of the class information for a given player.
    ///
    /// The caller owns all of the Class' contents.
    pub fn fetchDupe(pid: c_ushort, allocator: std.mem.Allocator) Allocator.Error!Class {
        var new = fetch(pid);

        switch (new) {
            .default => |*d| d = try allocator.dupe(u8, d),
            .custom => |*c| {
                c.name = try allocator.dupe(u8, c.name);
                errdefer allocator.free(c.name);

                c.description = try allocator.dupe(u8, c.description);
            },
        }

        return new;
    }

    /// This is only necessary if you used fetchDupe.
    pub fn deinit(self: *Self, allocator: Allocator) void {
        switch (self) {
            .default => |default| {
                allocator.free(default);
            },
            .custom => |custom| {
                allocator.free(custom.name);
                allocator.free(custom.description);
            },
        }

        self.* = undefined;
    }

    pub fn push(self: Self, pid: c_ushort) void {
        switch (self) {
            .default => |class_name| {
                impl.setDefaultClass(pid, class_name);
            },
            .custom => |custom| {
                impl.setDefaultClass(pid, "");

                impl.setClassName(pid, custom.name);
                impl.setClassDesc(pid, custom.description);

                for (custom.attributes, 0..) |attr, i| {
                    impl.setClassMajorAttribute(pid, i, attr);
                }
                impl.setClassSpecialization(pid, custom.specialization);

                for (custom.skills_major, 0..) |skill, i| {
                    impl.setClassMajorSkill(pid, i, skill);
                }
                for (custom.skills_minor, 0..) |skill, i| {
                    impl.setClassMinorSkill(pid, i, skill);
                }
            },
        }

        impl.sendClass(pid);
    }
};

// I dunno if this works or not. I'll hold off until I can verify the rest of this code.
fn fetchSkills(pid: c_ushort, comptime fetcher: fn (c_ushort, u3) impl.Skill) [5]impl.Skill {
    var skills: [5]impl.Skill = undefined;
    for (skills, 0..) |*skill, i| {
        skill.* = fetcher(pid, i);
    }
    return skills.*;
}
