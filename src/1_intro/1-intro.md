ATTENZIONE: 
La seguente guida ricalca il testo e gli esempi del libro:
"Programming in Prolog: using the ISO standard. W.F. Clocksin, C.S. Mellish. 5th ed. p.cm."
Il materiale presente in questo testo è una traduzione di alcuni punti del testo sopra indicato che ho trovato di aiuto durante l'approccio al Prolog per un corso universitario.
Non mi assumo pertanto nessuna responsabilità sulla correttezza delle traduzioni, degli esempi e del materiale in generale.

##Prolog

Prolog è un linguaggio di programmazione che ha iniziato a muovere i primi passi intorno agli anni 70.
È scelto da molti programmatori per lo sviluppo di applicativi che fanno uso del calcolo simbolico: database relazionali, logica matematica, problem solving a livello astratto, analisi del linguaggio naturale etc.

Coloro che si avvicinano per la prima volta all'utilizzo di questo linguaggio trovano molto diversa l'attività di scrittura di un programma in Prolog rispetto alla più standard operazione di implementazione di un algoritmo.
Un programmatore Prolog, infatti, deve concentrarsi su quali relazioni formali e quali oggetti hanno a che fare con il problema e quali relazioni sussistono (ovvero sono true).
L'approccio da utilizzare quando si programma in prolog è quello di prestare più attenzione possibile alla descrizione di fatti noti e relazioni piuttosto che al problema in se o alla sequenza di passi da effettuare per risolvere il problema.

### Oggetti e Relazioni
Prolog è un linguaggio di programmazione, utilizzato per risolvere problemi, che coinvolge vari oggetti e le relative relazioni che intercorrono fra quest'ultimi.

A titolo di esempio, la frase "Jhon possiede il libro" indica che c'è una relazione di possesso fra un oggetto "jhon" ed un altro oggetto "il libro".

In prolog la parola "oggetto" non ha nulla a che fare con le strutture dati cui siamo abituati nei classici linguaggi di programmazione tipo java, c etc, piuttosto, si riferisce a qualcosa che possiamo rappresentare utilizzando dei TERMINI.

Prolog rappresenta anche un interpretazione pratica ed efficiente di alcuni aspetti della cosiddetta "esecuzione intelligente" dei programmi. Tra questi aspetti ci si riferisce sicuramente al non determinismo e al paralellismo, ad esempio.

Prolog fornisce un unica struttura dati uniforme, cui ci si riferisce con la dicitura "TERMINE", dai quali tutti i dati, anche il programma Prolog in sè, è costruito.

Un programma in prolog è costituito da un set di clausole.
Ogni Clausola rappresenta un FATTO riguardante una data informazione o una REGOLA che indica il modo in cui soluzioni collegate possono essere ricavate da tale fatto.

Programmare in Prolog non significa solamente schematizzare il significato di una certa relazione ma anche capire come trovare oggetti che soddisfano tale relazione.

## Programmare in Prolog

Un programma prolog si compone essenzialmente di 3 fasi:

- Specifica di alcuni FATTI riguardanti gli oggetti e le relative relazioni.

- Specifica di alcune REGOLE riguardanti gli oggetti e le relative relazioni.

- Effettuare DOMANDE al programma sugli oggetti e le relative relazioni.

###FATTI
Supponiamo che vogliamo informare Prolog del fatto che "Jhon likes Mary".

Questo FATTO è composto da due oggetti, (Jhon e Mary), e una relazione chiamata "likes".

Questo fatto è esprimibile attraverso questa sintassi: `likes(john, mary).` .

Ci sono alcune regole importanti:
- I nomi di tutte le relazioni e gli oggetti devono iniziare ocn un carattere minuscolo. (likes, john, mary) .

- Le relazioni vanno indicate per prime, (likes), mentre al loro interno, racchiuse tra parentesi tonde, vanno indicati gli oggetti separati da una virgola.

- È necessario un punto alla fine di ogni fatto.

Quando si definisce un fatto bisogna prestare molta attenzione agli oggetti che sono inseriti tra le parentesi.
L'ordine è arbitrario, ma una volta deciso tale ordinte bisogna essere poi coerenti in futuro.

Ad esempio, tornando all'esempio di `likes(john, mary). ` , abbiamo definito che `likes(A,B).` ha l'interpretazione di "all'oggetto A piace l'oggetto B". Nulla è detto sul fatto che ad, esempio, al secondo oggetto possa piacere il primo.

### DOMANDE
Una volta che abbiamo inserito alcuni fatti possiamo chiedere a prolog qualcosa: l'operazione di inserire fatti, dunque, ha lo scopo di descrivere il mondo nel quale Prolog cercherà le risposte alle domande che verranno poste.

In prolog una domanda somiglia molto ad un fatto, tranne per il fatto che inseriamo prima di esso un simbolo speciale: `?- ` .

Eseguendo la seguente domanda `?- likes(mary,john)` prolog risponderà "false", poichè non sa effettivamente se a mary piace john, non lo abbiamo informato abbastanza bene per fargli capire se effettivamente a mary piaccia john.
Se invece eseguissimo la seguente domanda `?- likes(john, mary)` prolog risponderà true, perchè effettivamente gli abbiamo comunicato che a john piace mary.

### VARIABILI
Abbiamo detto che Prolog è uno strumento capace non solo di indagare le relazioni che ci sono tra gli oggetti ma anche trovare soluzioni che permettano di soddisfarne una.

Se nel caso precedente chiedessimo a prolog `?- likes(john, X) . ` lui risponderebbe `X=mary`, poichè effettivamente a john piace mary.

Se avessimo informato prolog del fatto che a john piacesse anche silvia, ovvero avessimo inserito anche il fatto `likes(john,silvia)`, come avrebbe risposto alla domanda ?

Avrebbe risposto sempre con `X=mary`, tuttavia sarebbe stato possibile chiedergli di cercare un altro risultato semplicemente andando a digitare il comando ` ; `. Così facendo, oltre a `X=mary ;`, avrebbe sputato fuori anche `X=silvia`.

### CONNETTIVI
Se volessimo chiedere a Prolog se a john piace mary e a mary piace john, come avremmo potuto fare?
Sicuramente avremmo potuto chiedere le due cose separatamente avremmo potuto inserire i due fatti:
```
:-likes(john,mary).
true.
:-likes(mary,john).
false.
```
La domanda è questa : "è possibile farlo direttamente, utilizzando una sorta di "and" logico? ".
La risposta è affermativa, e infatti l'and logico è realizzato in prolog attraverso l'operatore virgola (`,`).
La stessa domanda sarebbe potuta essere formulata direttamente così: 
```
:-likes(john,mary), likes(mary,john).
false.
```
Quando a Prolog sono dati una sequenza di obiettivi da soddisfare, Esso prova a soddisfare ogni gol di volta in volta, cercando di unificarlo (renderlo uguale) a qualche fatto che abbiamo inserito nella descrizione del programma.

Ovviamente è possibile chiedere al prolog cose un attimino più sofisticate, come ad esempio "c'è qualcuno a cui piace mary che è ricambiato?".
`?- likes(X,mary), likes(mary,X).`

Come proverà ad eseguire il tutto prolog?
Prova prima ad unificare la prima clausola attraverso le informazioni che gli abbiamo fornito.
Fino ad adesso gli abbiamo detto che:
```
likes(john,silvia).
likes(john,mary).
likes(mary, gino).
likes(gino, mary).
```
Prolog, mentre cercherà di risolvere il nostro quesito si comporterà così : 
Prova  a soddisfare likes(X,mary).
Provo con il primo FATTO, (`likes(john,silvia)`), se assegno `X=John` alla clausola ottengo che `likes(john,silvia) == likes(X=john,mary)` che vale `false`.

Provo allora con il secondo FATTO, e assegno `X=john`. Ottengo così `likes(john,mary)==likes(X=john,mary)` che vale `true`.
La prima clausola, (`likes(X,mary)`), è soddisfatta per `X=john`.

Mi chiedo se per `X=john` riesco a far valere true `likes(mary, X)`.
Inizio allora esaminando il primo fatto: `likes(mary, X=john)==likes(john,silvia)`, ovviamente è false.

Inizio allora esaminando il secondo fatto: `likes(mary, X=john)==likes(john,mary)`, ovviamente è false.

Inizio allora esaminando il terzo fatto: `likes(mary, X=john)==likes(mary,gino).`, ovviamente è false.

Inizio allora esaminando il quarto fatto: `likes(mary, X=john)==likes(gino, mari)`, ovviamente è false.

Purtroppo non è andata bene la ricerca per `X=john`, cosa faccio? Ovviamente ancora non ho assegnato tutti i possibili valori delle x, quindi posso andare avanti:
Devo trovare però un valore di X che torni a soddisfarmi la prima clausola, (likes(X,mary)), senza prendere in consideraione i valori già testati.
Provo dunque a vedere se riesco a sfruttare il 3 FATTO, (`likes(mary,gino)`), se assegno `X=mary` alla clausola ottengo che `likes(mary,gino) == likes(X=mary,mary)` che vale `false`.

Provo a sfruttare dunque il 4 FATTO, (`likes(gino,mary)`), se assegno `X=gino` alla clausola ottengo che `likes(gino,mary) == likes(X=gino,mary)` che vale `true`.

Ho soddisfatto dunque la prima clausola per `X=gino`. Ora con questo assegnamento devo vedere se riesco a soddisfare anche la seconda, ovvero `likes(mary,X)`.
Inizio allora esaminando il primo fatto: `likes(mary, X=gino)==likes(john,silvia)`, ovviamente è false.

Inizio allora esaminando il secondo fatto: `likes(mary, X=gino)==likes(john,mary)`, ovviamente è false.

Inizio allora esaminando il terzo fatto: `likes(mary, X=gino)==likes(mary,gino).`, vale TRUE.

HO TROVATO CHE PER X=GINO SONO SODDISFATTE ENTRAMBE.

L'output del sistema sarà dunque il seguente:
```
|:-likes(X,mary), likes(mary,X).
X = gino.
```

Come abbiamo visto il comportamento di Prolog è molto intelligente.
Praticamente Prova a soddisfarre una prima clausola, se ci riesce, con il valore trovato, prova a soddisfarre la seconda.
Se soddisfa anche la seconda allora ha trovato una soluzione, altrimenti fa BACKTRACKING e inizia da capo a soddisfare la prima ma dal punto in cui si era interrotto precedentemente, senza utilizzare soluzioni precedentemente esplorete.

###REGOLE

Scrivere di volta in volta "a tizio piace caio, a sempronio piace tizio" etc. etc. diventa abbastanza noioso.
Possiamo dare delle regole che permettono di soddisfare una formula.

Consideriamo alcuni esempi.

"A john piace chiunque persona a cui piaccia il vino" che tradotto significa "A john piache X se a X piace il vino".
Come possiamo esprimere questa cosa in Prolog?
Abbiamo bisogno delle Regole.
Le regole si compongono di una testa e di un corpo separate dal simbolo `:-` che è possibile leggere come "SE".

La frase appena vista si traduce in `likes(john,X) :- likes(X,wine)` e si legge come " A John piace X SE a X piace vino".
Ovviamente possono essere inserite anche più clausole in and nella seconda parte che devono essere soddisfatte contemporaneamente.

Possono essere create regole anche regole più sofisticate.
Pensiamo ad esempio al modo in cui poter esprimere il fatto che tra due oggetti intercorra la relazione di "sister_of(A,B)" con l'interpretazione di "A e è sorella di B".
Per esprimere bene questa regola probabilmente abbiamo bisogno di ulteriori predicati.
Quanti e quali predicati inserire dipende ovviamente dal tipo di domande che vogliamo porre a prolog, dal tipo di risposte che ci aspettiamo o più semplicemente dal grado di dettaglio con il quale siamo capaci o vogliamo descrivere il mondo.
In questo caso, senza essere troppo specifici, potremmo dire che, gli altri predicati di cui potremmo avere bisogno sono i seguenti:
- parents(A,B,C): indica il fatto che i genitori di A sono B e C.
- female ( A) : indica il fatto che A sia una donna.
- male(A) : indica il fatto che A sia un uomo.

Con un grado di dettaglio non troppo elevato potremmo dire che, affinche intercorra la relazione "sister_of(a,b)" fra due oggetti, c'è bisogno che i due oggetti abbiano gli stessi genitori e inoltre che il secondo oggetto sia una donna.

Come potremmo tradurre il tutto?

`sister_of(X,Y) :- female(Y), parents(X,A,B), parents(Y,A,B).`

Alcune Osservazioni:
- Abbiamo detto che il grado di dettaglio con cui vogliamo descrivere il mondo nel quale prolog è immerso è tutto. In effetti, in questa situazione abbiamo dato per scontate diverse cose: prima di tutto bisognava stabilire che x e y siano effettivamente due persone diverse ( l 'interrogazione darebbe true se la invocassi sullo stesso oggetto qualora rispetti il solo vincolo di essere donna).

-L'ordine degli AND: Abbiamo detto che per quanto riguarda l'ordine dei termini da mettere in AND non ci sono grossi problemi, perchè, tuttavia decidere prima se rispetta la condizione su female e poi proseguire? Perchè potrebbe fare meno backtracking e arrivare, in tempi leggermente minori, alla soluzione giusta. (ovviamente per questo esempio banale non cambia nulla ma in altri contesti sarebbe sempre meglio riuscire ad esprimere le nostre regole seguendo l'approccio particolare_to_generale, in modo da vincolare subito più variabili possibili durante la valutazione).