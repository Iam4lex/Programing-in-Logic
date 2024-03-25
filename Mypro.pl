factorial(N, F) :- 
    N > 1, 
    N1 is N - 1, 
    factorial(N1, F1), 
    F is N * F1.
    
factorial(1, 1).
