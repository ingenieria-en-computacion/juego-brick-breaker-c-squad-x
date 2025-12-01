#include <stdio.h>
#include "../include/paddle.h"

#define SCREEN_WIDTH 80

int main() {
    Paddle *p;

    paddle_init();
    p = paddle_get();

    int old_x = p->x;

    paddle_update(1);   // mover derecha

    if (p->x == old_x) {
        printf("❌ ERROR: El paddle no se mueve.\n");
        return 1;
    }

    // Empujar hasta la derecha
    p->x = SCREEN_WIDTH - 2;
    paddle_update(1);

    if (p->x > SCREEN_WIDTH - 2) {
        printf("❌ ERROR: El paddle cruza el borde derecho.\n");
        return 1;
    }

    // Empujar hasta la izquierda
    p->x = 1;
    paddle_update(-1);

    if (p->x < 1) {
        printf("❌ ERROR: El paddle cruza el borde izquierdo.\n");
        return 1;
    }

    printf("OK: lógica de paddle.\n");
    return 0;
}
