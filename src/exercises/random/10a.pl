/* subset
subset(+Sub,?Set)*/

subset([],_).
subset([X|Rest],Set):-
	member(X,Set),
	subset(Rest,Set).
	
/* Se il primo è dato in input provo a vedere quando non è un subset */
subs(Sub, Set):-
	not(member(X,Sub), 
	not(member(X,Set))).
	
subs(Sub, Set):-
	member(X,Sub), 
	not(member(X,Set)),!,fail.

subs(_,_).

/* Sub e set devono essere completamente instanziati in modo che non ic siano variabili non legate.*/

