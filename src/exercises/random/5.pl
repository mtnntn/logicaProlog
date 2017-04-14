/*Avendo definito
pari(X) :- 0 is X mod 2.
definire il predicato split(+L,?P,?D) = se L `e una lista di interi, P `e la
lista contenente tutti gli elementi pari di L e D tutti quelli dispari (nello
stesso ordine in cui occorrono in L).
*/

split([],[],[]).
split([X|Rest], P , D ):-
	pari(x),
	split(Rest,PR,DR),
	P=[X|PR].

split([X|Rest],[X|PR],DR):-
	pari(X),
	split(Rest,PR,DR).
	
split([X|Rest],PR,[X|DR]):-
	not(pari(X)),
	split(Rest,PR,DR).

split([X|Rest],[X|PR],DR):-
	pari(X), !,
	split(Rest,PR,DR).
	
split([X|Rest],PR,[X|DR]):-
	not(pari(X)),
	split(Rest,PR,DR).
	
	