%Factorial:
factorial(0,1) :- ! .
factorial(N, F) :-
    Na is N - 1,
    factorial(Na, Fa),
    F is N * Fa .

%Potencia:
potencia(_, 0, 1) :- ! .    %Nota, n=0 = indeterminado
potencia(N, X, R) :-
    Xa is X - 1,
    potencia(N, Xa, Ra) ,
    R is N * Ra .

%Fibonacci:
fibo(1,1) :- ! .
fibo(2,1) :- ! .
fibo(N, F) :- 
    N1 is N - 1,
    N2 is N - 2,
    fibo(N1, F1),
    fibo(N2, F2),
    F is F1 + F2 .

%Combinatoria
combi(_, 0, 1) :- ! .
combi(N, N, 1) :- ! .
combi(N, R, X) :-
    N1 is N-1 ,
    combi(N1, R, Res1) ,
    R1 is R-1 ,
    combi(N1, R1, Res2) ,
    X is Res1 + Res2 .

%Digito mayot
mayDig(N, N) :- N < 10, !.
mayDig(N, M) :-
    % N >= 10,
    N1 is N // 10,
    mayDig(N1, Ma),
    N2 is N mod 10,
    (Ma < N2 -> M is N2 ; M is Ma).

%Sumar digitos
sumarDig(N, N) :- N < 10, ! .
sumarDig(N, R) :-
    N1 is N // 10,
    N2 is N mod 10,
    sumarDig(N1, R1),
    R is R1 + N2 .

%Contar digitos
contarDig(N, 1) :- N < 10 , ! .
contarDig(N, R) :-
    N1 is N // 10,
    contarDig(N1, R1) ,
    R is R1 + 1 .

%Sumar digitos pares
sumarDigPares(N, R) :-
    N < 10 ,
    ((N mod 2 =:= 0) -> R is N ; R is 0) .
sumarDigPares(N, R) :-
    N1 is N // 10,
    N2 is N mod 10,
    sumarDigPares(N1, R1) ,
    ((N2 mod 2 =:= 0) -> R is R1 + N2 ; R is R1 + 0) .

%Eliminar digitos
eliminarDigito(N, D, R) :-
    N < 10 ->
        (N =:= D -> R is 0 ; R is N) , ! .
eliminarDigito(N, D, R) :-
    N1 is N // 10 ,
    N2 is N mod 10 ,
    eliminarDigito(N1, D, R1),
    (N2 =\= D ->
        (R is R1*10 + N2) %Apilando
        ; (R is R1)) . 
