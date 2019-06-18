# Percepcion
Repositorio destinado a la practica de la asignatura Percepcion.

Normas:
  ·Barcos: Portaaviones=5 casillas.
           Buque=4 casillas.
           Submarino=3 casillas.
           Lancha=1 casilla.
  Solo uno de cada.
  ·Posicion: Se debe dejar un hueco entre cada barco, por normas del juego (solo lados, se pueden en diagonal).

················
·Deteccion foto:
················
Paso 1:
imagen=imread('imagen.jpg')
Comenzamos leyendo la imagen, podria realizarse desde la cam, pero si la foto sale doblada, podria no detectar algun cuadrado coloreado.

Paso 2:
[lines,E]=CalcLines(imagen)
CalcLines recibe como entrada la imagen principal. Se trata de un bucle que realiza canny con diferente umbralizacion hasta que hough obtiene las 22 lineas. Devuelve la estructura lineas lines y la imagen umbralizada E.

Paso 3:
[x,y,col,fil,xs,ys]=CalcBigLines(lines)
CalcBigLines recibe como entrada la estructura lines. Devuelve xs e ys, que son las coordenadas de las lineas originales, x e y que son las coordenadas de las lineas aumentadas en 200, por si en la deteccion no se llego a cerrar por algun punto. Para realizar esto debemos saber que lineas son filas y cuales columnas, cosa que tambien devolvemos.

Paso 4:
[Xcol,Ycol,Xfil,Yfil]=Ord(x,y,col,fil)
Ord recibe como entrada las lineas y cuales son filas o columnas. Devuelve las filas y columnas ordenadas desde la esquina superior izquierda.

Paso 5:
im=takeSquares(imagen,Xcol,Ycol,Xfil,Yfil)
takeSquares recibe como entrada la imagen y las filas y columnas ordenadas y devulve en im que es una celda 10x10, donde cada elemento es cada cuadrado de la cuadricula.

[xC,yC,xLine,yLine]=makeSquare(Xcol,Ycol,Xfil,Yfil) 
makeSquare recibe como entrada dos filas y dos columnas y calcula el punto superior izquierdo y la distancia de ambos lados, necesaria para realizar el crop en takeSquares.

Paso 6:
ocupadas=search(im)
Recibe como entrada las celdas im. Devuelve las posiciones donde esta la celda ocupada, lo hace simplemente con la comparacion
	Si elementos desde 0 hasta 125 > elementos desde 125 hasta 255
		esta ocupada

Paso 7:
[por,buque,submarino,lancha]=barcos(ocupadas)
Recibe como entrada las celdas ocupadas, como salida devuelve la pos. exacta de cada ficha. La funcion esta programada suponiendo que no ha habido fallos de deteccion de ocupadas ni humano al inicializar el tablero.
Es una funcion muy restrictiva, se da por sentado que las normas de inicializacion se han cumplido.

Paso 8:
matrix=createMatrix(ocupadas)
Recibe como entrada las celdas ocupadas. Como salida devuelve una matriz 10x10 donde 0 son casillas libres y 1 casillas ocupadas.

Paso 9:
jugar(imagen,matrix,Xcol,Ycol,Xfil,Yfil,por,buque,submarino,lancha);
Recibe como entrada la imagen, matriz, filas y columnas y fichas del tablero. Emplea la funcion [matrix]=makeCircles(imagen,Xcol,Ycol,Xfil,Yfil,matrix,Ipos,Jpos) que devuelve la matriz actualizada y dibuja un circulo en la posicion atacada. Mas tarde a partid de la informacion del lugar atacado vemos si fue agua, tocado y hundido. Si se hunde el ultimo barco se gana la partida.
