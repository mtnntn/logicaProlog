/*
Definire un predicato maxlist(+L,?N) (dove L `e una lista di numeri),
vero se N e’ il massimo elemento della lista L. Fallisce se L `e vuota.
*/

/* Si suppone che non sia possibile, ovviamente, utilizzare il predicato max_list(List,X)
   nativo del prolog.

*/

/* Versione Con Accumulatore */
maxList([H|T],Max) :- findMax(T,H,Max).

findMax([],RelMax,RelMax).

findMax([Current|T],RelMax,Max):-
	RelMax>=Current,
	findMax(T,RelMax,Max).

findMax([Current|T],RelMax,Max):- 
	RelMax < Current, 
	findMax(T,Current,Max).
	
/* Se volessi fare il tutto sfruttando l'unificazione e senza usare l'accumulatore?*/
maxList2([Uno],Uno).

maxList2([Current|T],RelMax):-
	maxList2(T,RelMax),
	RelMax>=Current.

maxList2([Current|T],Current):-
	maxList2(T,RelMax),
	RelMax<Current.
	

% maxList([2],X).
% maxList([1,2,3,4,5],X).
% maxList([5,4,3,2,1],X).
% maxList([4,3,23,3,1,4,26,3,4,4],X).
