% Define the number of rows and columns
rows(4).
columns(4).

% Predicate to generate and print the table
print_table :-
    rows(R),
    columns(C),
    print_header(C),
    print_rows(R, C, 1).

% Predicate to print the table header
print_header(0) :- write('|'), nl.
print_header(C) :-
    write('|   '),
    NextColumn is C - 1,
    print_header(NextColumn).

% Predicate to print the table rows
print_rows(0, _, _) :- !.
print_rows(R, C, RowNumber) :-
    print_row(C, RowNumber),
    NextRow is R - 1,
    NextRowNumber is RowNumber + 1,
    print_rows(NextRow, C, NextRowNumber).

% Predicate to print a single row
print_row(0, _) :- write('|'), nl.
print_row(C, RowNumber) :-
    write('| R'),
    write(RowNumber),
    write('C'),
    write(C),
    write(' '),
    NextColumn is C - 1,
    print_row(NextColumn, RowNumber).

% Example usage:
% To print the table, simply call:
% ?- print_table.
