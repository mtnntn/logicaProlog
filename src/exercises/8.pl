/*
Definire un predicato suffisso(Suf,L) = la lista Suf è un suffisso della lista L. 
Ad esempio, i suffissi della lista [1,2,3] sono: 
la lista vuota [] e le liste [3], [2,3] e [1,2,3] stessa.
*/

/*
   Soluzione con accumulatore, basta che reverso la stringa e riuso prefisso scambiando
	la posizione di H e Acc nell'append.
*/

suffisso(Suff,List):- 
	reverse(List,R),
	suff(Suff,R,[]).

suff(S,_,S).
suff(S,[H|T],Acc):-
	append([H],Acc,Res), 
	suff(S,T,Res).
	
/* Soluzione Ricorsiva senza accumulatore. */



/* 
Tests:

suffisso(X,[]).
suffisso(X,[1]).
suffisso(X,[1,2,3,4,5,6]).

*/
