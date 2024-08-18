# Fibonacci Numbers

The Fibonacci numbers are named after a 13th century Italian mathematician known
as Fibonacci.

The first two Fibonacci numbers are 0 and 1, and the other Fibonacci numbers
are always the sum of the two previous numbers: 0, 1, 1, 2, 3, 5, 8, 13, 21, ...

The algorithm in this tiny program is based on the following recursive formula.

```text
F(n) = F(n-1) + F(n-2)
```

The above formula is notoriously slow because of the two recursive calls. For an
efficient solution, the algorithm takes advantage of a Gleam feature called TCO,
or tail-call optimization.

## Run the program in a Docker container
If you don't have Docker installed locally, the easiest way to run the program is
to fork this repo, create a GitHub Codespace, and run the following command in its
terminal.
```bash
make docker
```

## Enter a Fibonacci term
The program will ask you to enter a Fibonacci sequence term.
```text
Enter a term: _
```

## Example output
When you enter 100, it will show the 100th Fibonacci number: 354,224,848,179,261,915,075
```text
Enter a term: 100
┌──────────────────────────────────────────────────────────────┐
│ FIB(100) = 354224848179261915075                             │
└──────────────────────────────────────────────────────────────┘
```
To get an idea of how the program handles large numbers, we can have it calculate
the 1000th term of the Fibonacci sequence. It will do so without a problem because
Gleam, when running on the Erlang virtual machine, has arbitrary size integers.
```
Enter a term: 1000
┌──────────────────────────────────────────────────────────────┐
│ FIB(1000) = 434665576869374564356885276750406258025646605173 │
│ 717804024817290895365554179490518904038798400792551692959225 │
│ 930803226347752096896232398733224711616429964409065331879382 │
│ 98969649928516003704476137795166849228875                    │
└──────────────────────────────────────────────────────────────┘
```

## Negafibonacci numbers
Negafibonacci numbers are an extension of the standard Fibonacci sequence to include negative terms. They extend this sequence using the same relationship, but with a twist.
```text
F(−n) = (−1)^(n+1)⋅F(n)
```
This means that for negative terms (indices), the Fibonacci sequence behaves as follows:
```text
F(−1) = 1
F(−2) = −1
F(−3) = 2
F(−4) = −3
F(−5) = 5
...
```
So, negafibonacci numbers alternate in sign, and their absolute values follow the standard Fibonacci sequence.
