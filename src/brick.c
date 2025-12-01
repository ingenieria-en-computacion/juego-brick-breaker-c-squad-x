#include "brick.h"

// Matriz global de ladrillos
static Brick bricks[BRICK_ROWS][BRICK_COLS];

void bricks_init() {
    // TODO: Inicializar todos los ladrillos como activos
}

Brick (*bricks_get())[BRICK_COLS] {
    return bricks;
}

void brick_destroy(int row, int col) {
    // TODO: Marcar un ladrillo como destruido
}
