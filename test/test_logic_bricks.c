#include <stdio.h>
#include "../include/brick.h"

int main() {

    bricks_init();

    Brick (*grid)[BRICK_COLS] = bricks_get();

    // Verificar que todos los ladrillos están activos
    for (int r = 0; r < BRICK_ROWS; r++) {
        for (int c = 0; c < BRICK_COLS; c++) {
            if (grid[r][c].active != 1) {
                printf("❌ ERROR: ladrillo [%d][%d] no inicializado.\n", r, c);
                return 1;
            }
        }
    }

    // Destruir uno
    brick_destroy(2, 3);

    if (grid[2][3].active != 0) {
        printf("❌ ERROR: brick_destroy no funciona.\n");
        return 1;
    }

    printf("OK: lógica de ladrillos.\n");
    return 0;
}
