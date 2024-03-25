% Prolog Facts and Rules for M-Pesa Simulation

% Initialize dynamic predicates for storing account information
:- dynamic account/2.

% Rule to initiate account creation
create_account(AccountNumber) :-
    % Generate a random account number
    random(1000, 9999, AccountNumber),
    % Initialize account with zero balance
    assert(account(AccountNumber, 0)),
    write('Account created successfully! Account Number: '), write(AccountNumber).

% Predicate for depositing money into an account
deposit(AccountNumber, Amount) :-
    % Check if the account exists
    account(AccountNumber, _),
    % Update account balance
    retract(account(AccountNumber, Balance)),
    NewBalance is Balance + Amount,
    assert(account(AccountNumber, NewBalance)),
    write('Deposit successful! New balance: '), write(NewBalance).

% Predicate for transferring money between accounts
transfer(AccountFrom, AccountTo, Amount) :-
    % Check if both accounts exist
    account(AccountFrom, BalanceFrom),
    account(AccountTo, BalanceTo),
    % Check if the account has sufficient balance
    BalanceFrom >= Amount,
    % Update balances for both accounts
    retract(account(AccountFrom, OldBalanceFrom)),
    NewBalanceFrom is OldBalanceFrom - Amount,
    assert(account(AccountFrom, NewBalanceFrom)),
    retract(account(AccountTo, OldBalanceTo)),
    NewBalanceTo is OldBalanceTo + Amount,
    assert(account(AccountTo, NewBalanceTo)),
    write('Transfer successful!'),
    write(' From Account '), write(AccountFrom), write(' Balance: '), write(NewBalanceFrom),
    write(' To Account '), write(AccountTo), write(' Balance: '), write(NewBalanceTo).

% Predicate for checking account balance
check_balance(AccountNumber) :-
    % Check if the account exists
    account(AccountNumber, Balance),
    write('Account Balance for Account '), write(AccountNumber), write(': '), write(Balance).
