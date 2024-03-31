const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = std.zig.CrossTarget{ .cpu_arch = .x86_64, .os_tag = .freestanding };

    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "dosix",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(exe);
}
