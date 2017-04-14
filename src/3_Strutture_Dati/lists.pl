/*Basics Head and tails op */
p([1,2,3]).
p([the,cat,sat,[on,the,mat]]).

/* member(?Elem, ?List) :- true iff Elem is contained in List */
/* implementation of member */
mem(X,[X|_]).
mem(X,[_|Tail]) :- mem(X,Tail).

/* len(?List, ?Int):-true if List has length Int*/
/* implementation of length */
len([],0).
len([_|Tail],L) :- len(Tail,NL), L is NL+1.

/* tot_len(?List, ?Int):-true if List has length Int*/
tot_len([],0).
tot_len([Head|Tail],L) :- len(Head,HL), tot_len(Tail,TL), L is HL+TL.

/* lcat(?List1, ?List2, ?List1AndList2) :- true if List1AndList2 is the concatenation of List1 and List2 */
/* implementation of append */
lcat([],X,X).
lcat([H1|T1],L2,[H1|TR]) :- lcat(T1,L2,TR).


/* lst(L,X) = X is the last element of L */
/* implementation of last */
lst(L,X):-append(_,[X],L).

/* lcat3 = concat three lists */
lcat3(L1,L2,L3,Result) :-
	append(L1,L2,L),
	append(L,L3,Result).
	
/* always_better(L1,L2):- true if Every Element in L1 is >= of L2.*/
always_better([],[]).
always_better([_],[]).
always_better([H1|T1],[H2|T2]):-
	H1>=H2,
	always_better(T1,T2).
