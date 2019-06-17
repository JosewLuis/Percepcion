clc, clear, close all

%Captura de imagen:
imagen=imread('1.jpg');
imagen=rgb2gray(imagen);
imagen=imrotate(imagen,270);
%Calculo de lineas:
[lines,E]=CalcLines(imagen);

%Anadir longitud a las lineas:
[x,y,col,fil,xs,ys]=CalcBigLines(lines);

%Ordenar las lineas:
[Xcol,Ycol,Xfil,Yfil]=Ord(x,y,col,fil);

%Obtener cuadraros:
im=takeSquares(imagen,Xcol,Ycol,Xfil,Yfil);

%Casillas ocupadas:
ocupadas=search(im);

%Inicializar barcos:
[por,buque,submarino,lancha]=barcos(ocupadas);

%Crear matrix:
matrix=createMatrix(ocupadas);

%Jugar:
jugar(imagen,matrix,Xcol,Ycol,Xfil,Yfil,por,buque,submarino,lancha);