/* efinire un predicato fact(+X,?Y), vero se Y `e il fattoriale di X. */

%fact(0,1).
fact(0,1).
fact(Number,Acc) :- not(Number=0), MinusOne is Number-1, fact(MinusOne,NewSum), Acc is Number*NewSum.

%fact_cut(0,1).
fact_cut(0,1):- !.
fact_cut(Number,Acc) :- MinusOne is Number-1, fact_cut(MinusOne,NewSum), Acc is Number*NewSum, writeln(Number), writeln(MinusOne), writeln(NewSum).