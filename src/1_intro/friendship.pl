friend(antonio, angelo).
friend(antonio, egidio).
friend(antonio, federico).
friend(antonio, francesco).
friend(antonio, franco).
friend(antonio, giacomo).
friend(antonio, marco).
friend(antonio, martina).
friend(antonio, morena).
friend(antonio, laura).
friend(antonio, ludovica).
friend(antonio, sara).
friend(antonio, silvia).
friend(antonio, umberto).

friend(umberto, alfonso).
friend(umberto, emilio).
friend(umberto, filippo).
friend(umberto, paoletto).
friend(umberto, peppino).
friend(umberto, antonio).

friend(laura, carlotta).
friend(laura, simone).
friend(laura, roberta).
friend(laura, wismi).

friend(silvia, antonio).
friend(silvia, alessia).
friend(silvia, violetta).

friend(morena, giorgia).
friend(morena, michela).
friend(morena, sam).

/* X is different from Y */
diff(X,Y) :- not(X=Y).

/* know(X,Y) :- X knows Y */
know(X,Y) :- diff(X,Y), (friend(X,Y);friend(Y,X)). %if X is friend with Y or if Y is friend with X and
know(X,Y) :- friend(X,Z), friend(Z,Y). %if X is friend with Z and Z is friend with Y.

/* know(peppino,antonio) :- friend(peppino,umberto), friend(umberto,antonio) ? 
	fallisce perchè non è detto che peppino sia amico con umberto!
*/
