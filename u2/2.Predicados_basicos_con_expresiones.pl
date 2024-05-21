%: Predicado que es TRUE, si todos los argumentos son enteros positivos:

positivo(A) :- A > 0 .

positivo(A, B) :- A > 0 , B > 0 .

positivo(A, B, C) :- A > 0 , B > 0 , C > 0 .

positivo(A, B, C, D) :- A > 0 , B > 0 , C > 0 , D > 0 .

positivo(A, B, C, D, E) :- positivo(A,B,C,D) , positivo(E) .

% Predicado que es TRUE, si todos los argumentos son enteros negativos.
negativo(A) :- A < 0 .

negativo(A, B) :- negativo(A) , negativo(B) .

negativo(A, B, C) :- negativo(A, B) , negativo(C) .

negativo(A, B, C, D) :- negativo(A, B, C) , negativo(D) .

negativo(A, B, C, D, E) :- negativo(A, B, C, D) , negativo(E) .

% Predicado que es TRUE, si en la lista de argumentos existe al menos un entero positivo.
existePositivo(A) :- positivo(A) .

existePositivo(A, B) :- positivo(A) ; positivo(B) .

existePositivo(A, B, C) :- existePositivo(A, B) ; existePositivo(C) .

existePositivo(A, B, C, D) :- existePositivo(A, B, C) ; existePositivo(D) .

existePositivo(A, B, C, D, E) :- existePositivo(A, B, C, D) ; existePositivo(E) .

% Predicado que es TRUE, si en la lista de argumentos existe al menos un entero negativo.
existeNegativo(A) :- not(existePositivo(A)) .

existeNegativo(A, B) :- negativo(A) ; negativo(B) .

existeNegativo(A, B, C) :- existeNegativo(A, B) ; negativo(C) .

existeNegativo(A, B, C, D) :-  existeNegativo(A, B, C) ; negativo(D) .

existeNegativo(A, B, C, D, E) :-  existeNegativo(A, B, C, D) ; negativo(E) .


% Predicado que es TRUE, si existen argumentos positivos y negativos.
postivoNeg(A, B) :- positivo(A) , negativo(B) .

postivoNeg(A, B, _) :- positivo(A) , negativo(B) , ! .
postivoNeg(A, _, C) :- positivo(A) , negativo(C) , ! .
postivoNeg(_, B, C) :- positivo(B) , negativo(C) , ! .
postivoNeg(A, B, _) :- negativo(A) , positivo(B) , ! .
postivoNeg(A, _, C) :- negativo(A) , positivo(C) , ! .
postivoNeg(_, B, C) :- negativo(B) , positivo(C) , ! .

postivoNeg(A, B, C, D) :- postivoNeg(A, B) ; postivoNeg(A, C) ; postivoNeg(A, D) ; postivoNeg(B, C) ; postivoNeg(B, D) ; postivoNeg(C, D) ;
                          postivoNeg(B, A) ; postivoNeg(C, A) ; postivoNeg(D, A) ; postivoNeg(C, B) ; postivoNeg(D, B) ; postivoNeg(D, C) .

postivoNeg(A, B, C, D, E) :- postivoNeg(A, B, C, D) ;
                             postivoNeg(A, B, C, E) ;
                             postivoNeg(A, B, D, E) ;
                             postivoNeg(A, C, D, E) ;
                             postivoNeg(B, C, D, E) .

%  Predicado que es TRUE, si la secuencia de argumentos están alternados entre positivos y negativos or negativos y positivos.
alternos(A, B) :- A > 0 , B < 0 ; A < 0 , B > 0 .

alternos(A, B, C) :- positivo(A) , negativo(B) , positivo(C) , ! .
alternos(A, B, C) :- negativo(A) , positivo(B) , negativo(C) .

alternos(A, B, C, D) :- positivo(A) , negativo(B) , positivo(C), negativo(D) , ! .
alternos(A, B, C, D) :- negativo(A) , positivo(B) , negativo(C), positivo(D).

alternos(A, B, C, D, E) :- positivo(A) , negativo(B) , positivo(C), negativo(D) , positivo(E), ! .
alternos(A, B, C, D, E) :- negativo(A) , positivo(B) , negativo(C), positivo(D) , negativo(E).

% Predicado que es TRUE, si el entero A, es un entero positivo de un solo dígito. Si el entero A, tiene más de dos dígitos es FALSE.
unDigitoPos(A):- positivo(A) , (A // 10) =:= 0 .

% Predicado que es TRUE, si el entero A, es un entero negativo de un solo dígito. Si el entero A, tiene más de dos dígitos es FALSE.
unDigitoNeg(A) :- negativo(A) , (A // 10) =:= 0 .

% Predicado que es TRUE, si todos los argumentos son enteros positivos de dos dígitos.
dosDigitosPos(A) :- positivo(A) , (A >= 10) , (A =< 99) .

dosDigitosPos(A, B) :- dosDigitosPos(A) , dosDigitosPos(B) .

dosDigitosPos(A, B, C) :- dosDigitosPos(A, B) , dosDigitosPos(C) .

dosDigitosPos(A, B, C, D) :- dosDigitosPos(A, B, C) , dosDigitosPos(D) .

dosDigitosPos(A, B, C, D, E) :- dosDigitosPos(A, B, C, D) , dosDigitosPos(E) .


% Predicado que es TRUE, si todos los argumentos son enteros negativos* de dos dígitos.
dosDigitosNeg(A) :- negativo(A) , (A =< -10) , (A >= -99) .

dosDigitosNeg(A, B) :- dosDigitosNeg(A) , dosDigitosNeg(B) .

dosDigitosNeg(A, B, C) :- dosDigitosNeg(A, B) , dosDigitosNeg(C) .

dosDigitosNeg(A, B, C, D) :- dosDigitosNeg(A, B, C) , dosDigitosNeg(D) .

dosDigitosNeg(A, B, C, D, E) :- dosDigitos(A, B, C, D) , dosDigitosNeg(E) .

% Predicado que es TRUE, si todos los argumentos son enteros positivos de tres dígitos.
tresDigitosPos(A) :- positivo(A) , (A >= 100) , (A =< 999) .

tresDigitosPos(A, B) :- tresDigitosPos(A) , tresDigitosPos(B) .

tresDigitosPos(A, B, C) :- tresDigitosPos(A, B) , tresDigitosPos(C) .

tresDigitosPos(A, B, C, D) :- tresDigitosPos(A, B, C) , tresDigitosPos(D) .

tresDigitosPos(A, B, C, D, E) :- tresDigitosPos(A, B, C, D) , tresDigitosPos(E) .

% Predicado que es TRUE, si todos los argumentos son enteros negativos de tres dígitos.
tresDigitosNeg(A) :- negativo(A) , (A =< -100) , (A >= -999) .

tresDigitosNeg(A, B) :- tresDigitosNeg(A) , tresDigitosNeg(B) .

tresDigitosNeg(A, B, C) :- tresDigitosNeg(A, B) , tresDigitosNeg(C) .

tresDigitosNeg(A, B, C, D) :- tresDigitosNeg(A, B, C) , tresDigitosNeg(D) .

tresDigitosNeg(A, B, C, D, E) :- tresDigitosNeg(A, B, C, D) , tresDigitosNeg(E) .

% Predicado que es TRUE, si todos los argumentos son enteros de un solo dígito y pueden ser positivos y/o negativos.
unDigito(A) :- (A // 10) =:= 0 .

unDigito(A, B) :- unDigito(A) , unDigito(B) .

unDigito(A, B, C) :- unDigito(A, B) , unDigito(C) .

unDigito(A, B, C, D) :- unDigito(A, B, C) , unDigito(D) .

unDigito(A, B, C, D, E) :- unDigito(A, B, C, D) , unDigito(E) .

% Predicado que es TRUE, si todos los argumentos son enteros de dos dígito y pueden ser positivos y/o negativos.
dosDigitos(A) :- (A >= 10) , (A =< 99) ; (A >= -99) , (A =< -10).

dosDigitos(A, B) :- dosDigitos(A) , dosDigitos(B) .

dosDigitos(A, B, C) :- dosDigitos(A, B) , dosDigitos(C) .

dosDigitos(A, B, C, D) :- dosDigitos(A, B, C) , dosDigitos(D) .

dosDigitos(A, B, C, D, E) :- dosDigitos(A, B, C, D) , dosDigitos(E) .

% Predicado que es TRUE, si todos los argumentos son enteros de tres dígito y pueden ser positivos y/o negativos.
tresDigitos(A) :- (A >= 100) , (A =< 999) ; (A >= -999) , (A =< -100).

tresDigitos(A, B) :- tresDigitos(A) , tresDigitos(B) .

tresDigitos(A, B, C) :- tresDigitos(A, B) , tresDigitos(C) .

tresDigitos(A, B, C, D) :- tresDigitos(A, B, C) , tresDigitos(D) .

tresDigitos(A, B, C, D, E) :- tresDigitos(A, B, C, D) , tresDigitos(E) .