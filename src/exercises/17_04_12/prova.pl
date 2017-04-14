/* Esercizio 10 mkset(A,B) in cui set è una lista senza ripetizione*/

/* Abbiamo un input ed un output, quindi va implementata semplicemente la funszione 
	Devo scorrere la lista e piano piano vedere se devo aggiungere l'elemento o meno
*/
/*
del(_,[],[]).
del(X,[X|Rest],Lista) :-
	!,del(X,Rest,Lista).
	del(X,[X,]

mkset([],[]).
mkset([H|Rest],V) :- 
	member(X,Rest), !,
	del(X,Rest,V),
	mkset(V,V).
mkset([X|Rest],[X|V]):-mkset(Rest,V). 
*/

mkset([],[]).


mkset([X,Rest],Result) :- 
	not(member(X,Rest)), % Rest non è istanziata perciò fallisce sempre
	append(Result,[X],Z), 
	mkset(Rest,Z).
	
mkset([X,Rest],Result) :- 
	mkset(Rest,Y),
	append(Result,[X],Y),
	not(member(X,Result)). %cero di eseguire il not, se ho successo allora fallisco, altriemtni ho successo