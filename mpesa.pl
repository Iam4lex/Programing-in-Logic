
% Facts to store account information
account(AccountID, Balance).

% Predicate to initiate account creation
create_account(AccountID) :-
    \+ account(AccountID, _), % Check if account doesn't already exist
    assertz(account(AccountID, 0)). % Create account with initial balance 0

% Predicate to deposit money into an account
deposit(AccountID, Amount) :-
    account(AccountID, Balance), % Get current balance
    NewBalance is Balance + Amount, % Calculate new balance
    retract(account(AccountID, _)), % Remove old balance fact
    assertz(account(AccountID, NewBalance)). % Assert new balance fact

% Predicate to transfer money from one account to another
transfer(SenderID, ReceiverID, Amount) :-
    account(SenderID, SenderBalance), % Get sender's balance
    SenderBalance >= Amount, % Check if sender has enough balance
    retract(account(SenderID, _)), % Remove old sender balance fact
    NewSenderBalance is SenderBalance - Amount, % Calculate new sender balance
    assertz(account(SenderID, NewSenderBalance)), % Assert new sender balance
    (   account(ReceiverID, ReceiverBalance) % Check if receiver exists
    ->  retract(account(ReceiverID, _)), % Remove old receiver balance fact
        NewReceiverBalance is ReceiverBalance + Amount, % Calculate new receiver balance
        assertz(account(ReceiverID, NewReceiverBalance)) % Assert new receiver balance
    ;   create_account(ReceiverID), % If receiver doesn't exist, create account
        assertz(account(ReceiverID, Amount)) % Assert receiver balance
    ).

% Predicate to check account balance
check_balance(AccountID, Balance) :-
    account(AccountID, Balance).
