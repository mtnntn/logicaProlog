/*
15. Definire un predicato search subset(+IntList,+N,?Set), 
        IntList è una lista di interi positivi e N un intero positivo, 
	che sia vero se Set é una lista rappresentante un sottoinsieme di IntList, 
	tale che la somma degli elementi in Set è uguale a N. 
	Si può assumere che IntList sia senza ripetizioni. 

	Ad esempio:
		?- search_subset([4,8,5,3,9,6,7],9,Subset).
			Subset = [4, 5] ;
			Subset = [3, 6] ;
			Subset = [9] ;
			false.
*/
search_subset(List,TotSum,Subset):- search_subset(List,TotSum,Subset,[]).

search_subset(_,0,Subset,Subset):-!.
search_subset([H|T],Ct,R,Sub):-
	H=<Ct,
	NCt is Ct-H,
	search_subset(T,NCt,R,[H|Sub]).
search_subset([_|T],Tot,R,Sub):-
	search_subset(T,Tot,R,Sub).
	