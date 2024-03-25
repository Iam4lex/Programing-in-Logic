print_numbers(Start,End) :- Start <= End, write(Start), nl, Next is Start + 1, print_numbers(Next, End).
print_numbers(End,End).

