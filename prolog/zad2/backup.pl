a(1).
b(1).
c(1).
b(2).
c(2).
d(2).
f(3).
p(X) :- a(X).
p(X) :- b(X), c(X), !, d(X).
p(X) :- f(X).

pp(1).
pp(2) :- !.
pp(3).                       

max(X, Y, Z) :- X > Y, !, Z is X.
max(X, Y, Y).

difference([],[_],[]).
difference(X, [], X).
difference(X, X, []).
difference([X],[Y],[X]).
difference([X|L],[X], L).
difference([X|L], L, [X]).
difference([A|X], [A|Y], Z) :- difference(X, Y, Z).
difference([A|X], [B|Y], [A|Z]) :- A =\= B, difference([A|X], Y, [A|Z]).

numba(Z) :- member(A, [1,2,3,4,5,6,7,8,9]), 
            member(B, [0,1,2,3,4,5,6,7,8,9]),
            member(C, [0,1,2,3,4,5,6,7,8,9]),
            Z is 100*A + 10*B + C,
            0 is Z mod 30,
            3 is Z mod 9
.