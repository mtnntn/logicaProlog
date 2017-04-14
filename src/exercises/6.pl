/*

Scrivere un programma che risolva il problema delle torri di Hanoi: il
predicato principale hanoi(N) risolve il problema con N torri, spostando
N dischi dal piolo A al piolo B, usando C come appoggio. Per farlo,
richiama il predicato a 4 argomenti hanoi(N,Start,Goal,Appoggio) che
sposta N dischi dal piolo Start al piolo Goal, usando Appoggio come piolo
ausiliario. Lo spostamento di un singolo disco dal piolo Start al piolo Goal
`e rappresentato dalla stampa su video del messaggio: “Sposto un disco da
Start a Goal”.
Ad esempio si avr`a:
?- hanoi(3).
Sposto un disco da A a B
Sposto un disco da A a C
Sposto un disco da B a C
Sposto un disco da A a B
Sposto un disco da C a A
Sposto un disco da C a B
Sposto un disco da A a B
Per la stampa del messaggio, si vedano i predicati predefiniti write e
writeln. Pu`o essere inoltre utile utilizzare il predicato predefinito atomic
list concat, che consente di costruire la concatenazione degli atomi
in una stringa. Ad esempio:
1
?- Start=’A’, Goal=’B’,
atomic_list_concat([’Sposto un disco da’,Start,’a’,Goal],’ ’,Out).
Start = ’A’,
Goal = ’B’,
Out = ’Sposto un disco da A a B’.

*/