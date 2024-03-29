%HECHOS

%hombre(X) : Predicado que es True, con la persona hombre X.
hombre(jose).
hombre(juan).
hombre(pablo).
hombre(cesar).
hombre(pedro).
hombre(samuel).
hombre(carlos).

%mujer(X) :  Predicado que es True, con la persona mujer Y.
mujer(maria).
mujer(alicia).
mujer(julia).
mujer(sara).
mujer(tania).
mujer(isabel).
mujer(ana).
mujer(lucia).
mujer(elvira).

%matr(X, Y) : Predicado que es True, cuando el hombre X está casado con la mujer Y.
matr(jose, maria).
matr(juan, alicia).
matr(pablo, sara).
matr(cesar, tania).
matr(pedro, isabel).
matr(carlos, ana).

%madre(X, Y) : Predicado que es True, cuando la mujer X es la madre de la persona Y.
madre(maria, julia).
madre(maria, pablo).
madre(alicia, sara).
madre(alicia, cesar).
madre(sara, isabel).
madre(sara, samuel).
madre(tania, ana).
madre(tania, lucia).
madre(ana, elvira).

%REGLAS DE INFERENCIA

persona(X) :- hombre(X); mujer(X).

/*hermano(X, Y) : El hombre X es hermano de la persona Y.*/
hermano(X,Y) :- hombre(X), madre(Z,X), madre(Z,Y).

/*hermana(X, Y) : La mujer X es hermana de la persona Y.*/
hermana(X,Y) :- mujer(X), madre(Z,X), madre(Z,Y).

/*hermanos(X, Y) : Las personas X, Y son hermanos.*/
hermanos(X,Y) :- madre(Z,X), madre(Z,Y).

/*soltero(X): X es un hombre soltero.*/
soltero(X) :- hombre(X), not(matr(X, _)).

/*soltera(X): Y es una mujer soltera.*/
soltera(X) :- mujer(X), not(matr(_, X)).

/*padre(X, Y): X es el padre de Y.*/
padre(X, Y) :- madre(Z, Y), matr(X, Z).

/*abuela(X, Y) : X es la abuela de Y.*/
abuela(X, Y) :- madre(X, Z), madre(Z, Y);
                madre(X, Z), padre(Z, Y).

/*abuelo(X, Y) : X es el abuelo de Y.*/
abuelo(X, Y) :- padre(X, Z), padre(Z, Y);
                padre(X, Z), madre(Z, Y).

/*primosHermanos(X, Y) : Las personas X y Y son primos hermanos. (primos más cercanos)*/
primosHermanos(X, Y) :- not(hermanos(X, Y)),
                        abuelo(Z, X), abuelo(Z, Y);
                        abuela(Z, X), abuela(Z, Y),
                        not(hermanos(X, Y)).

/*sinHijos(X, Y) : La pareja de matrimonio X y Y, no tienen hijos.*/
sinHijos(X, Y) :- not(padre(X, _)), not(madre(Y, _)).

/*desc(X, Y) : La persona X es descendiente de la persona Y.*/
desc(X, Y) :- madre(Y, X) ; padre(Y, X).
desc(X, Y) :- madre(Z, X) , desc(Z, Y) ;
              padre(Z, X) , desc(Z, Y) .

/*parientes(X, Y) : Las personas X y Y son parientes.*/
parientes(X, Y) :- desc(X, Z) , desc(Y, Z) . 

/*Incluir al menos 5 Reglas adicionales por cada integrante de grupo, interesantes y novedosas.*/
/*tioa(X, Y) : La persona X es tio o tia de la persona Y */
tioa(X, Y) :- madre(Z, Y) , hermanos(Z, X) ;
              padre(Z, Y) , hermanos(Z, X) .

/*X es hijo o hija de Y*/
hijo(X, Y) :- madre(Y, X) ; padre(Y, X) .

/*cunados(X, Y) - X y Y son cuñados*/
cunados(Y, P) :- hermanos(P, C) , matr(C, Y) 