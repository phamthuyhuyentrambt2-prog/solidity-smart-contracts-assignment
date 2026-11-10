## 01 Counter
- What it does : maintains a state integer that can be incremented and decremented
- Key concept : basic state variables and public state-modifying functions
- Tested : increment(), decrement(), decrement below zero -> reverted
- Ganache proof: screenshots/01_test1.png, 01_test2.png

## 02 Storage
- What it does : stores and retrieves a single numeric value on-chain
- Key concept : state variables storage, getter and setter functions
- Tested : set(42), get() returns 42, zero value validation -> reverted
- Ganache proof: screenshots/02_test1.png, 02_test2.png

## 03 EvenOdd
- What it does : checks whether a given input number is even or odd
- Key concept : pure functions, conditional statements (if-else), modulo operator
- Tested : check(4) returns true, check(5) returns false, invalid edge case -> reverted
- Ganache proof: screenshots/03_test1.png, 03_test2.png

## 04 Ownable
- What it does : restricts critical functions access to the contract owner
- Key concept : modifier pattern, access control, transferOwnership
- Tested : owner transfers ownership, non-owner calls protected function -> reverted
- Ganache proof: screenshots/04_test1.png, 04_test2.png

## 05 SimpleBank
- What it does : users deposit/withdraw ETH with per-user balances
- Key concept : Checks-Effects-Interactions pattern to block re-entrancy
- Tested : deposit(2 ETH), withdraw(1 ETH), withdraw(10 ETH) -> reverted
- Ganache proof: screenshots/05_test1.png, 05_test2.png

## 06 Voting
- What it does : decentralized voting system managed by a chairperson
- Key concept : structs, mappings, dynamic arrays, authorization modifiers
- Tested : authorize voter, vote for candidate, double voting -> reverted
- Ganache proof: screenshots/06_test1.png, 06_test2.png

## 07 MyToken
- What it does : implements a basic ERC-20 token standard with custom supply
- Key concept : token balances, transfer, approve, transferFrom mechanisms
- Tested : transfer tokens between accounts, exceed allowance/balance -> reverted
- Ganache proof: screenshots/07_test1.png, 07_test2.png

## 08 Crowdfunding
- What it does : raises funds with a goal and deadline, supports refunds if missed
- Key concept : time-locked conditions, goal checking, withdraw/refund logic
- Tested : contribute ETH, reach goal and claim, contribute past deadline -> reverted
- Ganache proof: screenshots/08_test1.png, 08_test2.png

## 09 MultiSigWallet
- What it does : wallet requiring multiple approvals from owners before executing transactions
- Key concept : multi-signature consensus, transaction structs, approval mappings
- Tested : submit transaction, multi-owner approve, execute, unapproved execution -> reverted
- Ganache proof: screenshots/09_test1.png, 09_test2.png

## 10 TimeLock
- What it does : locks funds or functions until a specific timestamp passes
- Key concept : block.timestamp verification, time-based modifiers
- Tested : lock funds, attempt early withdrawal -> reverted, successful withdrawal after time
- Ganache proof: screenshots/10_test1.png, 10_test2.png