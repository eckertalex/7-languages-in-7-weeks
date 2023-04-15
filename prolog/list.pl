reverse([], []).
reverse([Head|Tail], Reversed) :- append(List, [Head], Reversed), reverse(Tail, List).

% reverse([1, 2, 3, 4, 5], Reversed).
% Reversed = [5, 4, 3, 2, 1]

min([X], X).
min([X|[Y|Tail]], Min) :- X =< Y, min([X|Tail], Min).
min([X|[Y|Tail]], Min) :- X > Y, min([Y|Tail], Min).

% min([3, 2, 4, 5, 1], Min).
% Min = 1

mysort([], []).
mysort(List, [Min|Sorted]) :- min(List, Min), delete(List, Min, Rest), mysort(Rest, Sorted).
