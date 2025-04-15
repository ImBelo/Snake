const rl = @cImport({
    @cInclude("raylib.h");
});
pub fn drawBackGround(screenHeight: i32, screenWidth: i32) void {
    rl.DrawRectangle(0, 0, screenWidth, screenHeight, rl.WHITE);
}
pub fn main() !void {
    const screenHeight = 800;
    const screenWidth = 600;
    var centerX: i16 = 200;
    var centerY: i16 = 200;
    const radius: f32 = 50.0;
    const color = rl.RED;
    const speed = 5;
    rl.SetConfigFlags(rl.FLAG_WINDOW_RESIZABLE |
        rl.FLAG_VSYNC_HINT |
        rl.FLAG_MSAA_4X_HINT);
    rl.InitWindow(screenHeight, screenWidth, "Snake");
    defer rl.CloseWindow(); // Ensures window closes when scope exits
    // Set target FPS
    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        drawBackGround(screenHeight, screenWidth);
        if (rl.IsKeyPressed(rl.KEY_BACK)) break;

        if (rl.IsKeyDown(rl.KEY_RIGHT)) {
            centerX += speed;
        }
        if (rl.IsKeyDown(rl.KEY_LEFT)) {
            centerX -= speed;
        }
        if (rl.IsKeyDown(rl.KEY_UP)) {
            centerY -= speed;
        }
        if (rl.IsKeyDown(rl.KEY_DOWN)) {
            centerY += speed;
        }
        rl.BeginDrawing();
        defer rl.EndDrawing();
        rl.DrawRectangle(centerX, centerY, radius, radius, color);
        rl.ClearBackground(rl.RAYWHITE);
    }
}
