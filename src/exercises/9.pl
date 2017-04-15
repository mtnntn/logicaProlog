/*
Definire un predicato sublist(S,L) = S è una sottolista di L costituita da elementi contigui in L. 
Ad esempio, le sottoliste di [1,2,3] sono: 
la lista vuota [],
le liste [1], [2], [3], [1,2], [2,3] e [1,2,3] stessa.
*/

/* */
%sublist(Sublist,List):- sbl(Sublist,List,[]).

%sbl([],[],[]).
%sbl(S,[],S).
%sbl(Sub,[H|T],Acc):-
%	sbl(Sub,T,[H|Acc]).




/* 
Tests:

sublist(X,[]).
sublist(X,[1]).
sublist(X,[1,2,3,4,5,6]).

*/
