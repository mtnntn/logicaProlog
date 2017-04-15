/*
11. Diciamo che X occorre in Y se X=Y, oppure Y è una lista e X occorre in qualche elemento di Y.

(a) Definire un predicato occurs in(?X,+Y) vero se X occorre in Y.
	Ad, esempio, si avrà:
		?- occurs_in(X,[a,[b,[c,d]]]).
		X = [a, [b, [c, d]]] ;
		X = a ;
		X = [b, [c, d]] ;
		X = b ;
		X = [c, d] ;
		X = c ;
		X = d ;
		false.

(b) Definire un predicato flat(+X,?Y) che riporti in Y tutti i termini (atomi o strutture) che occorrono in X. 
	Ad esempio:
		?- flat([a,[f(b),10,[c,d]]],Flat).
		Flat = [a, f(b), 10, c, d].
    Può essere utile utilizzare il predicato predefinito is list/1.
*/


/*
(a) Definire un predicato occurs in(?X,+Y) vero se X occorre in Y.
*/

occurs_in(Elem,[Elem|_]).
occurs_in(Elem,[H|_]):- is_list(H),!,occurs_in(Elem,H).
occurs_in(Elem,[_|Tail]):- occurs_in(Elem,Tail).

/*Tests:
occurs_in(X,[a,[b,[c,d]]]).
*/


/*
(b) Definire un predicato flat(+X,?Y) che riporti in Y tutti i termini (atomi o strutture) che occorrono in X. 
   
     flat([a, [f(b),10, [c,d] ] ] , Flat).
     Flat = [a, f(b), 10, c, d].
*/

flat(Struct,ListAll):- flat(Struct,ListAll,[]).

flat([],L,L).
flat([Elem|_],Res,Cont):- 
	is_list(Elem),flat(Elem,Res,Cont).
flat([Elem|Tail],Res,Cont):-
	flat(Tail,Res,App), append(Cont,[Elem],App).

/*Test
flat([a,[f(b),10,[c,d]]],X).
*/

