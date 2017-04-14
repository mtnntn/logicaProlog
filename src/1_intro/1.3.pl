/*
This exercise has been inspired by one in Robert Kowalski's book Logic
for Problem Solving, published by North Holland in 1979. Suppose someone has
already written Prolog clauses that define the following relationships:

father(X, Y). % x is father of y
mother(X, Y). % x is mother of y
male(X).      % x is female 
female(X).    % x is female
parent(X, Y). % x is a parent of y
diff(X, Y).   % x is different from y 

The exercise is to write Prolog clauses to define the following relationships:

is_mother(X) % X is a mother
is_father(X) % X is a father
is_son(X)    % X is a son
sister_of(X, Y) % X is a sister of Y
grandpa_of(X, Y) % X is a grandfather of Y
sibling(X, Y) % X is a sibling of Y
*/

% men
male(antonio).
male(francesco).
male(nicola).
male(bernardo).
male(egidio).
male(antonio_j).
male(francesco_j).
male(carmelo).
male(francesco_l).
male(marco).
male(gabriele).
male(giovanni).
male(antonio_f).
% women
female(maria).
female(luigina).
female(egidia).
female(fortuna).
female(nicolina).
female(annamaria_f).
female(sara).
female(ornella).
female(annamaria_p).
female(francesca).
female(barbara).
female(gerardina).
female(daniela).
female(donatella).
female(mimma).
% fathers
father(antonio, nicola).
father(antonio, egidia).
father(francesco, fortuna).
father(francesco, nicolina).
father(francesco, bernardo).
father(francesco, egidio).
father(nicola, antonio_j).
father(nicola, francesco_j).
father(antonio_f, annamaria_f).
father(antonio_f, carmelo).
father(egidio, francesco_l).
father(egidio, ornella).
father(egidio, sara).
father(bernardo, annamaria_p).
father(bernardo, francesca).
father(bernardo, barbara).
father(bernardo, gerardina).
father(bernardo, marco).
father(giovanni, gabriele).
father(giovanni, daniela).

% mothers
mother(maria,nicola).
mother(maria,egidia).
mother(luigina,fortuna).
mother(luigina, nicolina).
mother(luigina, bernardo).
mother(luigina, egidio).
mother(fortuna, antonio_j).
mother(fortuna, francesco_j).
mother(egida, annamaria_f).
mother(egida, carmelo).
mother(mimma, francesco_l).
mother(mimma, ornella).
mother(mimma, sara).
mother(donatella, annamaria_p).
mother(donatella, francesca).
mother(donatella, barbara).
mother(donatella, gerardina).
mother(donatella, marco).
mother(nicolina, gabriele).
mother(nicolina, daniela).

/* diff(X,Y) : X is different from Y */
diff(X,Y) :- not(X=Y).

%parent(X,Y) :- father(X,Y); mother(X,Y).
parent(X,Y) :- male(X), father(X,Y), diff(X,Y).
parent(X,Y) :- female(X), mother(X,Y), diff(X,Y).

/* is_father(X) : X is a father */
is_father(X) :- male(X), parent(X,Y), diff(X,Y). % X è un padre

/* is_mother(X) : X is a mother */
is_mother(X) :- female(X), parent(X,Y), diff(X,Y). % X è una madre

/* is_son(X) : X is a son */
is_son(X) :- male(X), parent(Y,X), diff(X,Y).
is_son(X) :- female(X), parent(Y,X), diff(X,Y).

/* sister_of(X,Y) : X is a sister of Y */
sister_of(X,Y):- female(X), father(Z,X), father(Z,Y), mother(H,X), mother(H,Y), diff(X,Y), diff(H,Z).

/* sibling_of(X,Y) : X is a sibling of Y */
sibling_of(X,Y) :- male(X), father(Z,X), father(Z,Y), mother(H,X), mother(H,Y), diff(X,Y), diff(H,Z). 

/* grandpa_of(X,Y) : X is a grandfather Y */
grandpa_of(X,Y) :- male(X), father(X,Z), parent(Z,Y), diff(X,Y).

/* grandma_of(X,Y) : X is a grandmother of Y */
grandma_of(X,Y) :- female(X), mother(X,Z), parent(Z,Y), diff(X,Y).

/* direct_aunt(X,Y) : X is an aunt of Y */
direct_aunt(X,Y) :- sister_of(X,Z), parent(Z,Y).

/* direct_uncle(X,Y) : X is an uncle of Y */
direct_uncle(X,Y) :- sibling_of(X,Z), parent(Z,Y).