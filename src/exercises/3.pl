/*
Definire il predicato palindroma(X), vero se X `e una lista palindroma,
(se la lista viene letta in un verso o nell’altro si ottiene la stessa sequenza di elementi). 
Ad esempio [a,b,c,b,a] `e palindroma, [a,b,c,a] non lo é.
*/

/*
Possibile strategia
Duplico lista, ne inverto una, confronto elementi.
	Ho lista uno.
	Copio lista uno in lista2.
	reverse di lista due.
	inizio confronto(Lista1,Lista2): 
		- Se lista1 è vuota e lista2 è vuota : ho vinto.
		- Se Head di 1 e Head di 2 sono uguali allora lancio ricorsivamente
			la funzione su Tail di 1 e Tail di due.

NB. Si suppone di non avere a disposizione il predicato Reverse! */
my_reverse(List,RevList):-revers(List,[],RevList).
revers([],L,L).
revers([H1|T1],Acc,Rev):-
	revers(T1,[H1|Acc],Rev).
	
equals([],[]).
equals([H1|T1],[H2|T2]):-
	H1=H2,
	equals(T1,T2).
	
palindroma(Lista) :- 
	my_reverse(Lista,RevList),
	equals(Lista,RevList).
	
/* Scitta così fa schifo, voglio sfruttare ricorsione e unificazione. Come procedo? */