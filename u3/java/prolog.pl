% PROBLEMAS DE NATURALEZA ITERATIVA.
% Implementar los siguientes ejercicios: Iterativo, Recursivo, ProLog. Las Soluciones Iterativo y Recursivo escribir en algún otro lenguaje de programación.

% 1. mostrarDivisores( N ) : Predicado que muestra los divisores del entero N. Muestra desde el 1 a N.
mostrarDivisores(N) :- mostrarDivisores(N, 1) .
mostrarDivisores(N, I) :- I > N , ! .
mostrarDivisores(N, I) :-
    N mod I =:= 0 ,
    write(I), nl,
    I1 is I + 1,
    mostrarDivisores(N, I1) , ! .
mostrarDivisores(N, I) :-
    I1 is I + 1 ,
    mostrarDivisores(N, I1) .


% 2. primo( N ) : Predicado que es True, si el entero N es un número primo.
primo(N) :- primo(N, 1, 0) .

primo(N, I, C) :-
    I > N , C =:= 2 .

primo(N, I, C) :-
    I =< N ,
    (N mod I =:= 0 -> C1 is C + 1 ; C1 is C) ,
    I1 is I + 1 ,
    primo(N, I1, C1) .

% 3. mostrarDivisoresPrimos( N ) : Predicado que muestra los divisores primos del entero N.
    mostrarDivisoresPrimos(N) :- mostrarDivisoresPrimos(N, 1) .
    mostrarDivisoresPrimos(N, I) :- I > N , ! .
    mostrarDivisoresPrimos(N, I) :-
        I =< N ,
        ((N mod I =:= 0) , primo(I) -> 
            write(I), nl,
            I1 is I + 1),
        mostrarDivisoresPrimos(N, I1) , ! .

    mostrarDivisoresPrimos(N, I) :-
        I1 is I + 1,
        mostrarDivisoresPrimos(N, I1) .

% 4. mostrarPrimos(A, B) : Predicado que muestra, los número primos entre A y B. inclusive.
mostrarPrimos(A, B) :-
    A > B .

mostrarPrimos(A, B) :-
    A =< B ,
    primo(A) -> write(A), nl ,
    A1 is A + 1 ,
    mostrarPrimos(A1, B) , ! .

mostrarPrimos(A, B) :-
    A1 is A + 1 ,
    mostrarPrimos(A1, B) , ! .

% 5. mostrarDivisoresDesc( N ): Predicado que muestra los divisores del entero N. Muestra desde el N a 1.
mostrarDivisoresDesc(N) :-
    mostrarDivisoresDesc(N, N) .

mostrarDivisoresDesc(_, I) :-
    I < 1 , ! .

mostrarDivisoresDesc(N, I) :-
    (N mod I =:= 0 -> 
        write(I), nl ,
        I1 is I - 1) ,
    mostrarDivisoresDesc(N, I1) , ! .

mostrarDivisoresDesc(N, I) :-
    I1 is I - 1,
    mostrarDivisoresDesc(N, I1) .


% 6. mostrarDivisoresComunes(N, M) : Predicado que muestra los divisores comunes de los entero N y M.
mostrarDivisoresComunes(N, M) :-
    mostrarDivisoresComunes(N, M, 1) .

mostrarDivisoresComunes(N, M, I) :-
    (I > N ; I > M) , ! .

mostrarDivisoresComunes(N, M, I) :-
    (N mod I =:= 0) , (M mod I =:= 0) ,
    write(I) , nl ,
    I1 is I + 1 ,
    mostrarDivisoresComunes(N, M, I1) , ! .

mostrarDivisoresComunes(N, M, I) :-
    I1 is I + 1 ,
    mostrarDivisoresComunes(N, M, I1) , ! .

% 7. mostrarDivisoresPares( N ) : Predicado que muestra los divisores pares de N.
mostrarDivisoresPares(N) :- 
    mostrarDivisoresPares(N, 1) .

mostrarDivisoresPares(N, I) :-
    I > N , ! .

mostrarDivisoresPares(N, I) :-
    (I mod 2 =:= 0) , (N mod I =:= 0) ,
    writeln(I) ,
    I1 is I + 1 ,
    mostrarDivisoresPares(N, I1) , ! .

mostrarDivisoresPares(N, I) :-
    I1 is I + 1,
    mostrarDivisoresPares(N, I1) , ! .

% 8. mostrarDivisoresImpares( N ): Predicado que muestra los divisores impares de N.
mostrarDivisoresImpares(N) :-
    mostrarDivisoresImpares(N, 1) .

mostrarDivisoresImpares(N, I) :-
    I > N , ! .

mostrarDivisoresImpares(N, I) :-
    (I mod 2 =\= 0) , (N mod I =:= 0) ,
    writeln(I) ,
    I1 is I + 1 ,
    mostrarDivisoresImpares(N, I1) , ! .

mostrarDivisoresImpares(N, I) :-
    I1 is I + 1,
    mostrarDivisoresImpares(N, I1) , ! .
    
% 5. mostrarDivisores(N, A, B) : Predicado que muestra los divisores de N, comprendidos entre A y B inclusive.
mostrarDivisores(N, A, B) :- 
    (A > B) ; (A > N) , ! .

mostrarDivisores(N, A, B) :-
    (N mod A =:= 0) ,
    writeln(A),
    A1 is A + 1 ,
    mostrarDivisores(N, A1, B) , ! .
    
mostrarDivisores(N, A, B) :-
    A1 is A + 1 , 
    mostrarDivisores(N, A1, B) , ! .


% 9. proximoPrimo(N, P) : Predicado que encuentra en P, el primo después de N. Si N es primo,  P toma el valor de N.
proximoPrimo(N, P) :-
    primo(N) , 
    P is N , ! .

proximoPrimo(N, P) :-
    N1 is N + 1 ,
    proximoPrimo(N1, P) , ! .


% 10. anteriorPrimo(N, A) : Predicado que encuentra en A, el anterior primo antes de N. Si N es primo,  A toma el valor de N.
anteriorPrimo(N, A) :-
    N < 1 , A is 0 , ! .

anteriorPrimo(N, A) :-
    primo(N) ,
    A is N , ! .

anteriorPrimo(N, A) :-
    N1 is N - 1 ,
    anteriorPrimo(N1, A) , ! .

% 11. mostrarDivisoresPrimosAsc(N) : Predicado que muestra los divisores primos de N. Muestra desde 1 hasta N.
mostrarDivisoresPrimosAsc(N) :-
    mostrarDivisoresPrimosAsc(N, 1) .

mostrarDivisoresPrimosAsc(N, I) :-
    I > N .

mostrarDivisoresPrimosAsc(N, I) :-
    (N mod I =:= 0) , (primo(I)) ,
    writeln(I) ,
    I1 is I + 1 ,
    mostrarDivisoresPrimosAsc(N, I1) , ! .

mostrarDivisoresPrimosAsc(N, I) :-
    I1 is I + 1 ,
    mostrarDivisoresPrimosAsc(N, I1) , ! .
    


% 12. mostrarDivisoresPrimosDesc( N ) : Predicado que muestra los divisores primos de N. Muestra desde N hasta 1.
mostrarDivisoresPrimosDesc(N) :-
    mostrarDivisoresPrimosDesc(N, N) .

mostrarDivisoresPrimosDesc(_, I) :-
    I < 1 .

mostrarDivisoresPrimosDesc(N, I) :-
    (N mod I =:= 0) , (primo(I)) ,
    writeln(I) ,
    I1 is I - 1 ,
    mostrarDivisoresPrimosDesc(N, I1) .
    
mostrarDivisoresPrimosDesc(N, I) :-
    I1 is I - 1 ,
    mostrarDivisoresPrimosDesc(N, I1) .

% 13. mostrarFactoriales( N ): Predicado que muestra los factoriales de 1 a N.
% Si N = 5
    % 1! = 1
    % 2! = 2
    % 3! = 6
    % 4! = 24
    % 5! = 120

mostrarFactoriales(N) :-
    mostrarFactoriales(N, 1, 1) .

mostrarFactoriales(N, I, _) :-
    I > N .

mostrarFactoriales(N, I, F) :-
    F1 is I * F ,
    writeln(F1) ,
    I1 is I + 1 ,
    mostrarFactoriales(N, I1, F1) .

%  14. mostrarCoefBin( N ) : Predicado que muestra los coeficientes binomiales de un binomio elevado a la N. Ej. Si N = 2, muestra 1, 2, 1. Si N = 4,  muestra    1, 4, 6, 4, 1.

% 15. mostrarFib(N): Predicado que muestra los primeros N términos de la secuencia de Fibonacci.
    % 1, 1, 2, 3, 5, 8, 13, 21, 34
mostrarFib(N) :-
    N > 0, % Aseguramos que N sea positivo
    writeln(1), % Mostrar el primer término
    mostrarFib(N, 1, 1, 1) .

mostrarFib(N, I, _, _) :-
    I >= N , ! .

mostrarFib(N, I, F1, F2) :-
    F is F1 + F2 ,
    writeln(F) ,
    % F2 is F1 ,
    % F1 is F ,
    I1 is I + 1 ,
    mostrarFib(N, I1, F2, F) .

% 16. Ejercicios de lógica. (no cíclicos)

% dosPrimos(A, B),
dosPrimos(A, B) :-
    primo(A) , primo(B) .

% dosPrimos(A, B, C),
dosPrimos(A, B, C) :-
    (primo(A) , primo(B) , not(primo(C))) ;
    (primo(A) , primo(C) , not(primo(B))) ;
    (primo(B) , primo(C) , not(primo(A))) .

% dosPrimos(A, B, C, D) : Predicado que es True, si existe dos primos exactamente entre los argumentos.
dosPrimos(A, B, C, D) :-
    dosPrimos(A, B) , not(primo(C)) , not(primo(D)) ;
    dosPrimos(A, C) , not(primo(B)) , not(primo(D)) ;
    dosPrimos(A, D) , not(primo(B)) , not(primo(C)) ;
    dosPrimos(B, C) , not(primo(A)) , not(primo(D)) ;
    dosPrimos(B, D) , not(primo(A)) , not(primo(C)) ;
    dosPrimos(C, D) , not(primo(A)) , not(primo(B)) .    

% 17. 

% existePrimoNP(A, B),
existePrimoNP(A, B) :-
    (primo(A), not(primo(B))) ; primo(B), not(primo(A)) .

% existePrimoNP(A, B, C),
existePrimoNP(A, B, C) :-
    existePrimoNP(A, B) ; existePrimoNP(A, C) ; existePrimoNP(B, C) .

% existePrimoNP(A, B, C, D) : Predicado que es True, si existe al menos un primo y un no primo entre los argumentos.
existePrimoNP(A, B, C, D) :-
    existePrimoNP(A, B, C) ; existePrimoNP(A, B, D) ; existePrimoNP(A, C, D) ; existePrimoNP(B, C, D) .


% 18.

% primosAlternos(A, B),
primosAlternos(A, B) :-
    (primo(A) , not(primo(B))) ; (primo(B) , not(primo(A))) .

% primosAlternos(A, B, C),
primosAlternos(A, B, C) :-
    (primo(A) , not(primo(B)) , primo(C)) ; (not(primo(A)) , primo(B) , not(primo(C))) .

% primosAlternos(A, B, C, D) : Predicado que es True, si la secuencia de argumentos están alternados entre primos y no primos.
primosAlternos(A, B, C, D) :-
    (primo(A) , not(primo(B)) , primo(C) , not(primo(D))) ;
    (primo(B) , not(primo(A)) , primo(D) , not(primo(C))) .
    