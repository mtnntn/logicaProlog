/* 

(a) subset(+Sub,?Set) = tutti gli elementi di Sub sono anche elementi di Set.

(b) rev(+X,?Y) = Y è la lista che contiene gli stessi elementi di X, ma in ordine inverso.

(c) del first(+X,+L,?Resto) = Resto è la lista che si ottiene da L cancellando la prima occorrenza di X.
	Fallisce se X non occorre in L.
	Attenzione: se L contiene più occorrenze di X, il backtracking non deve fornire altre soluzioni (cancellando la seconda occorrenza, la terza ecc.). 
	Usare quindi opportunamente il cut o il not.

(d) del(+X,+L,?Resto) = Resto è la lista che si ottiene da L cancellando tutte le occorrenze di X. 
	Se X non occorre in L, Resto è uguale a L stessa.
	Attenzione: il backtracking non deve generare altre soluzioni, in cui alcune occorrenze X rimangono nella soluzione.

(e) subst(+X,+Y,+L,-Nuova) = Nuova è la lista che si ottiene da L sostituendo tutte le occorrenze di X con Y. 
	Se X non occorre in L, Nuova `e uguale a L stessa.

(f) mkset(+L,-Set) = Set è una lista senza ripetizioni che contiene tutti e solo gli elementi di L 
	(senza utilizzare il predicato predefinito list to set/2).

(g) union(+A,+B,-Union) = Union è una lista (senza ripetizioni, se anche A e B sono senza ripetizioni) che rappresenta l’unione di A e B.

*/
/*
occorre_in(X,[H|_]):- X=H,!.
occorre_in(X,[_|T]):- occorre_in(X,T).

occorre_in(X,[]).
occorre_in(1,[1,2,3]). 
occorre_in(X,[1,2,3]).
*/

/*
Esempi? Set: [1,2,3].
	Sub= [].
	   = [1],
	   = [2],
	   = [3],
	   = [1,1]
	   = [1,2],
	   = [1,3],
	   = [2,1],
	   = [2,2],
	   = [2,3],
	   = [3,1],
	   = [3,2],
	   = [3,3],
	   = [1,2,3].
*/
subset(Sub,Set):- subset(Sub,Set,[]).
subset([],S,S).
subset([H|T],Set,Acc):-
	not(occorre_in(H,Acc)),
	append(Acc,[H],Res),
	subset(T,Set,Res).
subset([_|T],Set,Acc):-
	subset(T,Set,Acc).
	
/* Test:
subset([],X).
subset([1],X).
subset([1,2,3],X).
*/

/* (b) rev(+X,?Y) = Y è la lista che contiene gli stessi elementi di X, ma in ordine inverso.*/
rev(List,Rev) :- rv(Rev,List,[]).

rv(Rev,[],Rev):-!.
rv(Rev,[H|T],Acc) :- rv(Rev,T,[H|Acc]). 
/*
rev(X,[]).
rev(X,[1]).
rev(X,[1,2,3,4,5,6]).
*/

/*
(c) del first(+X,+L,?Resto) = Resto è la lista che si ottiene da L cancellando la prima occorrenza di X.
	Fallisce se X non occorre in L.
	Attenzione: se L contiene più occorrenze di X, il backtracking non deve fornire altre soluzioni (cancellando la seconda occorrenza, la terza ecc.). 
	Usare quindi opportunamente il cut o il not.
*/

del_first(ToCanc,List,NewList):- c_f(ToCanc,List,NewList,[]).

c_f(_,[],NewList,NewList):-!.
c_f(Tc,[Hl|Tl],ResList,Acc):-
	not(Tc=Hl),!, % L'elemento non mi interessa, posso aggiungerlo alla nuova lista e andare avanti.
	append(Acc,[Hl],Res),
	c_f(Tc,Tl,ResList,Res).
c_f(Tc,[Hl|Tl],ResList,Acc):- %%in questo caso Tc lo devo togliere di mezzo, ma devo aggiungere subito tutto il resto perchè voglio rimuovere solo la prima occorrenza!
	Hl=Tc, %Controllo superfluo.
	append(Acc,Tl,Res),
	c_f(Tc,[],ResList,Res).

/* Tests:
del_first(3,[],X).
del_first(3,[1,2,4,5],X).
del_first(2,[2],X).
del_first(2,[1,2,3],X).
del_first(2,[1,2,3,2,3],X).
*/
	
/*
(d) del(+X,+L,?Resto) = Resto è la lista che si ottiene da L cancellando tutte le occorrenze di X. 
	Se X non occorre in L, Resto è uguale a L stessa.
	Attenzione: il backtracking non deve generare altre soluzioni in cui alcune occorrenze X rimangono nella soluzione.
*/
del(ToCanc,List,NewList):- c_a(ToCanc,List,NewList,[]).

c_a(_,[],NewList,NewList):-!.
c_a(Tc,[Hl|Tl],ResList,Acc):-
	not(Tc=Hl), % L'elemento non mi interessa, posso aggiungerlo alla nuova lista e andare avanti.
	append(Acc,[Hl],Res),
	c_a(Tc,Tl,ResList,Res).
c_a(Tc,[Hl|Tl],ResList,Acc):- %%in questo caso Tc lo devo togliere di mezzo, ma devo aggiungere subito tutto il resto perchè voglio rimuovere solo la prima occorrenza!
	Hl=Tc, %Controllo superfluo.
	c_a(Tc,Tl,ResList,Acc).
	
/* Tests:
del(3,[],X).
del(3,[1,2,4,5],X).
del(2,[2],X).
del(2,[1,2,3],X).
del(2,[1,2,3,2,3],X).
del(2,[2,2,2,2,2],X).
*/

/*
(e) subst(+X,+Y,+L,-Nuova) = Nuova è la lista che si ottiene da L sostituendo tutte le occorrenze di X con Y. 
	Se X non occorre in L, Nuova `e uguale a L stessa.
*/

subst(ToSubs,NewVal,List,Res):- sbstall(ToSubs,NewVal,List,Res,[]).

sbstall(_,_,[],Res,Res):-!.
sbstall(ToSubs,NewVal,[H|T],Res,Acc):-
	ToSubs=H,
	append(Acc,[NewVal],App),
	sbstall(ToSubs,NewVal,T,Res,App),!.
	
sbstall(ToSubs,NewVal,[H|T],Res,Acc):-
	not(ToSubs=H), %superflua
	append(Acc,[H],App),
	sbstall(ToSubs,NewVal,T,Res,App),!.
	
subst2(_,_,[],[]):-!.
subst2(X,Y,[X|C],[Y|C1]):-subst2(X,Y,C,C1),!.
subst2(A,B,[X|C1],[X|C2]):-subst2(A,B,C1,C2).
	

/* Tests:
subst(3,1,[],X).
subst(3,1,[1,2,4,5],X).
subst(2,1,[2],X).
subst(2,1,[1,2,3],X).
subst(2,1,[1,2,3,2,3],X).
subst(2,1,[2,2,2,2,2],X).
*/

/*
(f) mkset(+L,-Set) = Set è una lista senza ripetizioni che contiene tutti e solo gli elementi di L 
	(senza utilizzare il predicato predefinito list to set/2).
*/

mkset(List,Set):-mkset(List,Set,[]).

mkset([],S,S).
mkset([H|T],Set,Acc):-
	not(member(H,Acc)),!,
	append(Acc,[H],Res),
	mkset(T,Set,Res).
mkset([_|T],Set,Acc):-
	mkset(T,Set,Acc).

/* Tests:
mkset([],X).
mkset([2],X).
mkset([1,2,3,4],X).
mkset([2,2],X).
mkset([1,2,3,2],X).
mkset([2,1,1,1,2],X).
*/

/*
(g) union(+A,+B,-Union) = Union è una lista (senza ripetizioni, se anche A e B sono senza ripetizioni) che rappresenta l’unione di A e B.

    Traccia non chiara, implementazione tipo append senza ripetizioni tra le due liste?
*/


/* Tests:
union([],[],X).
union([1],[],X).
union([],[1],X).
union([1],[1],X).
union([1],[1,2],X).
union([1,2,3],[4,5,6],X).
union([1,2,3,4,5,6],[2,4,6,8],X).
*/