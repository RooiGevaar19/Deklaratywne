append2([X|L1],L2,[X|L3]) :- append2(L1,L2,L3).
append2([],L,L).

%length(0, []).
%length(N, [_|L]) :- length(M, L), N is M+1.

last(X,[X]).
last(X,[_|Z]) :- last(X,Z).

first(X,[X]).
first(X,[Z|_]) :- first(X,Z).

delete([], _, []).
delete([X|T], L, S) :- member(X, L), !, delete(T, L, S). 
delete([X|T], L, [X|S]) :- delete(T, L, S).

diff3([B,_,_,_], [B]).

reverse([],Z,Z).
reverse([H|T],U,Z) :- reverse(T,[H|U],Z).

evenlength([]).
evenlength([_,_]).
evenlength([Y,_,_]) :- evenlength(Y).

oddlength(Y) :- \+ evenlength(Y).

%oddlength([_]).
%oddlength([Y,_,_]) :- oddlength(Y).

shift([X|L],S) :- append2(L, [X], S).
