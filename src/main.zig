const rl = @cImport({
    @cInclude("raylib.h");
});

pub fn main() !void {
    const screenHeight = 800;
    const screenWidth = 600;

    rl.InitWindow(screenHeight, screenWidth, "HELLO");
    while (!rl.WindowShouldClose()) {}
}
