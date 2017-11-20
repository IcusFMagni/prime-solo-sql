CREATE TABLE accounts (
    user_id serial PRIMARY KEY,
    username character varying(12),
    city character varying(128),
    transactions_completed integer,
    transactions_attempted integer,
    account_balance numeric(12,2)
);

INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('shawn', 'chicago', 5, 10, 355.80),
('cherise', 'minneapolis', 9, 9, 4000.00),
('larry', 'minneapolis', 3, 4, 77.01),
('dallas', 'new york', 6, 12, 0.99),
('anthony', 'chicago', 0, 0, 0.00),
('travis', 'miami', 1, 100, 500000.34),
('davey', 'chicago', 9, 99, 98.04),
('ora', 'phoenix', 88, 90, 3.33),
('grace', 'miami', 7, 9100, 34.78),
('hope', 'phoenix', 4, 10, 50.17);


-- Get all users from Chicago
SELECT * FROM accounts WHERE city LIKE 'chicago';

--Get all users with usernames that contain the letter a
SELECT * FROM accounts WHERE username ILIKE "%a%";

-- The bank is giving a new customer a bonus!  Update all records with an account balance of 0.00 and a transactions_attempted of 0.  Give them a new account balance of 10.00
UPDATE accounts SET account_balance = 10.00 WHERE account_balance LIKE 0.00 AND transactions_attempted LIKE 0;

-- Select all users that have attempted 9 or more transactions
SELECT * FROM accounts WHERE transactions_attempted > 8;

-- Get the username and account balance of the 3 users with the highest balances, sort highest to lowest
SELECT username, account_balance FROM accounts ORDER BY account_balance DESC LIMIT 3;

-- Get the username and account balance of the 3 users with the lowest balances
SELECT username, account_balance FROM accounts ORDER BY account_balance LIMIT 3;

-- Get all users with account balances that are more than $100
SELECT * FROM accounts WHERE account_balance>100.00;

-- Add a new record.
INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance)
VALUES ('Crap Head', 'pekin', 0, 10, 0.00);

-- The bank is losing money in Miami and Phoenix and needs to unload low transaction customers: Delete users that reside in Miami or Phoenix and have less than 5 transactions

DELETE FROM accounts WHERE city LIKE 'miami' AND transactions_completed < 5;
DELETE FROM accounts WHERE city LIKE 'phoenix' AND transactions_completed < 5;
