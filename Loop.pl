
loop(0).
loop(N):-N>0,write('The value is: '),write(N),nl,
M is N-1,iterate(M).
