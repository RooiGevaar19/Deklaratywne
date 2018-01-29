% Długość listy
len(0, []).
len(N, [_|L]) :- len(M, L), N is M+1.


% Max dwóch elementów
max3(A, B, A) :- A > B.
max3(A, B, B) :- A =< B.

% Fibonacci
fib(0, 0).
fib(1, 1).
fib(N, S) :- N1 is N - 1, fib(N1, S1), 
             N2 is N - 2, fib(N2, S2), 
             S is S1 + S2.


% NWD
nwd(0, X, X) :- X > 0, !.
nwd(X, Y, Z) :- X >= Y, X1 is X - Y, nwd(X1, Y, Z).
nwd(X, Y, Z) :- X  < Y, X1 is Y - X, nwd(X1, X, Z).

% family
male(roman).
male(mirek).
male(janusz).
male(seba).
male(lukasz).

female(halyna).
female(ela).
female(grazyna).
female(karyna).

parent(janusz, roman).
parent(janusz, halyna).

parent(grazyna, mirek).
parent(grazyna, ela).

parent(lukasz, mirek).
parent(lukasz, ela).

parent(seba, janusz).
parent(seba, grazyna).
parent(karyna, janusz).
parent(karyna, grazyna).

child(X, Y) :- parent(Y, X).
mother(X, Y) :- parent(X, Y), female(Y).
sister(X, Y) :- parent(X, Z), parent(Y, Z), female(Y).
brother(X, Y) :- parent(X, Z), parent(Y, Z), male(Y).
has_a_child(X) :- parent(*, X).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
precedessor(X, Y) :- parent(Y, Z), precedessor(X, Z).