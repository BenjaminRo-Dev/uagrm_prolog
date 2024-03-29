/* BASE DE CONOCIMIENTO: PERSONAS SIMPÁTICAS

Sea el siguiente conjunto de Hechos. (Dar una lista de nombres…)*/

/*hombre( X ) : Persona hombre.*/
hombre(benjamin).
hombre(liam).
hombre(patrick).
hombre(mauricio).
hombre(guillermo).
hombre(david).
hombre(bladimir).
hombre(rafael).
hombre(jhonatan).
hombre(juan).
hombre(jhon).
hombre(cristiano).

/*mujer( X ): Persona mujer.*/
mujer(guadalupe).
mujer(carla).
mujer(flavia).
mujer(fabiana).
mujer(ruth).
mujer(alexandra).
mujer(fernanda).
mujer(renata).
mujer(elena).
mujer(jasmin).
mujer(aria).

/*matr( X, Y ) : El hombre X está casado con la mujer Y.*/
matr(benjamin, guadalupe).
matr(liam, carla).
matr(patrick, flavia).
matr(mauricio, fabiana).
matr(guillermo, ruth).
matr(david, alexandra).
matr(bladimir, fernanda).

/*hombreSimp( X, Y ): El hombre X cae simpático a la mujer Y.*/
hombreSimp(benjamin, guadalupe).
hombreSimp(benjamin, ruth).
hombreSimp(liam, carla).
hombreSimp(liam, jasmin).
hombreSimp(liam, renata).
hombreSimp(patrick, flavia).
hombreSimp(patrick, alexandra).
hombreSimp(david, fernanda).
hombreSimp(rafael, ruth).
hombreSimp(cristiano, alexandra).

/*mujerSimp( X, Y ) : La mujer Y cae simpática al hombre X.*/
mujerSimp(benjamin, guadalupe).
mujerSimp(jhonatan, guadalupe).
mujerSimp(bladimir, guadalupe).
mujerSimp(patrick, carla).
mujerSimp(mauricio, flavia).
mujerSimp(maricio, fabiana).
mujerSimp(guillermo, elena).
mujerSimp(david, fernanda).
mujerSimp(jhon, aria).
mujerSimp(jhonatan, renata).
mujerSimp(jhonatan, aria).


/*Definir Reglas para los siguientes consultas:*/

% * Encontrar las parejas de matrimonios que se caen simpáticos mutuamente. X=hombre, y=mujer
matrSimp(X, Y) :- matr(X, Y) , hombreSimp(X, Y), mujerSimp(X, Y).

% * Encontrar Hombres que caen simpáticos solo a mujeres casadas. hombre X, mujer Y
hombSimpCasadas(X, Y) :- matr(_, Y) , hombreSimp(X, Y) .

% * Encontrar hombres = X y mujeres = Y que se caen simpáticos mutuamente y que no sean casados.
mutuamenteSimp(X, Y) :- hombreSimp(X, Y) , mujerSimp(X, Y) , not(matr(X, Y)).

% * Definir al menos 5 reglas y o consultas adicionales cualesquiera. */
/*1. Personas que no les caen simpaticos a nadie*/

noSimp(X) :- hombre(X) ,  not(hombreSimp(X, _)) ; mujer(X) , not(mujerSimp(_, X)).

% 2. Mujer soltera que cae simpatica solo a solteros: hombre X, mujer Y

simpaticaSolteros(X, Y) :- mujerSimp(X, Y) , not(matr(_, Y)) , not(matr(X, _)) .

% 3. Hombre soltero que le cae simpaticas solo mujeres casdas, hombre X, mujer Y

simpaticasCasadas(X, Y) :- matr(_, Y) , mujerSimp(X, Y) , not(matr(X, _)) .

% 4. Mutuamente simpaticos y ambos casados con diferentes personas X = hombre, Y = mujer.
casadosSimpaticos(X, Y) :- matr(_, Y) , matr(X, _) , mutuamenteSimp(X, Y) .

% 5. mujer que le cae simpaticos solo los solteros Y = mujer
mujerSimpSolteros(Y) :- mujer(Y) , hombreSimp(X, Y) , not(matr(X, _)).


/*Mis comentarios:

    Con esta tercer practica, he aprendido mucho mas sobre prolog, por ejemplo,
    aunque esté bien escrito el problema, si usamos variables indefinidas,
    debemos especificar si es hombre o mujer de acuerdo a los ejercicios que estamos haciendo.

*/
