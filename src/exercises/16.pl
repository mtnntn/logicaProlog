/*
16. 

Conveniamo di rappresentare gli alberi binari usando:
l’atomo empty per l’albero vuoto,
strutture della forma t(Root,Left,Right) per alberi con radice Root, sottoalbero sinistro Left, sottoalbero destro Right. 

Definire i predicati:
(a) bin height(+T,?N) = N è l’altezza dell’albero T. Il predicato fallisce se T è l’albero vuoto.
(b) reflect(T,T1) = T è l’immagine riflessa di T1. Almeno uno tra T e T1 devono essere completamente istanziati.
(c) bin size(+T,?N = N è il numero di nodi dell’albero T.
(d) bin labels(+T,-L = L è una lista di tutte le etichette dei nodi di T. 
	Se diversi nodi di T hanno la stessa etichetta, la lista L conterrà ripetizioni dello stesso elemento. 
	Gli elementi di L possono occorrere in qualsiasi ordine.
(e) balanced(+T) = l’albero T è bilanciato.
	(un albero è bilanciato se per ogni nodo n, le altezze dei sottoalberi sinistro e destro di n differiscono al massimo di 1).
(f) branch(+T,?Leaf,?Path) = Path è una lista che rappresenta un ramo dalla radice di T fino a una foglia etichettata da Leaf.
*/

/*
       ...a..._
      /       \
     b         f
     |        / \
     c       g   i
    / \      |
   d   e     h
*/
albero(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty)))).

/*
(a) bin height(+T,?N) = N è l’altezza dell’albero T. Il predicato fallisce se T è l’albero vuoto.
*/

bin_height(t(_,empty,empty),0).
bin_height(t(_,Left,empty),H):- bin_height(Left,X), H is X+1.
bin_height(t(_,empty,Right),H):- bin_height(Right,X), H is X+1.
bin_height(t(_,Left,Right),H):- bin_height(Left,L), bin_height(Right,R), L1 is L+1, R1 is R+1, max(L1,R1,H).

/*
(b) reflect(T,T1) = T è l’immagine riflessa di T1. Almeno uno tra T e T1 devono essere completamente istanziati.
*/

reflect(t(Key,empty,empty),t(Key,empty,empty)).
reflect(t(Key, Left,empty),t(Key,empty, Left)).
reflect(t(Key,empty,Right),t(Key,Right,empty)).
reflect(t(Key, Left,Right),t(Key,Right, Left)).

/* Tests:
  a
 / \
_  _
reflect(t(a,empty,empty),Reflection).
t(a,empty,empty)
  a
 / \
b  _
reflect(t(a,t(b,empty,empty),empty),Reflection).
t(a,empty,t(b,empty,empty))
    a
   / \
  b   d
reflect(t(a,t(b,empty,empty),t(d,empty,empty)),Reflection).
t(a,t(d,empty,empty),t(b,empty,empty))
    a
   / \
  b   
 / \
_   c
reflect(t(a,t(b,empty,t(c,empty,empty)),empty),Reflection).
t(a,empty,t(b,t(c,empty,empty),empty))
    a
   / \
  b   d
 / \
_   c
reflect(t(a,t(b,empty,t(c,empty,empty)),t(d,empty,empty)),Reflection).
t(a,t(d,empty,empty),t(b,t(c,empty,empty),empty))
*/

/*
(c) bin size(+T,?N) = N è il numero di nodi dell’albero T.
*/

bin_size(t(_,empty,empty),1).
bin_size(t(_,Left,empty),N):- bin_size(Left, M), N is M+1.
bin_size(t(_,empty,Right),N):- bin_size(Right, M), N is M+1.
bin_size(t(_,Left,Right),N):- bin_size(Left, M),bin_size(Right, M2), N is M+M2+1.

/*
(d) bin labels(+T,-L) = L è una lista di tutte le etichette dei nodi di T. 
	Se diversi nodi di T hanno la stessa etichetta, la lista L conterrà ripetizioni dello stesso elemento. 
	Gli elementi di L possono occorrere in qualsiasi ordine.
*/
bin_labels(t(Key,empty,empty),[Key]):-!.
bin_labels(t(Key,Left,empty) ,[Key|Tail]):- bin_labels(Left,Tail),!.
bin_labels(t(Key,empty,Right),[Key|Tail]):- bin_labels(Right,Tail),!.
bin_labels(t(Key,Left,Right) ,[Key|Tail]):- bin_labels(Left,FL), bin_labels(Right,RL), append(FL,RL,Tail).
/* Tests:
bin_labels(t(a,empty,empty),X).
bin_labels(t(a,t(b,empty,empty),empty),X).
bin_labels(t(a,t(b,empty,t(c,empty,empty)),empty),X).
bin_labels(t(a,t(b,empty,t(c,empty,empty)),t(l,empty,empty)),X).
bin_labels(t(a, t(b, t(c, t(d, empty, empty), t(e, empty, empty)), empty), t(f, t(g, t(h, empty, empty), empty), t(i, empty, empty))),Keys).
*/

/*
(e) balanced(+T) = l’albero T è bilanciato.
	(un albero è bilanciato se per ogni nodo n, le altezze dei sottoalberi sinistro e destro di n differiscono al massimo di 1).
*/
delta(X,Y):- Diff is X-Y, (Diff =< 1; Diff >= -1).

balanced(t(_,empty,empty)):- !.
balanced(t(_,Left ,empty)):- 
	bin_height(Left ,LL), 
	LL=<1, 
	balanced(Left),!.
balanced(t(_,empty,Right)):- 
	bin_height(Right,RL), 
	RL=<1, 
	balanced(Right),!.
balanced(t(_,Left ,Right)):- 
	bin_height(Left,LL), 
	bin_height(Right,RL), 
	delta(LL,RL), 
	balanced(Left), 
	balanced(Right).

/* Tests
  a
 / \
_  _
balanced(t(a,empty,empty)).
  a
 / \
b  _
balanced(t(a,t(b,empty,empty),empty)).
    a
   / \
  b   
 / \
_   c
balanced(t(a,t(b,empty,t(c,empty,empty)),empty)).

    a
   / \
  b   d
 / \
_   c
balanced(t(a,t(b,empty,t(c,empty,empty)),t(d,empty,empty))).
*/

/*
(f) branch(+T,?Leaf,?Path) = Path è una lista che rappresenta un ramo dalla radice di T fino a una foglia etichettata da Leaf.
*/

branch(Tree,Leaf,Path) :- branch(Tree,Leaf,Path,[]).

branch(t(Key,_,_),Key,Res,Acc):-append(Acc,[Key],Res),!. %giusto per mettere anche la foglia
branch(t(Key,empty,Right),Goal,Res,Acc):-
	append(Acc,[Key],Marked),
	branch(Right,Goal,Res,Marked),!.
branch(t(Key, Left,empty),Goal,Res,Acc):-
	append(Acc,[Key],Marked),
	branch(Left,Goal,Res,Marked),!.
branch(t(Key, Left,Right),Goal,Res,Acc):-
	append(Acc,[Key],Marked),
	(branch(Left,Goal,Res,Marked);branch(Right,Goal,Res,Marked)).
/* Tests

l'albero è quello descritto dal predicato albero/1.
       ...a..._
      /       \
     b         f
     |        / \
     c       g   i
    / \      |
   d   e     h
_  _
branch(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty))),a,Path).
branch(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty))),b,Path).
branch(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty))),f,Path).
branch(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty))),e,Path).
branch(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty))),x,Path).
branch(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty))),X,[a]).
branch(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty))),X,[a,f,g]).
branch(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty))),X,[a,f,h]).
branch(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty))),d,[a,b,c,d]).
branch(t(a, t(b, t(c,t(d,empty,empty),t(e,empty,empty)),empty), t(f,t(g,t(h,empty,empty),empty),t(i,empty,empty))),e,[a,b,c,d]).
*/