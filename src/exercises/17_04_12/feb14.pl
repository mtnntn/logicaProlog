/*
Possiamo rappresentare gli alberi binari
in Prolog mediante strutture che hanno
una di queste forme: leaf(X) (foglia
etichettata da X), one(X,T) (albero
con radice X e T come unico sottoalbero),
two(X,T1,T2) (albero con radice X e due
sottoalberi, T1 e T2).
Ad esempio, l’albero illustrato qui a fianco è rappresentato dalla struttura:

two(10,one(20,two(50,leaf(5),leaf(8))),
one(30,two(30,one(35,leaf(100)),two(40,leaf(6),leaf(48)))))
Scrivere programma con un predicato ordered(+Tree,-Branch) che ha successo quando
Tree `e un albero binario (rappresentato come descritto sopra), e Branch `e una lista
che rappresenta un ramo ordinato in senso non decrescente dalla radice a una foglia
dell’albero.
Se vi sono pi`u rami ordinati nell’albero, il predicato li generer`a tutti (mediante backtracking).
Ad esempio, se l’albero `e quello sopra rappresentato, il programma dar`a in
output i rami [10,30,30,35,100] e [10,30,30,40,48].

*/

/*Ragioniamo per approssimazione, iniziamo con la ricerca di un ramo. */

two(10,one(20,two(50,leaf(5),leaf(8))),
one(30,two(30,one(35,leaf(100)),
       two(40,leaf(6),leaf(48))))).
       
/*       Se l'albero è un one(X,T), (ha un unico sottoalbero), io ricorsivamente so ricercare un ramo nel sottoalbero, che sarà un certo ramo. 
come è fatto il ramo che è nell
  */     
ramo(leaf(X),[X]).
ramo(one(X,T), [X|R]):-
	ramo(T,R).
ramo(two(X,T,_), [X|R]):-
	ramo(T,R).
ramo(one(X,_,T), [X|R]):-
	ramo(T,R).

/* Adesso li vogliamo fare ordinati.*/
/* Una foglia è sempre ordinata */

ramo(leaf(X),[X]).
/* sappiamo che non sono mai liste vuote sti rami quindi */
ramo(one(X,T), [X,Y|R]):-
	ramo(T,[Y|R]),
	X =< Y.
ramo(two(X,T,_), [X|R]):-
	ramo(T,R),
	R=[Y|_],
	X=<Y.
ramo(one(X,_,T), [X|R]):-
	ramo(T,R),
	R=[Y|_],
	X=<Y.
