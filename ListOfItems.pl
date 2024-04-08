% product(Name, Cost) represents a product with a name and cost
product('apple', 1.50).
product('banana', 0.75).
product('orange', 2.00).

% total_cost(List, TotalCost) calculates the total cost of products in a list
total_cost([], 0).
total_cost([Product | Tail], TotalCost) :-
  product(Product, Price),
  total_cost(Tail, Subtotal),
  TotalCost is Price + Subtotal.

