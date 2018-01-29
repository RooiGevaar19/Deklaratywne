%Rzym->Dziesiętne
romtodec([], 0).
romtodec([i], 1).
romtodec([v], 5).
romtodec([x], 10).
romtodec([l], 50).
romtodec([c], 100).
romtodec([d], 500).
romtodec([m], 1000).

%kod,
romtodec([A,B,C|L1], N) :- romtodec([B], M2), romtodec([C], M3),
                     M2 < M3,
                     !, romtodec([A], M1), romtodec(L1, N1), N is M1 + M3 - M2 + N1.
romtodec([A,B|L1], N) :- romtodec([A], M1), romtodec([B], M2),
                     M1 < M2,
                     !, romtodec(L1, N1), N is M2 - M1 + N1.
romtodec([A,B|L1], N) :- romtodec([A], M1), romtodec([B], M2),
                     M1 >= M2, romtodec(L1, N1), N is M1 + M2 + N1.

%Dziesietne->Rzym

dectorom1(0, []).
dectorom1(1, [i]).
dectorom1(5, [v]).
dectorom1(10, [x]).
dectorom1(50, [l]).
dectorom1(100, [c]).
dectorom1(500, [d]).
dectorom1(1000, [m]).

%kod,
dectorom1(N, [A,B|L]) :- dectorom1(N3, L), dectorom1(N2, [B]), dectorom1(N1, [A]), N is N1 + N2 + N3.
