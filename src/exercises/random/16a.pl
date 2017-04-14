/*
Conveniamo di rappresentare gli alberi binari usando l’atomo empty per l’albero vuoto e 
strutture della forma t(Root,Left,Right) per alberi con radice Root, sottoalbero sinistro Left e sottoalbero destro Right. 
Definire i predicati:
(a) bin height(+T,?N) = N `e l’altezza dell’albero T. 
	Il predicato fallisce se T `e l’albero vuoto.
*/

h(t(_,empty,empty),0).
h(t(_,empty,T),N):-
	h(T,M), N is 1+M.
h(t(_,T,empty),N):-
	h(T,M), N is 1+M.
h(t(_,L,R),N):-
	h(L,M1),
	h(R,M2),
	M is max(M1,M2),
	N is 1+M.
	
/*
(d) bin labels(+T,-L) = L `e una lista di tutte le etichette dei nodi di
T. Se diversi nodi di T hanno la stessa etichetta, la lista L conterr`a
ripetizioni dello stesso elemento. Gli elementi di L possono occorrere
in qualsiasi ordine.

*/

labels(empty,[]).
labels(t(X,L,R),[X|Bo]):-
/*Cerco tutte etichette di r tutte di l cercare quelle piene e metterci dentro x. metterci dentro x lo posso fare nella testa della clausola e quindi trattarlo con [X|Bo] dove Bo è la concatenazione delle etichette di L ed R*/
	labels(L,Qualchecosa),
	labels(R,Pippo),
	append(Qualchecosa,Pippo,Bo).
	
/* IN POSTORDINE */
labels(empty,[]).
labels(t(X,L,R),[X|Bo]):-
	labels(L,Qualchecosa),
	labels(R,Pippo),
	append(Pippo,[x],Pluto).
	

	