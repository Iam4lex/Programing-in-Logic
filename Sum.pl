sum(0, 0).
sum(N, Sum) :-
    N > 0,
    M is N - 1,
    sum(M, SumM),
    Sum is SumM + N.
