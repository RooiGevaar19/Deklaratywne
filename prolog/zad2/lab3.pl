%ordnung
ordered([_]).
ordered([X|[Y|L]]) :- X =< Y, ordered([Y|L]).

%mergesort
splitlist(L, [], L, 0).
splitlist([H|T], [H|A], B, N) :- Nminus1 is N-1, splitlist(T, A, B, Nminus1).

halfhalf(L, A, B) :- length(L, Len), Half is Len//2, splitlist(L, A, B, Half).

merge(A, [], A).
merge([], B, B).
merge([Ha|Ta], [Hb|Tb], R) :- Ha =< Hb, merge(Ta, [Hb|Tb], M), R = [Ha|M].
merge([Ha|Ta], [Hb|Tb], R) :- Ha > Hb, merge(Tb, [Ha|Ta], M), R = [Hb|M].

mergesort([], []).
mergesort([X], [X]).
mergesort([X1, X2], [X1, X2]) :- X1 =< X2.
mergesort([X1, X2], [X2, X1]) :- X1 > X2.
mergesort(L1, L2) :- halfhalf(L1, LL, LR), mergesort(LL, LLsorted), mergesort(LR, LRsorted), merge(LLsorted, LRsorted, L2).

%drzewa

tree(_, nil, nil).
tree(X, tree(Y, T1L, T1R), nil) :- X =< Y, tree(Y, T1L, T1R).
tree(X, nil, tree(Y, T2L, T2R)) :- X =< Y, tree(Y, T2L, T2R).
tree(X, tree(Y, T1L, T1R), tree(Z, T2L, T2R)) :- Y =< X, X =< Z, tree(Y, T1L, T1R), tree(Z, T2L, T2R).

treesize(nil, 0).
treesize(tree(_, nil, nil), 1).
treesize(tree(_, tree(L, LL, LR), nil), S) :- treesize(tree(L, LL, LR), S1), S is S1 + 1.
treesize(tree(_, nil, tree(R, RL, RR)), S) :- treesize(tree(R, RL, RR), S1), S is S1 + 1.
treesize(tree(_, tree(L, LL, LR), tree(R, RL, RR)), S) :- treesize(tree(L, LL, LR), S1), treesize(tree(R, RL, RR), S2), S is S1 + S2 + 1.

treesearch(tree(S, nil, nil), S).
treesearch(tree(S, _, _), S).
treesearch(tree(_, tree(L, LL, LR), nil), S) :- treesearch(tree(L, LL, LR), S).
treesearch(tree(_, nil, tree(R, RL, RR)), S) :- treesearch(tree(R, RL, RR), S).