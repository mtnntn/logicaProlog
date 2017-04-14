/* Reigns(A,B,C) :- A reigns from year A to year B */
reigns(rhodri,844,878).
reigns(anarawd,878,916).
reigns(hywel_dda, 916, 950).
reigns(lago_ap_idwal, 950, 979).
reigns(hywel_ap_ieuaf, 979, 985).
reigns(cadwallon, 985, 986).
reigns(maredudd, 986, 999).

/* prince(A,Y( :- A was in charge during year Y */
prince(Aprince,InYear):-
	reigns(Aprince,StartYear,EndYear),
	InYear>=StartYear,
	InYear=<EndYear.
/* Usefull queries:
?- prince(cadwallon, 986).
yes
?- prince(rhodri, 1979).
no
?- prince(X, 900).
X=anarawd
yes
?- prince(X, 979).
X=lago_ap_idwal
X=hywel_ap_ieuaf
yes
*/