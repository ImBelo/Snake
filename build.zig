const std = @import("std");

pub fn build(b: *std.Build) void {
    // Standard build options
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Create executable
    const exe = b.addExecutable(.{
        .name = "raylib-app",
        .root_source_file = .{ .cwd_relative = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    exe.addIncludePath(.{ .cwd_relative = "/usr/local/include" });
    exe.addLibraryPath(.{ .cwd_relative = "/usr/local/lib" });
    exe.addIncludePath(.{ .cwd_relative = "/usr/lib/kitty/kitty" });
    // Link Raylib and other required libraries
    exe.linkSystemLibrary("raylib");
    exe.linkSystemLibrary("glfw3"); // Try this first
    exe.linkSystemLibrary("glfw");
    exe.linkSystemLibrary("opengl");
    exe.linkSystemLibrary("m");
    exe.linkSystemLibrary("pthread");
    exe.linkSystemLibrary("dl");
    exe.linkSystemLibrary("glfw");
    exe.linkSystemLibrary("GL");

    // Add run step
    const run_cmd = b.addRunArtifact(exe);
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    // Installation step
    b.installArtifact(exe);
}
