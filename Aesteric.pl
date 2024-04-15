% Predicate to read characters until a specified delimiter is encountered
read_until(Delimiter, InputChars, OutputChars) :-
    read_until_helper(Delimiter, InputChars, [], OutputChars).

% Helper predicate for accumulating characters until the delimiter is encountered
read_until_helper(_, [], OutputChars, OutputChars).
read_until_helper(Delimiter, [Delimiter|_], OutputChars, OutputChars).
read_until_helper(Delimiter, [Char|Rest], Acc, OutputChars) :-
    read_until_helper(Delimiter, Rest, [Char|Acc], OutputChars).

% Predicate to test the read_until predicate
test :-
    write('Enter some characters: '),
    read_line_to_codes(user_input, InputCodes),
    atom_codes(Delimiter, "*"), % Delimiter character
    read_until(Delimiter, InputCodes, OutputCodes),
    atom_codes(OutputAtom, OutputCodes),
    writeln(OutputAtom).
