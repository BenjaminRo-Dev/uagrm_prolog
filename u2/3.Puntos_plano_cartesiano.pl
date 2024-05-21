% Predicado que encuentra en L, el lugar dónde se encuentra el punto X, Y.
lugar(X, Y, 1) :- X > 0 , Y > 0 , ! . %Cuadrante 1
lugar(X, Y, 2) :- X < 0 , Y > 0 , ! . %Cuadrante 2
lugar(X, Y, 3) :- X < 0 , Y < 0 , ! . %Cuadrante 3
lugar(X, Y, 4) :- X > 0 , Y < 0 , ! . %Cuadrante 4
lugar(0, 0, 0) :- ! . %Origen
lugar(_, 0, 5) :- ! . %Eje X
lugar(0, _, 6) :- ! . %Eje Y

% Predicado que es True, si los puntos X1, Y1 y X2, Y2 se encuentran en el mismo lugar.
mismoLugar(X1, Y1, X2, Y2) :- lugar(X1, Y1, L) , lugar(X2, Y2, L) .

% Predicado que es True, si el punto X, Y se encuentra en el eje X.
enEjeX(X, Y) :- lugar(X, Y, 5) .

% Predicado que es True, si el punto X, Y se encuentra en el eje Y.
enEjeY(X, Y) :- lugar(X, Y, 6) .

% Predicado que es True, si los puntos X1, Y1 y X2, Y2 se encuentran en ejes diferentes.

ejesDif(X1, Y1, X2, Y2) :- enEjeX(X1, Y1) , enEjeY(X2, Y2) , ! .
ejesDif(X1, Y1, X2, Y2) :- enEjeY(X1, Y1) , enEjeX(X2, Y2) .

% Predicado que es True, si los puntos X1, Y1 y X2, Y2 se encuentran en cuadrantes diagonalmente opuestos.
diagonalOpuesto(X1, Y1, X2, Y2) :- lugar(X1, Y1, T) , lugar(X2, Y2, Z) , (2 =:= abs(T-Z)) .

% Predicado que encuentra en Dist, la distancia del punto X1, Y1 al punto X2, Y2.
distancia(X1, Y1, X2, Y2, Dist) :- Dist is sqrt((X2 - X1) ** 2 + (Y2 - Y1) ** 2) .

% Predicado que devuelve True, si el punto X1, Y1 se encuentra dentro de la circunferencia con radio R y centro en el origen.
estaDentro(X1, Y1, R) :- distancia(0, 0, X1, Y1, Dist) , Dist =< R .

% Predicado que es True, si los tres puntos forman un triángulo equilátero.
% equilatero(X1, Y1, X2, Y2, X3, Y3) :- distancia(X1, Y1, X2, Y2, Dist) , distancia(X2, Y2, X3, Y3, Dist) , distancia(X1, Y1, X3, Y3, Dist) .
equilatero(X1, Y1, X2, Y2, X3, Y3) :- distancia(X1, Y1, X2, Y2, A) , distancia(X2, Y2, X3, Y3, B) , distancia(X1, Y1, X3, Y3, C) , A =:= B , B =:= C .

% Predicado que es True, si los tres puntos forman un triángulo isósceles.
% isosceles(X1, Y1, X2, Y2, X3, Y3) :- distancia(X1, Y1, X2, Y2, D) , distancia(X2, Y2, X3, Y3, D) , distancia(X1, Y1, X3, Y3, X) , X =\= D , ! .
% isosceles(X1, Y1, X2, Y2, X3, Y3) :- distancia(X1, Y1, X3, Y3, D) , distancia(X3, Y3, X2, Y2, D) , distancia(X2, Y2, X3, Y3, X) , X =\= D , ! .
%Prueba: isosceles(0,0,2.5,5,5,0).
isosceles(X1, Y1, X2, Y2, X3, Y3):- distancia(X1,Y1,X2,Y2,D1), distancia(X2,Y2,X3,Y3,D2), distancia(X3,Y3,X1,Y1,D3), D1=:=D2, D2=\=D3,!.
isosceles(X1, Y1, X2, Y2, X3, Y3):- distancia(X1,Y1,X2,Y2,D1), distancia(X2,Y2,X3,Y3,D2), distancia(X3,Y3,X1,Y1,D3), D1=:=D3, D3=\=D2,!.
isosceles(X1, Y1, X2, Y2, X3, Y3):- distancia(X1,Y1,X2,Y2,D1), distancia(X2,Y2,X3,Y3,D2), distancia(X3,Y3,X1,Y1,D3), D2=:=D3, D3=\=D1.

% Predicado que es True, si los dos puntos definen una recta horizontal.
horizontal(_, Y1, _, Y2) :- Y1 =:= Y2 .

% Predicado que es True, si los dos puntos definen una recta vertical.
vertical(X1, _, X2, _) :- X1 =:= X2 . 

% Predicado que es True, si los puntos X1, Y1 y X2, Y2 se encuentran en lugares diferentes del plano cartesiano.
lugarDif(X1, Y1, X2, Y2) :- lugar(X1, Y1, Z) , lugar(X2, Y2, T) , Z =\= T .

% Predicado que es True, si los puntos X1, Y1, X2, Y2, X3, Y3 se encuentran en lugares diferentes del plano cartesiano.
lugarDif(X1, Y1, X2, Y2, X3, Y3) :- lugar(X1, Y1, Z) , lugar(X2, Y2, T) , lugar(X3, Y3, W) ,  Z =\= T , Z =\= W , T =\= W.

% Predicado que es True, si dos puntos se encuentran en el mismo lugar y el otro punto en otro lugar.
dosMismoLugar(X1, Y1, X2, Y2, X3, Y3) :- lugar(X1, Y1, Z) , lugar(X2, Y2, Z) , lugar(X3, Y3, W) , W =\= Z , ! .
dosMismoLugar(X1, Y1, X2, Y2, X3, Y3) :- lugar(X1, Y1, Z) , lugar(X3, Y3, Z) , lugar(X2, Y2, W) , W =\= Z , ! .
dosMismoLugar(X1, Y1, X2, Y2, X3, Y3) :- lugar(X2, Y2, Z) , lugar(X3, Y3, Z) , lugar(X1, Y1, W) , W =\= Z .

% Predicado que encuentra en X, Y el punto medio entre los puntos X1, Y1 y X2, Y2.
%Nota: Primero encontrar el Punto medio entre X1, X2 y entre Y1, Y2
puntoMedioRecta(X1, X2, Z) :- Z is ((X1+X2)/2) .
puntoMedio(X1, Y1, X2, Y2, X, Y) :- puntoMedioRecta(X1, X2, X) , puntoMedioRecta(Y1, Y2, Y) .
%Prueba = puntoMedio(1,2, 9,6, X, Y). resultado = 4,5

% Predicado que encuentra la pendiente de la recta definida por los puntos X1, Y1, X2, Y2. Considerar si la recta es vertical.
%Nota: Pendiente = M = (Y2-Y1)/(X2-X1)
%Nota: Pendiente = M = tan(angulo) entre X y la linea
pendiente(X1, Y1, X2, Y2, P1) :- horizontal(X1, Y1, X2, Y2), P1 is (0) ; vertical(X1, Y1, X2, Y2) , P1 is (0) , ! .
pendiente(X1, Y1, X2, Y2, P1) :- P1 is((Y2-Y1) / (X2-X1)) .
%Prueba: 1,2, 7,6 = 2/3 = 0.667

% Predicado que es True, si los tres puntos se encuentra sobre una misma recta.
mismaRecta(X1, Y1, X2, Y2, X3, Y3) :- horizontal(X1, Y1, X2, Y2, X3, Y3) ; vertical(X1, Y1, X2, Y2, X3, Y3) , ! .
mismaRecta(X1, Y1, X2, Y2, X3, Y3) :- pendiente(X1, Y1, X2, Y2, P1) , pendiente(X1, Y1, X3, Y3, P1) .
%Prueba: mismaRecta(-3,2, 7,-2, 2,0) 

% Predicado que es True, si ambos puntos son diferentes.
diferentes(X1, Y1, X2, Y2) :- X1 =\= X2 ; Y2 =\= Y1 .

% Predicado que es True, si los tres puntos son diferentes.
diferentes(X1, Y1, X2, Y2, X3, Y3) :- diferentes(X1, Y1, X2, Y2) , diferentes(X1, Y1, X3, Y3) , diferentes(X2, Y2, X3, Y3) .

% Predicado que es True, si dos puntos dos iguales.
dosIguales(X1, Y1, X2, Y2, X3, Y3) :- X1 =:= X2 , Y1 =:= Y2 , diferentes(X1, Y1, X3, Y3) , ! .
dosIguales(X1, Y1, X2, Y2, X3, Y3) :- X1 =:= X3 , Y1 =:= Y3 , diferentes(X1, Y1, X2, Y2) , ! .
dosIguales(X1, Y1, X2, Y2, X3, Y3) :- X2 =:= X3 , Y2 =:= Y3 , diferentes(X2, Y2, X1, Y1) , ! .

% Predicado que es True, si un lado del triángulo es vertical.
ladoVertical(X1, Y1, X2, Y2, X3, Y3) :- vertical(X1, Y1, X2, Y2) , X1 =\= X3 ; vertical(X1, Y1, X3, Y3) , X1 =\= X2 ; vertical(X2, Y2, X3, Y3) , X1 =\= X3 .

% Predicado que es True, si un lado del triángulo es horizontal.
ladoHorizontal(X1, Y1, X2, Y2, X3, Y3) :- horizontal(X1, Y1, X2, Y2) , Y1 =\= Y3 ; horizontal(X1, Y1, X3, Y3) , Y1 =\= Y2 ; horizontal(X2, Y2, X3, Y3) , Y1 =\= Y3 .

% ladosVertHoriz(X1, Y1, X2, Y2, X3, Y3) : Predicado que es True, si un lado del triángulo es vertical y el otro lado es horizontal.
ladosVertHoriz(X1, Y1, X2, Y2, X3, Y3) :- ladoVertical(X1, Y1, X2, Y2, X3, Y3) , ladoHorizontal(X1,Y1, X2, Y2, X3, Y3) .

% trianguloRectangulo(X1, Y1, X2, Y2, X3, Y3) : Predicado que es True, si el triángulo es triángulo rectángulo.
trianguloRectangulo(X1, Y1, X2, Y2, X3, Y3) :- ladosVertHoriz(X1, Y1, X2, Y2, X3, Y3) .

% Incluir al menos 5 nuevos predicados adicionales interesantes.
horizontal(X1, Y1, X2, Y2, X3, Y3) :- horizontal(X1, Y1, X2, Y2) , horizontal(X2, Y2, X3, Y3) .
vertical(X1, Y1, X2, Y2, X3, Y3) :- vertical(X1, Y1, X2, Y2) , vertical(X2, Y2, X3, Y3) .

triangulo(X1, Y1, X2, Y2, X3, Y3) :- not(mismaRecta(X1, Y1, X2, Y2, X3, Y3)).

angulosTriangulo(X1, Y1, X2, Y2, X3, Y3, A1, A2, A3, Aux) :- distancia(X1, Y1, X2, Y2, D1) , distancia(X2, Y2, X3, Y3, D2) , distancia(X1, Y1, X3, Y3, D3) ,
Aux is (D1 ** 2 + D2 ** 2 - D3 ** 2) / (2 * D1 * D2) , A1 is acos(Aux) ,
Aux is (D1 ** 2 + D3 ** 2 - D2 ** 2) / (2 * D1 * D3) , A2 is acos(Aux) ,
Aux is (D2 ** 2 + D3 ** 2 - D1 ** 2) / (2 * D2 * D3) , A3 is acos(Aux) .
%Nota: No se por que no me salen los resultados, si no false.





