cost(tomato,50).
cost(bread,65).
cost(milk,60).
cost(rice,120).
cost(sugar,170).
cost(sukuma,20).
cost(bundles,50).
cost(pilipili,10).
cost(salt,50).
cost(potato,50).

total_cost([],0).
total_cost([Item | Rest], Cost) :- cost (Item, Item_Cost),
total_cost(Rest, Rest_Cost),
Cost is Item_Cost + Rest_Cost.
