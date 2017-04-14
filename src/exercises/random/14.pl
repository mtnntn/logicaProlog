/*
Definire un predicato permut(X,Y) vero se X e Y sono liste e Y `e una
permutazione di X (senza usare il predicato predefinito permutation/2).
Ad esempio:
?- permut([1,2,3],Permut).
Permut = [1, 2, 3] ;

*/

permut([],[]).
permut( [X|Rest],Y) :-
	permut(Rest,Z),
	insert(X,Z,Y).
	