% Facts about accounts
account(account_number, owner, balance).

% Rules for creating accounts
create_account(Account) :-
  \+account(Account),
  generate_account_number(AccountNumber),
  asserta(account(AccountNumber, owner, 0)).

% Rules for depositing money
deposit(Account, Amount) :-
  account(Account, _, Balance),
  NewBalance is Balance + Amount,
  asserta(account(Account, _, NewBalance)).

% Rules for transferring money between accounts
transfer(FromAccount, ToAccount, Amount) :-
  account(FromAccount, _, FromBalance),
  account(ToAccount, _, ToBalance),
  FromBalance >= Amount,
  NewFromBalance is FromBalance - Amount,
  NewToBalance is ToBalance + Amount,
  asserta(account(Account, _, NewFromBalance)),
  asserta(account(ToAccount, _, NewToBalance)).

% Rules for checking the balance of an account
balance(Account, Balance) :-
  account(Account, _, Balance).

% generate a random account number
generate_account_number(AccountNumber) :-
  random(100000, 999999, AccountNumber).
