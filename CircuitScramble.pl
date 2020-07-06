and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

and(0,0,0,0).
and(1,0,0,0).
and(0,1,0,0).
and(0,0,1,0).
and(1,0,1,0).
and(1,1,0,0).
and(0,1,1,0).
and(1,1,1,1).

or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

not(0,1).
not(1,0).

xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).

switch(1,A,A,0).
switch(0,A,0,A).

%And al final de todos los puzzles.
final([A|[]],1) :- and(A,1,1). 

final([A|XS], Resultado) :-
    final(XS, Resultado),
    and(A, Resultado, 1).    


estaEncendido(1).

%Niveles

c1([A,B,C,D], Resultado) :-
    and(A, B, E),
    and(C, D, F),
    final([E, F], Resultado).

c2([A,B,C,D], Resultado) :-
    or(A, B, E),
    or(C, D, F),
    final([E, F], Resultado).

c3([A,B,C,D], Resultado) :-
    and(A, B, E),
    or(C, D, F),
    final([E, F], Resultado).

c4([A,B,C,D], Resultado) :-
    and(A, B, E),
    or(C, D, F),
    or(E, F, G),
    final([E, G], Resultado).

c5([A,B,C,D], Resultado) :-
    or(A, B, E),
    not(C, CC),
    and(CC, D, F),
    not(E, EE),
    not(F, FF),
    final([EE, FF], Resultado).

c6([A,B,C,D], Resultado) :-
    and(A, B, E),
    or(C, D, F),
    not(E, EE),
    not(F, FF),
    or(EE,FF,R),
    not(R, NR),
    final([NR, A, F], Resultado).

c7([A,B,C,D,X,Z],Resultado) :-
    and(A, B, E),
    or(C, D, F),
    not(Z, G),
    and(X, G, H),
    not(F, I),
    and(I, H, J),
    final([E, J], Resultado).

c8([A,B,C,D,X,Z], Resultado) :-
    or(A, B, E),
    not(E, G),
    and(C, D, H),    
    not(X, I),
    or(I, Z, F),
    not(F, J),
    or(H, J, K),
    or(G, K, L),
    final([L, E, J], Resultado).


c9([A,B,C,D,X,Z], Resultado) :-
    or(A, B, E),
    or(C, D, F),
    not(X, G),
    and(G, Z, H),
    not(F, I),
    and(E, I, J),
    or(J, H, R),
    not(R, NR),
    final([NR, D, G], Resultado).


c10([A,B,C,D,X,Z], Resultado) :-
    and(A, B, E),
    and(C, D, F),
    or(X, Z, G),
    and(E, F, H),
    or(F, G, I),
    final([H, I], Resultado).

c11([A,B,C,D,X,Z], Resultado) :-
    or(A, B, E),
    or(C, D, F),
    and(X, Z, G),
    not(E, H),
    not(F, I),
    or(H, F, J),
    final([J, I, G], Resultado).

c24([A, B, C, D, X, Z, SW1], Resultado) :-
    xor(A, B, E),
    and(C, D, F),
    xor(X, Z, G),
    switch(SW1,F,H,I),
    or(E, H, J),
    and(I, G, K),
    final([J, K], Resultado).

c99([A,B,C,D,E,F,G,H,SW1,SW2], Resultado) :-
    and(A, B, I),
    or(I, C, J),
    and(D, E, K),
    or(F, L, M),
    and(G, H, L),
    or(I, J, N),
    and(J, K, O),
    and(K, M, P),
    xor(M, L, Q),
    switch(SW1,O,R,S),
    switch(SW2,P,T,U),
    and(N, R, V),
    not(T, W),
    or(S, W, X),
    not(X, AA),
    not(Q, Y),
    xor(U, Y, Z),
    final([V, AA, Z], Resultado).

circuit(A, B, C, D) :- 
    not(B, X),
    and(A, X, U),
    or(U, V, W),
    and(B, C, V),
    not(W, D).

%Resolución de Punto 1
puzzle(1, In) :- c1(In, 1).
puzzle(2, In) :- c2(In, 1).
puzzle(3, In) :- c3(In, 1).
puzzle(4, In) :- c4(In, 1).
puzzle(5, In) :- c5(In, 1).
puzzle(6, In) :- c6(In, 1).
puzzle(7, In) :- c7(In, 1).
puzzle(8, In) :- c8(In, 1).
puzzle(9, In) :- c9(In, 1).
puzzle(10, In) :- c10(In, 1).
puzzle(11, In) :- c11(In, 1).
puzzle(24, In) :- c24(In,1).
puzzle(99, In) :- c99(In, 1).

%Soluciones devueltas con formato
soluciones(Nivel) :-
   (	Nivel = 1 -> c1([A,B,C,D],1),format('A = ~d, B = ~d, C = ~d, D = ~d~n', [A,B,C,D]), fail
	;	Nivel = 2 -> c2([A,B,C,D],1), format('A = ~d, B = ~d, C = ~d, D = ~d~n', [A,B,C,D]), fail
	;	Nivel = 3 -> c3([A,B,C,D],1), format('A = ~d, B = ~d, C = ~d, D = ~d~n', [A,B,C,D]), fail
	;	Nivel = 4 -> c4([A,B,C,D],1), format('A = ~d, B = ~d, C = ~d, D = ~d~n', [A,B,C,D]), fail
	;	Nivel = 5 -> c5([A,B,C,D],1), format('A = ~d, B = ~d, C = ~d, D = ~d~n', [A,B,C,D]), fail
	;	Nivel = 6 -> c6([A,B,C,D],1), format('A = ~d, B = ~d, C = ~d, D = ~d~n', [A,B,C,D]), fail
	;	Nivel = 7 -> c7([A,B,C,D,X,Z],1), format('A = ~d, B = ~d, C = ~d, D = ~d, X = ~d, Z = ~d~n', [A,B,C,D,X,Z]), fail
	;	Nivel = 8 -> c8([A,B,C,D,X,Z],1), format('A = ~d, B = ~d, C = ~d, D = ~d, X = ~d, Z = ~d~n', [A,B,C,D,X,Z]), fail
	;	Nivel = 9 -> c9([A,B,C,D,X,Z],1), format('A = ~d, B = ~d, C = ~d, D = ~d, X = ~d, Z = ~d~n', [A,B,C,D,X,Z]), fail
	;	Nivel = 10 -> c10([A,B,C,D,X,Z],1), format('A = ~d, B = ~d, C = ~d, D = ~d, X = ~d, Z = ~d~n', [A,B,C,D,X,Z]), fail
	;	Nivel = 11 -> c11([A,B,C,D,X,Z],1), format('A = ~d, B = ~d, C = ~d, D = ~d, X = ~d, Z = ~d~n', [A,B,C,D,X,Z]), fail
	;	Nivel = 24 -> c24([A,B,C,D,X,Z,SW],1), format('A = ~d, B = ~d, C = ~d, D = ~d, X = ~d, Z = ~d, Switch = ~d~n', [A,B,C,D,X,Z,SW]), fail
	;	Nivel = 99 -> c99([A,B,C,D,E,F,G,H,SW1,SW2], 1), format('A = ~d, B = ~d, C = ~d, D = ~d, E = ~d, F = ~d, G = ~d, H = ~d, Switch1 = ~d, Switch2 = ~d~n', [A,B,C,D,E,F,G,H,SW1,SW2]), fail).


%Resolución de Punto 2
menor_solucion(N, Entrada, MenorSolucion) :-
    findall(In,puzzle(N,In),Outs),
    puzzle(N,MenorSolucion),
    diff(Entrada,MenorSolucion,Min),
    menor_diff(Entrada,Outs,Min).
    

%¿Cual es la mínima diferencia entre la lista X y las listas de listas?
menor_diff(X,[Y|YS],Min) :-
    diff(X,Y,Min),
    menor_diff(X,YS,Diff),
    Diff >= Min, !.

menor_diff(X,[Y|YS],Min) :-
    diff(X,Y,Diff),
    menor_diff(X,YS,Min),
    Diff > Min, !.

menor_diff(X,[],Min) :- length(X,Min), !.

%¿Las listas tienen "Diff" cantidad de elementos diferentes?
diff([],[],0).

diff([X|XS], [Y|YS], Diff) :-
    X == Y,
    diff(XS,YS,Diff), !.
    

diff([X|XS], [Y|YS], Diff) :-
    X \= Y,
    diff(XS,YS,Diff2),
    Diff is Diff2 + 1, !.

