/*sea el siguiente conjunto de hechos. (dar una lista de nombres…)*/
%hechos:
/*hombre( x ): x es persona hombre.*/
hombre(liam).
hombre(benjamin).
hombre(patrick).
hombre(phillip).
hombre(antonio).
hombre(andres).
hombre(mauricio).
hombre(guillermo).
hombre(david).
hombre(alvaro).

/*mujer( x ): x es persona mujer.*/
mujer(guadalupe).
mujer(maria).
mujer(daria).
mujer(cielo).
mujer(marleny).
mujer(ruty).
mujer(carla).
mujer(marileny).
mujer(marilin).
mujer(andrea).

/*cerveza( x ) : x es una cerveza.*/
cerveza(heineken).
cerveza(pacena).
cerveza(huary).
cerveza(ducal).
cerveza(corona).
cerveza(conti).
cerveza(santamaria).
cerveza(brahma).
cerveza(andina).
cerveza(reina).
cerveza(casera).

/*bar( x ): x es un bar.*/
bar(tulum).
bar(duda).
bar(mento).
bar(maroon).
bar(larotacarlota).
bar(karma).
bar(sanbartolo).
bar(milongaduotango).

/*bebedor( X ): X es una persona hombre o mujer bebedor.*/
bebedor(liam).
bebedor(benjamin).
bebedor(patrick).
bebedor(phillip).
bebedor(antonio).
bebedor(cielo).
bebedor(marleny).
bebedor(ruty).
bebedor(carla).
bebedor(marileny).
bebedor(guillermo).

/*gusta( X, Y ): La persona X gusta de la cerveza Y.*/
gusta(liam, heineken).
gusta(liam, pacena).
gusta(andres, huary).
gusta(cielo, ducal).
gusta(carla, corona).
gusta(carla, conti).
gusta(marileny, santamaria).
gusta(ruty, brahma).
gusta(marleny, andina).
gusta(liam, reina).
gusta(guillermo, corona).

/*sirve( X, Y ) : El Bar X sirve la cerveza Y.*/
sirve(tulum, heineken).
sirve(tulum, pacena).
sirve(tulum, huary).
sirve(duda, pacena).
sirve(duda, heineken).
sirve(duda, corona).
sirve(mento, huary).
sirve(maroon, ducal).
sirve(larotacarlota, corona).
sirve(karma, conti).
sirve(sanbartolo, santamaria).
sirve(milongauotango, brahma).
sirve(maroon, corona).



/*frec( X, Y ) : El bebedor X frecuenta al bar Y.*/
frec(liam, tulum).
frec(liam, duda).
frec(benjamin, maroon).
frec(benjamin, larotacarlota).
frec(patrick, sanbartolo).
frec(phillip, milongaduotango).
frec(antonio, mento).
frec(antonio, maroon).
frec(antonio, milongaduotango).
frec(cielo, milongaduotango).
frec(marleny, larotacarlota).
frec(marleny, karma).
frec(marleny, sanbartolo).
frec(marleny, milongaduotango).
frec(guillermo, maroon).
frec(mauricio, duda).

/*Escribir Reglas para las siguientes consultas:*/

/* Personas hombres que NO frecuentan a ningún bar.*/
hombNoFrecBar(X) :- hombre(X), not(frec(X, _)).

/* Personas (hombres o mujeres) que no gustan de ninguna cerveza.*/
persona(X) :- hombre(X) ; mujer(X).
noToma(X) :- persona(X) , not(bebedor(X)).


/* Bebedores que frecuentan a un bar donde sirven una cerveza que a ellos les gusta.*/
tieneBarCervezaFavorita(X) :- persona(X) , frec(X, B) , sirve(B, C) , gusta(X, C).

/* Cervezas que no sirve un bar X = bar, Y = cerveza.*/
cervezasQueNoSirveElBar(X, Y) :- bar(X) , cerveza(Y) , not(sirve(X, Y)).

/* Bares donde no frecuenta un bebedor: bebedor = X, bar = Y.*/
bebedorNoFrecBar(X, Y) :- bebedor(X) , bar(Y) , not(frec(X, Y)).


/* Definir al menos 5 reglas y o consultas adicionales cualesquiera */

/*Persona que frecuenta un bar pero que no bebe: persona X*/
salePeroNoBebe(X) :- persona(X) , not(bebedor(X)) , frec(X, _).

/*Mujeres = X y hombres = Y que van al mismo bar*/
vanAlMismoBar(X, Y) :- mujer(X) , hombre(Y) , frec(X, Z) , frec(Y, Z).

/*X y Y son personas que gustan de las mismas cervezas*/
gustanMismaCerveza(X, Y) :- persona(X) , persona(Y) , gusta(X , Z) , gusta(Y, Z).

/*Bar al que van solo mujeres*/
/*barSoloMujeres(X) :- bar(X) , mujer(Y) , frec(Y, X) , hombre(Z), not(frec(Z, X)).*/
barSoloMujeres(X) :- mujer(Y) , bar(X), frec(Y, X) ,hombre(Z), not(frec(Z, X)).

/*Cerveza que a nadie le gusta:*/
cervezaNoGustada(X) :- cerveza(X) , not(gusta(_,X)).