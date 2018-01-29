len(0, []).
len(N, [_|L]) :- len(M, L), N is M+1.