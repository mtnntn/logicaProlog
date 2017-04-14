/* 
   2. Definire un predicato fact(+X,?Y), vero se Y `e il fattoriale di X
*/

/* Versione ricorsiva senza accumulatore, classica */
fact(0,1).
fact(N,F) :- fact(M,S), N is M+1, F is N*S.

/* Versione con accumulatore. */
fact_acc(Num,Fatt) :- fatt(Num,1,Fatt).

fatt_acc(Num,Fat,Fat) :- Num=0,!.
fatt_acc(Num,Fat,Res) :- 
	not(Num=0),
	M is Num-1,
	Acc is Fat*Num,
	fatt_acc(M,Acc,Res).