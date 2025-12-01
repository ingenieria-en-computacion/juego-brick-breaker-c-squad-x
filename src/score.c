#include "score.h"
#include <stdio.h>

static int score = 0;

void score_init(const char *filename) {
    // TODO: Crear archivo si no existe o cargar mejores puntajes
}

void score_add(int points) {
    // TODO: sumar puntos al puntaje actual
}

int score_get() {
    return score;
}

void score_save(const char *filename) {
    // TODO: guardar puntaje final del jugador en el archivo
}
