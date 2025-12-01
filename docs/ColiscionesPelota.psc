Algoritmo RebotePelota
		// Posiciones actuales de la pelota
		Definir ball_x, ball_y Como Real
		Definir ball_vx, ball_vy Como Real
		
		// Dimensiones del área de juego
		Definir WIDTH, HEIGHT Como Entero
		
		// Paleta
		Definir paddle_x, paddle_y Como Entero
		Definir paddle_w Como Entero
		
		// Ladrillos (matriz)
		Definir BRICK_ROWS, BRICK_COLS Como Entero
		Dimension bricks[BRICK_ROWS, BRICK_COLS]
		
		// Calcular la posición siguiente de la pelota
		pos_x_siguiente <- ball_x + ball_vx
		pos_y_siguiente <- ball_y + ball_vy
		
		// ==============================
		// 1. Rebote contra PAREDES
		// ==============================
		Si pos_x_siguiente < 0 Entonces
			ball_vx <- ball_vx * (-1)
			pos_x_siguiente <- 0
		FinSi
		
		Si pos_x_siguiente > WIDTH - 1 Entonces
			ball_vx <- ball_vx * (-1)
			pos_x_siguiente <- WIDTH - 1
		FinSi
		
		// ==============================
		// 2. Rebote contra TECHO
		// ==============================
		Si pos_y_siguiente < 0 Entonces
			ball_vy <- ball_vy * (-1)
			pos_y_siguiente <- 0
		FinSi
		
		// ==============================
		// 3. Rebote con la PALETA
		// ==============================
		Definir paddle_izq, paddle_der Como Entero
		paddle_izq <- paddle_x
		paddle_der <- paddle_x + paddle_w - 1
		
		Si pos_y_siguiente = paddle_y Entonces
			Si pos_x_siguiente >= paddle_izq Y pos_x_siguiente <= paddle_der Entonces
				// Rebote vertical
				ball_vy <- ball_vy * (-1)
			FinSi
		FinSi
		
		// ==============================
		// 4. Colisión con LADRILLOS
		// ==============================
		Definir fila, columna Como Entero
		
		fila <- Trunc(pos_y_siguiente)
		columna <- Trunc(pos_x_siguiente)
		
		Si fila >= 0 Y fila < BRICK_ROWS Y columna >= 0 Y columna < BRICK_COLS Entonces
			Si bricks[fila, columna] = 1 Entonces
				bricks[fila, columna] <- 0      // Romper ladrillo
				ball_vy <- ball_vy * (-1)       // Rebote vertical
			FinSi
		FinSi
		
		// ==============================
		// 5. Actualizar posición final
		// ==============================
		ball_x <- ball_x + ball_vx
		ball_y <- ball_y + ball_vy
		
		// ==============================
		// 6. Verificar si cayó fuera
		// ==============================
		Si ball_y >= HEIGHT Entonces
			Escribir "La pelota cayó, perder vida."
			// Aquí se llamaría a un procedimiento ReiniciarPelota
		FinSi
		

FinAlgoritmo
