%max([], R, R).
%max([X|Xs], WK, R):- X >  WK, max(Xs, X, R).
%max([X|Xs], WK, R):- X =< WK, max(Xs, WK, R).
%max([X|Xs], R):- max(Xs, X, R).

max3(A, B, A) :- A > B.
max3(A, B, B) :- A =< B.

