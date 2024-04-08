a(1).
a(a).
b(2).
b(3).
c(X,X):-a(X).
c(X,Y):-a(X),b(Y).
c(X,X):-b(X).

