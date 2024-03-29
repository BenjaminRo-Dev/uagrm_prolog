% PREDICADOS CON EXPRESIONES ARITMÉTICAS.

% Implementar los siguientes predicados:

% menor(A, B, Me)
menor(A, B, Me) :- A < B , Me is A , ! .
menor(_, B, B) .

% menor(A, B, C, Me)
menor(A, B, C, Me) :- menor(A, B, Me1), menor(C, Me1, Me) .

% menor(A, B, C, D, Me)
menor(A, B, C, D, Me) :- menor(A, B, Me1), menor(C, Me1, Me2) , menor(D, Me2, Me).

% menor(A, B, C, D, E, Me) : Predicado que encuentra en Me, el menor de A, B, C, D y E.
menor(A, B, C, D, E, Me) :- menor(A, B, Me1) , menor(C, Me1, Me2) , menor(D, Me2, Me3) , menor(E, Me3, Me).

% mayor(A, B, My)
mayor(A, B, My) :- A > B , My is A , ! .
mayor(_, B, B) .

% mayor(A, B, C, My)
mayor(A, B, C, My) :- mayor(A, B, My1) , mayor(C, My1, My) .

% mayor(A, B, C, D, My)
mayor(A, B, C, D, My) :- mayor(A, B, My1), mayor(C, My1, My2) , mayor(D, My2, My).

% mayor(A, B, C, D, E, My) : Predicado que encuentra en My, el mayor de A, B, C, D y E.
mayor(A, B, C, D, E, My) :- mayor(A, B, My1), mayor(C, My1, My2) , mayor(D, My2, My3) , mayor(E, My3, My) .

% segMenor(A, B, Me)
segMenor(A, B, Me) :- A < B , Me is B .

%Requisito: igual(A, B)
igual(A, B) :- A =:= B.

% segMenor(A, B, C, Me)
segMenor(A, B, C, Me) :- menor(A, B, C, Me1) ,
                         igual(A, Me1) ,         %Si el menor es A
                         menor(B, C, Me) , ! .   %Menor entre B y C, retornar el menor = segMenor
segMenor(A, B, C, Me) :- menor(A, B, C, Me1) ,
                         igual(B, Me1) ,         %Si el menor es B
                         menor(A, C, Me) , ! .   %Menor entre A y C, retornar el segMenor
segMenor(A, B, C, Me) :- menor(A, B, C, Me1) ,
                         igual(C, Me1) ,
                         menor(A, B, Me) .

%Otra forma (con OR) segMenor(A, B, C, Se)
segMenor2(A, B, C, Se) :- menor(A, B, C, Me) , igual(A, Me) , menor(B, C, Se) ;
                          menor(A, B, C, Me) , igual(B, Me) , menor(A, C, Se) ;
                          menor(A, B, C, Me) , igual(C, Me) , menor(A, B, Se) .

% segMenor(A, B, C, D, Me)
segMenor(A, B, C, D, Me) :- menor(A, B, C, D, Me1) , igual(A, Me1), menor(B, C, D, Me) , ! .
segMenor(A, B, C, D, Me) :- menor(A, B, C, D, Me1) , igual(B, Me1), menor(A, C, D, Me) , ! .
segMenor(A, B, C, D, Me) :- menor(A, B, C, D, Me1) , igual(C, Me1), menor(A, B, D, Me) , ! .
segMenor(A, B, C, D, Me) :- menor(A, B, C, D, Me1) , igual(D, Me1), menor(A, B, C, Me) , ! .

% segMenor(A, B, C, D, E, Me) : Predicado que encuentra en Me, el segundo menor de A, B, C, D y E.
segMenor(A, B, C, D, E, Me) :-  menor(A, B, C, D, E, Me1) , igual(A, Me1) , menor(B, C, D, E, Me) , ! .
segMenor(A, B, C, D, E, Me) :-  menor(A, B, C, D, E, Me1) , igual(B, Me1) , menor(A, C, D, E, Me) , ! .
segMenor(A, B, C, D, E, Me) :-  menor(A, B, C, D, E, Me1) , igual(C, Me1) , menor(A, B, D, E, Me) , ! .
segMenor(A, B, C, D, E, Me) :-  menor(A, B, C, D, E, Me1) , igual(D, Me1) , menor(A, B, C, E, Me) , ! .
segMenor(A, B, C, D, E, Me) :-  menor(A, B, C, D, E, Me1) , igual(D, Me1) , menor(A, B, C, D, Me) , ! .

% segMayor(A, B, My)
segMayor(A, B, My) :- A > B, My is A , ! .
segMayor(_ , B, B) .

% segMayor (A, B, C, My)
segMayor(A, B, C, My) :- mayor(A, B, C, M1) , M1 =:= A , mayor(B, C, My) , ! .
segMayor(A, B, C, My) :- mayor(A, B, C, M1) , M1 =:= B , mayor(A, C, My) , ! .
segMayor(A, B, C, My) :- mayor(A, B, C, M1) , M1 =:= C , mayor(A, B, My) , ! .

% segMayor (A, B, C, D, My)
segMayor(A, B, C, D, My) :- mayor(A, B, C, D, M1) , M1 =:= A, mayor(B, C, D, My) , ! .
segMayor(A, B, C, D, My) :- mayor(A, B, C, D, M1) , M1 =:= B, mayor(A, C, D, My) , ! .
segMayor(A, B, C, D, My) :- mayor(A, B, C, D, M1) , M1 =:= C, mayor(A, B, D, My) , ! .
segMayor(A, B, C, D, My) :- mayor(A, B, C, D, M1) , M1 =:= D, mayor(A, B, C, My) , ! .

% segMayor (A, B, C, D, E, My) : Predicado que encuentra en Me, el segundo mayor de A, B, C, D y E.
segMayor(A, B, C, D, E, My) :- mayor(A, B, C, D, E, M1) , M1 =:= A , mayor(B, C, D, E, My) , ! .
segMayor(A, B, C, D, E, My) :- mayor(A, B, C, D, E, M1) , M1 =:= B , mayor(A, C, D, E, My) , ! .
segMayor(A, B, C, D, E, My) :- mayor(A, B, C, D, E, M1) , M1 =:= C , mayor(A, B, D, E, My) , ! .
segMayor(A, B, C, D, E, My) :- mayor(A, B, C, D, E, M1) , M1 =:= D , mayor(A, B, C, E, My) , ! .
segMayor(A, B, C, D, E, My) :- mayor(A, B, C, D, E, M1) , M1 =:= E , mayor(A, B, C, D, My) , ! .

% tercerMenor(A, B, C, Me)
tercerMenor(A, B, C, Me) :- menor(A, B, M1) , M1 =:= A , mayor(B, C, Me) , ! .
tercerMenor(A, B, C, Me) :- menor(A, B, M1) , M1 =:= B , mayor(A, C, Me) , ! .
tercerMenor(A, B, C, Me) :- menor(A, B, M1) , M1 =:= C , mayor(A, B, Me) , ! .

% tercerMenor(A, B, C, D, Me)
tercerMenor(A, B, C, D, Me) :- menor(A, B, C, D, M1) , M1 =:= A , segMenor(B, C, D, Me) , ! .
tercerMenor(A, B, C, D, Me) :- menor(A, B, C, D, M1) , M1 =:= B , segMenor(A, C, D, Me) , ! .
tercerMenor(A, B, C, D, Me) :- menor(A, B, C, D, M1) , M1 =:= C , segMenor(A, B, D, Me) , ! .
tercerMenor(A, B, C, D, Me) :- menor(A, B, C, D, M1) , M1 =:= D , segMenor(A, B, C, Me) , ! .

% tercerMenor(A, B, C, D, E, Me) : Predicado que encuentra en Me, el tercer menor de A, B, C, D y E.
tercerMenor(A, B, C, D, E, Me) :- menor(A, B, C, D, E, M1) , M1 =:= A, segMenor(B, C, D, E, Me) , ! .
tercerMenor(A, B, C, D, E, Me) :- menor(A, B, C, D, E, M1) , M1 =:= B, segMenor(A, C, D, E, Me) , ! .
tercerMenor(A, B, C, D, E, Me) :- menor(A, B, C, D, E, M1) , M1 =:= C, segMenor(A, B, D, E, Me) , ! .
tercerMenor(A, B, C, D, E, Me) :- menor(A, B, C, D, E, M1) , M1 =:= D, segMenor(A, B, C, E, Me) , ! .
tercerMenor(A, B, C, D, E, Me) :- menor(A, B, C, D, E, M1) , M1 =:= E, segMenor(A, B, C, D, Me) , ! .

% tercerMayor (A, B, C, My)
tercerMayor(A, B, C, My) :- mayor(A, B, C, M1) , M1 =:= A , segMayor(B, C, My) , ! .
tercerMayor(A, B, C, My) :- mayor(A, B, C, M1) , M1 =:= B , segMayor(A, C, My) , ! .
tercerMayor(A, B, C, My) :- mayor(A, B, C, M1) , M1 =:= C , segMayor(A, B, My) , ! .

% tercerMayor (A, B, C, D, My)
tercerMayor(A, B, C, D, My) :- mayor(A, B, C, D, M1) , M1 =:= A, segMayor(B, C, D, My) , ! .
tercerMayor(A, B, C, D, My) :- mayor(A, B, C, D, M1) , M1 =:= B, segMayor(A, C, D, My) , ! .
tercerMayor(A, B, C, D, My) :- mayor(A, B, C, D, M1) , M1 =:= C, segMayor(A, B, D, My) , ! .
tercerMayor(A, B, C, D, My) :- mayor(A, B, C, D, M1) , M1 =:= D, segMayor(A, B, C, My) , ! .

% tercerMayor (A, B, C, D, E, My) : Predicado que encuentra en Me, el tercer mayor de A, B, C, D y E.
tercerMayor(A, B, C, D, E, My) :- mayor(A, B, C, D, E, M1) , M1 =:= A, segMayor(B, C, D, E, My) , ! .
tercerMayor(A, B, C, D, E, My) :- mayor(A, B, C, D, E, M1) , M1 =:= B, segMayor(A, C, D, E, My) , ! .
tercerMayor(A, B, C, D, E, My) :- mayor(A, B, C, D, E, M1) , M1 =:= C, segMayor(A, B, D, E, My) , ! .
tercerMayor(A, B, C, D, E, My) :- mayor(A, B, C, D, E, M1) , M1 =:= D, segMayor(A, B, C, E, My) , ! .
tercerMayor(A, B, C, D, E, My) :- mayor(A, B, C, D, E, M1) , M1 =:= E, segMayor(A, B, C, D, My) , ! .

% iguales(A, B)
iguales(A, B) :- A =:= B .
% iguales(A, B, C)
iguales(A, B, C) :- A =:= B , A =:= C .
% iguales(A, B, C, D)
iguales(A, A, A, A) .
% iguales(A, B, C, D, E) : Predicado que es True, si todos los argumentos son iguales.
iguales(A, A, A, A, A) .



% diferentes(A, B)
diferentes(A, B) :- A =\= B .
% diferentes(A, B, C)
diferentes(A, B, C) :- A =\= B , A =\= C , B =\= C .
% diferentes(A, B, C, D)
diferentes(A, B, C, D) :- diferentes(A, B, C) , A =\= D , B =\= D , C =\= D . 
% diferentes(A, B, C, D, E) : Predicado que es True, si todos los argumentos son diferentes.
diferentes(A, B, C, D, E) :- diferentes(A, B, C, D) , A =\= E , B =\= E , C =\= E, D =\= E .

% dosIguales(A, B)
dosIguales(A, B) :- A =:= B .

% dosIguales(A, B, C)
dosIguales(A, B, C) :- dosIguales(A, B) , A =\= C , B =\= C , ! .
dosIguales(A, B, C) :- dosIguales(A, C) , A =\= B , C =\= B , ! .
dosIguales(A, B, C) :- dosIguales(B, C) , B =\= A , C =\= A , ! .

% dosIguales(A, B, C, D)
dosIguales(X, X, A, B) :- diferentes(A, B, X) , ! .
dosIguales(X, A, X, B) :- diferentes(A, B, X) , ! .
dosIguales(X, A, B, X) :- diferentes(A, B, X) , ! .
dosIguales(A, X, B, X) :- diferentes(A, B, X) , ! .
dosIguales(A, X, X, B) :- diferentes(A, B, X) , ! .
dosIguales(A, B, X, X) :- diferentes(A, B, X) , ! .

% dosIguales(A, B, C, D, E) : Predicado que es True, si solo 2 argumentos son iguales y las demás diferentes entre ellas y diferentes a las iguales.
dosIguales(X, X, A, B, C) :- diferentes(X, A, B, C) , ! .
dosIguales(X, A, X, B, C) :- diferentes(X, A, B, C) , ! .
dosIguales(X, A, B, X, C) :- diferentes(X, A, B, C) , ! .
dosIguales(X, A, B, C, X) :- diferentes(X, A, B, C) , ! .
dosIguales(A, X, X, B, C) :- diferentes(X, A, B, C) , ! .
dosIguales(A, X, B, X, C) :- diferentes(X, A, B, C) , ! .
dosIguales(A, X, B, C, X) :- diferentes(X, A, B, C) , ! .
dosIguales(A, B, X, X, C) :- diferentes(X, A, B, C) , ! .
dosIguales(A, B, X, C, X) :- diferentes(X, A, B, C) , ! .
dosIguales(A, B, C, X, X) :- diferentes(X, A, B, C) , ! .

% tresIguales(A, B, C)
tresIguales(A, A, A) .
% tresIguales(A, B, C, D)
tresIguales(X, X, X, A) :- diferentes(X, A) , ! .
tresIguales(X, X, A, X) :- diferentes(X, A) , ! .
tresIguales(X, A, X, X) :- diferentes(X, A) , ! .
tresIguales(A, X, X, X) :- diferentes(X, A) , ! .

% tresIguales(A, B, C, D, E) : Predicado que es True, si solo 3 argumentos son iguales y las demás diferentes entre ellas y diferentes a las iguales.
tresIguales(X, X, X, A, B) :- diferentes(A, B, X) , ! .
tresIguales(X, X, A, X, B) :- diferentes(A, B, X) , ! .
tresIguales(X, A, X, X, B) :- diferentes(A, B, X) , ! .
tresIguales(A, X, X, X, B) :- diferentes(A, B, X) , ! .

tresIguales(A, X, X, B, X) :- diferentes(A, B, X) , ! .
tresIguales(A, X, B, X, X) :- diferentes(A, B, X) , ! .
tresIguales(A, B, X, X, X) :- diferentes(A, B, X) , ! .

tresIguales(X, X, A, B, X) :- diferentes(A, B, X) , ! .
tresIguales(X, A, X, B, X) :- diferentes(A, B, X) , ! .

tresIguales(X, A, B, X, X) :- diferentes(A, B, X) , ! .


% poker(A, B)
poker(_, _) :- false .
% poker(A, B, C)
poker(_, _, _) :- false .
% poker(A, B, C, D)
poker(X, X, X, X) .
% poker(A, B, C, D, E) : Predicado que es True, todos los argumentos son iguales excepto uno.
poker(X, X, X, X, A) :- diferentes(X, A) , ! .
poker(X, X, X, A, X) :- diferentes(X, A) , ! .
poker(X, X, A, X, X) :- diferentes(X, A) , ! .
poker(X, A, X, X, X) :- diferentes(X, A) , ! .
poker(A, X, X, X, X) :- diferentes(X, A) , ! .

% dosPares(A, B)
dosPares(A, B) :- (A mod 2 =:= 0) , (B mod 2 =:= 0) .
% dosPares (A, B, C)
dosPares(A, B, C) :- dosPares(A, B) , (C mod 2 =\= 0) , ! .
dosPares(A, B, C) :- dosPares(A, C) , (B mod 2 =\= 0) , ! .
dosPares(A, B, C) :- dosPares(B, C) , (A mod 2 =\= 0) , ! .
% dosPares (A, B, C, D)
dosPares(A, B, C, D) :- dosPares(A, B) , (C mod 2 =\= 0) , (D mod 2 =\= 0) , ! .
dosPares(A, B, C, D) :- dosPares(A, C) , (B mod 2 =\= 0) , (D mod 2 =\= 0) , ! .
dosPares(A, B, C, D) :- dosPares(A, D) , (B mod 2 =\= 0) , (C mod 2 =\= 0) , ! .
dosPares(A, B, C, D) :- dosPares(B, C) , (A mod 2 =\= 0) , (D mod 2 =\= 0) , ! .
dosPares(A, B, C, D) :- dosPares(B, D) , (A mod 2 =\= 0) , (C mod 2 =\= 0) , ! .
dosPares(A, B, C, D) :- dosPares(C, D) , (A mod 2 =\= 0) , (B mod 2 =\= 0) , ! .

% dosPares (A, B, C, D, E) : Predicado que es True, si solo 2 argumentos son pares y las demás impares.
dosPares(A, B, C, D, E) :- dosPares(A, B) , (C mod 2 =\= 0) , (D mod 2 =\= 0) , (E mod 2 =\= 0) , ! .
dosPares(A, B, C, D, E) :- dosPares(A, C) , (B mod 2 =\= 0) , (D mod 2 =\= 0) , (E mod 2 =\= 0) , ! .
dosPares(A, B, C, D, E) :- dosPares(A, D) , (B mod 2 =\= 0) , (C mod 2 =\= 0) , (E mod 2 =\= 0) , ! .
dosPares(A, B, C, D, E) :- dosPares(A, E) , (B mod 2 =\= 0) , (C mod 2 =\= 0) , (D mod 2 =\= 0) , ! .
dosPares(A, B, C, D, E) :- dosPares(B, C) , (A mod 2 =\= 0) , (D mod 2 =\= 0) , (E mod 2 =\= 0) , ! .
dosPares(A, B, C, D, E) :- dosPares(B, D) , (A mod 2 =\= 0) , (C mod 2 =\= 0) , (E mod 2 =\= 0) , ! .
dosPares(A, B, C, D, E) :- dosPares(B, E) , (A mod 2 =\= 0) , (C mod 2 =\= 0) , (D mod 2 =\= 0) , ! .
dosPares(A, B, C, D, E) :- dosPares(C, D) , (A mod 2 =\= 0) , (B mod 2 =\= 0) , (E mod 2 =\= 0) , ! .
dosPares(A, B, C, D, E) :- dosPares(C, E) , (A mod 2 =\= 0) , (B mod 2 =\= 0) , (D mod 2 =\= 0) , ! .
dosPares(A, B, C, D, E) :- dosPares(D, E) , (A mod 2 =\= 0) , (B mod 2 =\= 0) , (C mod 2 =\= 0) , ! .


% tresPares (A, B, C)
tresPares(A, B, C) :- (A mod 2 =:= 0) , (B mod 2 =:= 0) , (C mod 2 =:= 0) .

% tresPares (A, B, C, D)
tresPares(A, B, C, D) :- tresPares(A, B, C) , (D mod 2 =\= 0) , ! .
tresPares(A, B, C, D) :- tresPares(A, B, D) , (C mod 2 =\= 0) , ! .
tresPares(A, B, C, D) :- tresPares(A, C, D) , (B mod 2 =\= 0) , ! .
tresPares(A, B, C, D) :- tresPares(B, C, D) , (A mod 2 =\= 0) , ! .

% tresPares (A, B, C, D, E) : Predicado que es True, si solo 3 argumentos son pares y las demás impares.
tresPares(A, B, C, D, E) :- tresPares(A, B, C) , (D mod 2 =\= 0) , (E mod 2 =\= 0) , ! .
tresPares(A, B, C, D, E) :- tresPares(A, B, D) , (C mod 2 =\= 0) , (E mod 2 =\= 0) , ! .
tresPares(A, B, C, D, E) :- tresPares(A, B, E) , (C mod 2 =\= 0) , (D mod 2 =\= 0) , ! .
tresPares(A, B, C, D, E) :- tresPares(A, C, D) , (B mod 2 =\= 0) , (E mod 2 =\= 0) , ! .
tresPares(A, B, C, D, E) :- tresPares(A, C, E) , (B mod 2 =\= 0) , (D mod 2 =\= 0) , ! .
tresPares(A, B, C, D, E) :- tresPares(A, D, E) , (B mod 2 =\= 0) , (C mod 2 =\= 0) , ! .
tresPares(A, B, C, D, E) :- tresPares(B, C, D) , (A mod 2 =\= 0) , (E mod 2 =\= 0) , ! .
tresPares(A, B, C, D, E) :- tresPares(B, C, E) , (A mod 2 =\= 0) , (D mod 2 =\= 0) , ! .
tresPares(A, B, C, D, E) :- tresPares(B, D, E) , (A mod 2 =\= 0) , (C mod 2 =\= 0) , ! .
tresPares(A, B, C, D, E) :- tresPares(C, D, E) , (A mod 2 =\= 0) , (B mod 2 =\= 0) , ! .


% todosPares(A, B)
todosPares(A, B) :- (A mod 2 =:= 0) , (B mod 2 =:= 0) .
% todosPares (A, B, C)
todosPares(A, B, C) :- todosPares(A, B) , (C mod 2 =:= 0) , ! .
% todosPares (A, B, C, D)
todosPares(A, B, C, D) :- todosPares(A, B, C) , (D mod 2 =:= 0) , ! .
% todosPares (A, B, C, D, E) : Predicado que es True, si todos los argumentos son pares.
todosPares(A, B, C, D, E) :- todosPares(A, B, C, D) , (E mod 2 =:= 0) , ! .

% existePar(A, B)
existePar(A, B) :- (A mod 2 =:= 0) ; (B mod 2 =:= 0) .
% existePar(A, B, C)
existePar(A, B, C) :- existePar(A, B) ; (C mod 2 =:= 0) .
% existePar(A, B, C, D)
existePar(A, B, C, D) :- existePar(A, B, C) ; (D mod 2 =:= 0) .
% existePar(A, B, C, D, E) : Predicado que es True, si existe al menos un argumento par.
existePar(A, B, C, D, E) :- existePar(A, B, C, D) ; (E mod 2 =:= 0) .

% existeParImpar(A, B)
existeParImpar(A, B) :- (A mod 2 =:= 0) , (B mod 2 =\= 0) ; (A mod 2 =\= 0) , (B mod 2 =:= 0) .
% existeParImpar (A, B, C)
existeParImpar(A, B, C) :- existeParImpar(A, B) , ((C mod 2 =:= 0) ; (C mod 2 =\= 0)) , ! .
existeParImpar(A, B, C) :- existeParImpar(A, C) , ((B mod 2 =:= 0) ; (B mod 2 =\= 0)) , ! .
existeParImpar(A, B, C) :- existeParImpar(B, C) , ((A mod 2 =:= 0) ; (A mod 2 =\= 0)) , ! .

% existeParImpar (A, B, C, D)
existeParImpar(A, B, C, D) :- existeParImpar(A, B, C) , ((D mod 2 =:= 0) ; (D mod 2 =\= 0)) , ! .
existeParImpar(A, B, C, D) :- existeParImpar(A, B, D) , ((C mod 2 =:= 0) ; (C mod 2 =\= 0)) , ! .
existeParImpar(A, B, C, D) :- existeParImpar(A, C, D) , ((B mod 2 =:= 0) ; (B mod 2 =\= 0)) , ! .
existeParImpar(A, B, C, D) :- existeParImpar(B, C, D) , ((A mod 2 =:= 0) ; (A mod 2 =\= 0)) , ! .

% existeParImpar (A, B, C, D, E) : Predicado que es True, si entre todos los argumentos existe al menos un par y al menos un impar.
existeParImpar(A, B, C, D, E) :- existeParImpar(A, B, C, D) , ((E mod 2 =:= 0) ; (E mod 2 =\= 0)) , ! .
existeParImpar(A, B, C, D, E) :- existeParImpar(A, B, C, E) , ((D mod 2 =:= 0) ; (D mod 2 =\= 0)) , ! .
existeParImpar(A, B, C, D, E) :- existeParImpar(A, B, D, E) , ((C mod 2 =:= 0) ; (C mod 2 =\= 0)) , ! .
existeParImpar(A, B, C, D, E) :- existeParImpar(A, C, D, E) , ((B mod 2 =:= 0) ; (B mod 2 =\= 0)) , ! .
existeParImpar(A, B, C, D, E) :- existeParImpar(B, C, D, E) , ((A mod 2 =:= 0) ; (A mod 2 =\= 0)) , ! .

% ordenAsc (A, B)
ordenAsc(A, B) :- A < B .
% ordenAsc (A, B, C)
ordenAsc(A, B, C) :- ordenAsc(A, B) , B < C .
% ordenAsc (A, B, C, D)
ordenAsc(A, B, C, D) :- ordenAsc(A, B, C) , C < D .
% ordenAsc (A, B, C, D, E) : Predicado que es True, si la secuencia de los argumentos está en forma ascendente.
ordenAsc(A, B, C, D, E) :- ordenAsc(A, B, C, D) , D < E .

% ordenDesc (A, B)
ordenDesc(A, B) :- A > B .
% ordenDesc (A, B, C)
ordenDesc(A, B, C) :- ordenDesc(A, B) , B > C .
% ordenDesc (A, B, C, D)
ordenDesc(A, B, C, D) :- ordenDesc(A, B, C) , C > D .
% ordenDesc (A, B, C, D, E) : Predicado que es True, si la secuencia de los argumentos está en forma descendente.
ordenDesc(A, B, C, D, E) :- ordenDesc(A, B, C, D) , D > E .

% ordenado(A, B)
ordenado(A, B) :- ordenAsc(A, B) ; ordenDesc(A, B) .
% ordenado(A, B, C)
ordenado(A, B, C) :- ordenAsc(A, B, C) ; ordenDesc(A, B, C) .
% ordenado(A, B, C, D)
ordenado(A, B, C, D) :- ordenAsc(A, B, C, D) ; ordenDesc(A, B, C, D) .
% ordenado(A, B, C, D, E) : Predicado que es True, si la secuencia de argumentos están ordenados en formas ascendente o descendente.
ordenado(A, B, C, D, E) :- ordenAsc(A, B, C, D, E) ; ordenDesc(A, B, C, D, E) .

% palindrome (A, B)
palindrome(A, B) :- A =:= B .
% palindrome (A, B, C)
palindrome(A, _, C) :- A =:= C .
% palindrome (A, B, C, D)
palindrome(A, B, C, D) :- A =:= D , B =:= C .
% palindrome (A, B, C, D, E) : Predicado que es True, si la secuencia de los argumentos, de izquierda a derecha es lo mismo que de derecha a izquierda.
palindrome(A, B, _, D, E) :- A =:= E , B =:= D .


% menorDif (A, B, C, Me)
menorDif(A, B, C, Me) :- X is abs(A-B) , Y is abs(B-C) , menor(X, Y, Me) .

% menorDif (A, B, C, D, Me)
menorDif(A, B, C, D, Me) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(C-D) , menor(X, Y, Z, Me) .

% menorDif (A, B, C, D, E, Me) : Predicado que encuentra en Me, la menor diferencia de entre parejas de argumentos.
menorDif(A, B, C, D, E, Me) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(C-D) , W is abs(D-E) , menor(X, Y, Z, W, Me) .


% mayorDif(A, B, My)
mayorDif(A, B, My) :- My is abs(A-B) .
% mayorDif (A, B, C, My)
mayorDif(A, B, C, My) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , mayor(X, Y, Z, My) .
% mayorDif (A, B, C, D, My)
mayorDif(A, B, C, D, My) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(C-D) , W is abs(A-D) , mayor(X, Y, Z, W, My) .
% mayorDif (A, B, C, D, E, My) ) : Predicado que encuentra en My, la menor diferencia de entre parejas de argumentos.
mayorDif(A, B, C, D, E, My) :- X is abs(A-B) , Y is abs(B-C), Z is abs(C-D), W is abs(D-E), V is abs(A-E), mayor(X, Y, Z, W, V, My) .


% existeDif(A, B, C)
existeDif(A, B, C) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , (A =:= X ; B =:= Y ; C =:= Z) , ! .
existeDif(A, B, C) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , (B =:= X ; C =:= Y ; A =:= Z) , ! .
existeDif(A, B, C) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , (C =:= X ; B =:= Y ; A =:= Z) , ! .


% existeDif(A, B, C, D)
existeDif(A, B, C, D) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , W is abs(C-D), V is (A-D) , T is (B-D) , (A =:= X ; A =:= Y ; A =:= Z ; A =:= W ; A =:= V ; A =:= T ) , ! .
existeDif(A, B, C, D) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , W is abs(C-D), V is (A-D) , T is (B-D) , (B =:= X ; B =:= Y ; B =:= Z ; B =:= W ; B =:= V ; B =:= T ) , ! .
existeDif(A, B, C, D) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , W is abs(C-D), V is (A-D) , T is (B-D) , (C =:= X ; C =:= Y ; C =:= Z ; C =:= W ; C =:= V ; C =:= T ) , ! .
existeDif(A, B, C, D) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , W is abs(C-D), V is (A-D) , T is (B-D) , (D =:= X ; D =:= Y ; D =:= Z ; D =:= W ; D =:= V ; D =:= T ) , ! .
% existeDif(A, B, C, D, E) : Predicado que es True, si existe un argumento que sea igual a la diferencia de otros dos argumentos.
existeDif(A, B, C, D, E) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , W is abs(C-D), V is abs(D-E), T is abs(A-E), R is abs(B-E), S is abs(C-E), Q is abs(D-E),
                            (A =:= X ; A =:= Y ; A =:= Z ; A =:= W ; A =:= V ; A =:= T ; A =:= R ; A =:= S ; A =:= Q) , ! .
existeDif(A, B, C, D, E) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , W is abs(C-D), V is abs(D-E), T is abs(A-E), R is abs(B-E), S is abs(C-E), Q is abs(D-E),
                            (B =:= X ; B =:= Y ; B =:= Z ; B =:= W ; B =:= V ; B =:= T ; B =:= R ; B =:= S ; B =:= Q) , ! .
existeDif(A, B, C, D, E) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , W is abs(C-D), V is abs(D-E), T is abs(A-E), R is abs(B-E), S is abs(C-E), Q is abs(D-E),
                            (C =:= X ; C =:= Y ; C =:= Z ; C =:= W ; C =:= V ; C =:= T ; C =:= R ; C =:= S ; C =:= Q) , ! .
existeDif(A, B, C, D, E) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , W is abs(C-D), V is abs(D-E), T is abs(A-E), R is abs(B-E), S is abs(C-E), Q is abs(D-E),
                            (D =:= X ; D =:= Y ; D =:= Z ; D =:= W ; D =:= V ; D =:= T ; D =:= R ; D =:= S ; D =:= Q) , ! .
existeDif(A, B, C, D, E) :- X is abs(A-B) , Y is abs(B-C) , Z is abs(A-C) , W is abs(C-D), V is abs(D-E), T is abs(A-E), R is abs(B-E), S is abs(C-E), Q is abs(D-E),
                            (E =:= X ; E =:= Y ; E =:= Z ; E =:= W ; E =:= V ; E =:= T ; E =:= R ; E =:= S ; E =:= Q) , ! .



% sumandos(A, B, C)
sumados(A, B, C) :- A is B + C ; B is A + C ; C is A + B .
% sumandos(A, B, C, D)
sumados(A, B, C, D) :- sumados(A, B, C) ; sumados(A, B, D) ; sumados(A, C, D) ; sumados(B, C, D) .
% sumandos(A, B, C, D, E) : Predicado que es True, si 1 argumento es igual a la suma de los otros argumentos.
sumados(A, B, C, D, E) :- sumados(A, B, C, D) ; sumados(A, B, C, E) ; sumados(A, B, D, E) ; sumados(A, C, D, E) ; sumados(B, C, D, E) .



% divEntera(A, B, C)
divEntera(A, B, C) :- A is B // C ; B is A // C ; C is A // B .
% divEntera(A, B, C, D)
divEntera(A, B, C, D) :- divEntera(A, B, C) ; divEntera(A, B, D) ; divEntera(A, C, D) ; divEntera(B, C, D) .
% divEntera(A, B, C, D, E) : Predicado que es True, si existe un argumento igual a la división entera de otros dos argumentos.
divEntera(A, B, C, D, E) :- divEntera(A, B, C, D) ; divEntera(A, B, C, E) ; divEntera(A, B, D, E) ; divEntera(A, C, D, E) ; divEntera(B, C, D, E) .


% residuo(A, B, C)
residuo(A, B, C) :- A is B mod C ; B is A mod C ; C is A mod B , ! .
residuo(A, B, C) :- A is C mod B ; B is C mod A ; C is B mod A , ! .
% residuo(A, B, C, D)
residuo(A, B, C, D) :- residuo(A, B, C) ; residuo(A, B, D) ; residuo(A, C, D) ; residuo(B, C, D) .
% residuo(A, B, C, D, E) : Predicado que es True, si existe un argumento igual al residuo de la división entera de otros dos argumentos.
residuo(A, B, C, D, E) :- residuo(A, B, C, D) ; residuo(A, B, C, E) ; residuo(A, B, D, E) ; residuo(A, C, D, E) ; residuo(B, C, D, E) .