/*

Avendo definito
pari(X) :- 0 is X mod 2.

definire il predicato split(+L,?P,?D) = se L `e una lista di interi, P `e la
lista contenente tutti gli elementi pari di L e D tutti quelli dispari.
(nello stesso ordine in cui occorrono in L).
*/

pari(X) :- 0 is X mod 2.

split(List,Pari,Dispari):- split_acc(List,[],[],Pari,Dispari).

split_acc([],Pari,Dispari,Pari,Dispari).

split_acc([Current|T],PariAcc,DispariAcc,Pari,Dispari) :-
	pari(Current),!,
	append([Current],PariAcc,Result),
	split_acc(T,Result,DispariAcc,Pari,Dispari).
	
split_acc([Current|T],PariAcc,DispariAcc,Pari,Dispari) :-
	not(pari(Current)), %superflua
	append([Current],DispariAcc,Result),
	split_acc(T,PariAcc,Result,Pari,Dispari).

/* Se non volessi usare l'accumulatore, cosa potrei inventarmi? 
	Potrei andare ad unificare la testa della funzione andando ad aggiungere l'elemento corrente
	alla lista dei pari o dei dispari in base al suo valore ed andare a*/
split2([],[],[]).

split2([Current|T],[Current|Pari],Dispari) :-
	pari(Current),!,
	split2(T,Pari,Dispari).
	
split2([Current|T],Pari,[Current|Dispari]) :-
	not(pari(Current)),
	split2(T,Pari,Dispari).
	
/* Tests:
	
split([],P,D).
split([1], P, D).
split([2], P, D).
split([1,2,3,4,5,6,7,8,9],P,D).

*/
