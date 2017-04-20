/*

Un grafo si pu`o rappresentare mediante un insieme di fatti della forma
arc(X,Y), che definiscono la relazione binaria “esiste un arco da X a Y”.

Ad esempio:
arc(a,b).
arc(a,e).
arc(b,a).
arc(b,c).
arc(c,c).
arc(c,d).
arc(d,c).
arc(d,b).
arc(e,c).

Definire un predicato path(?Start,?Goal,?Path) = Path è una lista che rappresenta un cammino da Start a Goal nel grafo definito nel programma.

Suggerimento: utilizzare un predicato ausiliario a quattro argomenti path(?Start,?Goal,?Path,+Visited) = 
	Path è una lista che rappresenta un cammino da Start a Goal che non passa per nessuno dei nodi della lista Visited.
*/

arc(a,b).
arc(a,e).
arc(b,a).
arc(b,c).
arc(c,c).
arc(c,d).
arc(d,c).
arc(d,b).
arc(e,c).

path(Start,Goal,Path):- path(Start,Goal,Path,[],[]).

%path(_,G,Res,[H|T],_):- append([G,H],T,Res).

path(_,G,Res,[H|T],_):- G=H, reverse([H|T],Res).
path(S,G,Res,[],[]):- 
	arc(S,X), 
	path(S,G,Res,[X,S],[(S,X)]).
path(S,G,Res,[H|T],Visited):- 
	arc(H,X), 
	not(member((H,X),Visited)),
	append([(H,X)],Visited,NV),
	append([X],[H|T],NP),
	path(S,G,Res,NP,NV).
