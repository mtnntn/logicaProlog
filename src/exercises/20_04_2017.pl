/*

Parziale del 20/04/2017

Un grafo si pu`o rappresentare mediante un insieme di fatti della forma
arc(X,Y), che definiscono la relazione binaria “esiste un arco da X a Y”.

Definire un predicato path(?Start,?Goal,?Path,?Max) = Path è una lista che rappresenta un cammino da Start a Goal nel grafo definito nel programma con un numero di passi <= Max.
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

path(Start,Goal,Path,Max):- N is Max+1,path(Start,Goal,Path,[],N).

path(_,G,Res,[H|T],_):- G=H, reverse([H|T],Res).
path(S,G,Res,[],Max):- 
	arc(S,X),
	N is Max-1,
	N>0, 
	path(S,G,Res,[X,S],N).
path(S,G,Res,[H|T],Max):- 
	arc(H,X),
	N is Max-1,
	N>0,
	append([X],[H|T],NP),
	path(S,G,Res,NP,N).
