/* fuel_consumed(X,[]):- Car X fuel consumption on each route.*/
fuel_consumed(  waster, [ 3.1, 10.4, 15.9, 10.3]).
fuel_consumed( guzzler, [ 3.2,  9.9, 13.0, 11.6]).
fuel_consumed(prodigal, [ 2.8,  9.8, 13.1, 10.4]).
fuel_consumed(   panda, [15.0, 15.0, 15.0, 15.0]).

/* equal_or_better_consumption(C1,C2):- true if C1 is >= C2+5%*/
equal_or_better_consumption(Better,Than):-
	write("\nCompare "), write(Better), write(", "), write(Than),
	Threshoold is (Better+Than)/20,
	C2 is Than + Threshoold,
	Better < C2.

strict_comp([],[]).
strict_comp([Ha|Ta], [Hb|Tb]) :-
	equal_or_better_consumption(Ha, Hb),
	strict_comp(Ta, Tb). 

compare_consumption(C1,C2):-
	write("\nCompare Car's consumptions: \n"),writeln(C1),writeln(C2),
 	strict_comp(C1,C2).
 	
is_better_car(Car1,Car2):-
	write("\nCompare cars: "), write(Car1), write(", "), write(Car2),
	fuel_consumed(Car1, X),
	fuel_consumed(Car2, Y),
	compare_consumption(X,Y).