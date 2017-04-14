/* Febbraio 2016 

Un grafo con etichette sugli archi si pu`o rappresentare in Prolog mediante
un insieme di fatti della forma 
arc(X,A,Y) (esiste un arco da X a Y etichettato da A). 

L’etichetta pu`o rappresentare un’azione che causa la transizione tra i due nodi. 

Definire un predicato Prolog actions(+Start,+Goal,?Arcs),
vero se Arcs `e la lista delle etichette degli archi di un cammino senza
ripetizioni di nodi da Start a Goal nel grafo definito dalla procedura arc
(attenzione ai cicli!).

Ad esempio, se il grafo `e rappresentato dal seguente insieme di fatti

arc(1,a,2). arc(1,b,3). arc(1,c,4). arc(2,a,6).
arc(3,b,5). arc(3,c,5). arc(4,b,1). arc(4,c,6).
arc(5,c,4). arc(6,b,5).

il goal actions(3,6,Arcs) avra successo con 
Arcs = [b,c,c], oppure
Arcs = [c,c,c] (entrambe corrispondenti al cammino 3-5-4-6), oppure
Arcs = [b,c,b,a,a] o Arcs = [c,c,b,a,a] 

(che corrispondono entrambe al cammino 3-5-4-1-2-6).
*/



arc(1,a,2). 
arc(1,b,3). 
arc(1,c,4). 
arc(2,a,6).
arc(3,b,5). 
arc(3,c,5). 
arc(4,b,1). 
arc(4,c,6).
arc(5,c,4).
arc(6,b,5).

/* Dovrei fare la ricerca di cammino in un grafo tenendo traccia dei nodi già visitati, con il vincolo di avere un nodo di partenza e un nodoo di arrivo e voglio un cammino che mi dica come arrivare da a a b.
Ho uno start un goal e un path, però devo portarmi dietro i visistati.
*/

path(Start,Goal,Path):-
	path(Start,Goal,Path,[]).
	
 /*path(N,G,P,Visited) :- Mi chiedo quando termino con successo, quando termino con fallimento, quando devo andare avanti */

path(N,N,[N],_). /* Ho finito in quanto */
path(N,G,[N|Path],Visited) :-
	not(member(N,Visited)), % vado avanti solo se s non è membro di visited.
	%devo cercare un successore di s, come lo cerco? con arch
	arc(N,_,Succ), 
	path(Succ,G,Path,[N|Visited]).

/* IO VOGLIO SAPERE CHI È L'ARCO, COSA VA CAMBIATO?

  Se il mio cammino è costituito dal arco
*/

path_a(Start,Goal,Path):-
	path_a(Start,Goal,Path,[]).

path_a(N,N,[],_). 
path_a(N,G,[A|Path],Visited) :- 
	not(member(N,Visited)), 
	arc(N,A,Succ), %sto su n vado sul successore percorrendo l'arco che si chiama A
	path_a(Succ,G,Path,[N|Visited]).