
arc(a,b).
arc(a,c).
arc(b,a).
arc(c,d).
arc(d,b).

/* path(X,Y,P) = P è cammino da X a Y */
/* Come posso fare per evitare di incappare in cicli? o mi porto dietro una lista di nodi visitati o utilizzo dynamic */
/* Devo definire due funzioni: main che fa cose e la procedura che pulisce visited.*/
/*
pat(X,Y,P) :-
	X=y, p=[x] 
	
	*/
	
	
path(X,X,[X]).
path(X,Y,[X|P]) :-  /* Cerco successore di x e p lo faccio partire da li */
	arc(X,Z),
	path(Z,Y,P).
	
/* Se ci sono cicli devo fallire. devo portarmi dietro i visited

path(X,X,[X]).
path ( X,Y,[X|P]) :-  Cerco successore di x e p lo faccio partire da li 
	arc(X,Z),
	not(visited(Z)),
	assert(visited(Z)),
	path(Z,Y,P). 
*/