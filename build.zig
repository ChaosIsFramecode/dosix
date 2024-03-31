const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = std.zig.CrossTarget{ .cpu_arch = .x86_64, .os_tag = .freestanding, .abi = .none };

    const exe = b.addExecutable(.{
        .name = "dosix",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
    });

    // Linker config
    exe.setLinkerScriptPath(.{ .path = "targets/x64/linker.ld" });

    // Assembly
    exe.addAssemblyFile(.{ .path = "src/arch/x64/boot/header.S" });
    exe.addAssemblyFile(.{ .path = "src/arch/x64/boot/start.S" });
    exe.addAssemblyFile(.{ .path = "src/arch/x64/boot/start64.S" });

    b.installArtifact(exe);
}
