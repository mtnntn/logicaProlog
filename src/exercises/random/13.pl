/*
Definire un predicato insert(X,L1,L2), vero se L2 si ottiene inserendo X
in L1 (in qualsiasi posizione). 
Almeno una delle due liste L1 e L2 devono essere istanziate. 

Ad esempio:
?- insert(a,[1,2],X).
X = [a, 1, 2] ;
X = [1, a, 2] ;
X = [1, 2, a] ;
false.
?- insert(a,X,[1,a,2]).
X = [1, 2] ;
false.
*/

/*Devo definire un predicato che è vero bla...bla...bla*/

insert(X,L,[X|L]). /*IL modo di inserire x in una lista è metterlo come primo elemento */
insert(X,[Y,L], [Y|Result] ) :-
	insert(X,L,Result).
	