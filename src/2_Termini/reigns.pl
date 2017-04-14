/* pop(X,N) :- state X has a population of N */
pop(usa, 203).
pop(india, 548).
pop(china, 800).
pop(brazil, 108).

/* area(X,A) :- state X has an area of A milion of miles */
area(usa, 3).
area(india, 1).
area(china, 4).
area(brazil, 3).

/* density(X,D) :- state X has a density of population D */
density(C,D) :-
	pop(C,P),
	area(C,A),
	D is P/A.

/* Usefull queries:
?- prince(cadwallon, 986).
yes
?- prince(rhodri, 1979).
no
?- prince(X, 900).
X=anarawd
yes
?- prince(X, 979).
X=lago_ap_idwal
X=hywel_ap_ieuaf
yes
*/