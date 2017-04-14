/* Vogliamo implementare il merge sort */

/* Nel caso ricorsivo come facciamo, dividiamo la lista in due parti piu omeno uguali, ricorsivamente ordino una parte e l'altra e poi faccio la fusione

Devo quindi spezzare a metà una lista

Devo fare la funzione di merge.

Tuttavia come sappiamo al prolog non da fastidio se lavoriamo top-down.*/

mergesort([],[]).
mergesort([X],[X]).
mergesort(Lista,Sorted):- /*Devo fare uno split */
	split(Lista,Prima,Seconda),
	mergesort(Prima,Psorted),
	mergesort(Seconda,SSorted),
	merge(PSorted,SSorted,Sorted).
	
	/* Se nessuna delle due è vuota, prendo*/
	
merge([X|Xrest],[Y|Yrest], [X|Rest]):-
	X=<Y,!,
	merge(Xrest,[Y|Yrest],Rest).
	
merge([X|Xrest],[Y|Yrest], [Y|Rest]):-
	merge([X|Xrest], Yrest,Rest).
	
split([],[],[]).
split([X],[X],[]) :- !.
split([X,Y|Rest],[X|L1],[Y|L2]):- /*Conto gli elementi della lista con length e la divido a metà. Oppure*/
	split(Rest,L1,L2).

	
/*spezza(n,l,primi,resto) -> primi sono i primi N elementi di L e Resto gli altri*/
% spezza(0,List,Primi,Resto) darà come Primi [] e Resto L
spezza(0,L,[],L).
spezza(N,[X|Rest],[X,P],R):- M is N-1, spezza(M,Rest,P,R).