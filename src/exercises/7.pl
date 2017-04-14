/*

Definire un predicato prefisso(Pre,L) = la lista Pre `e un prefisso della
lista L. Ad esempio, i prefissi della lista [1,2,3] sono: la lista vuota [] e
le liste [1], [1,2] e [1,2,3] stessa.

*/


/* 
Praticamente, per ogni elemento della lista, vado a costruire altre liste che di volta in volta
considerano un elemento in più rispetto alla precedente.
*/

prefisso(Pre,List) :- prefisso(Pre,List,[]).

prefisso(Pre,_,Pre).
prefisso(Pre,[H|T],Acc):-
	append(Acc,[H],Res),
	prefisso(Pre,T,Res).
	
/* Versione ricorsiva senza accumulatore. */

prefisso2([],_).
prefisso2([H|Pre],[H|T]):- prefisso(Pre,T).
	
	
/* Tests:

prefisso(X,[]).
prefisso(X,[1]).
prefisso(X,[1,2,3,4,5,6]).

*/