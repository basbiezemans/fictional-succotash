# Fibonacci Numbers

The Fibonacci numbers are named after a 13th century Italian mathematician known
as Fibonacci.

The two first Fibonacci numbers are 0 and 1, and the other Fibonacci numbers
are always the sum of the two previous numbers: 0, 1, 1, 2, 3, 5, 8, 13, 21, ...

The algorithm in this tiny program is based on the following recursive formula.

```text
F(n) = F(n-1) + F(n-2)
```

The above formula is notoriously slow because of the two recursive calls. For an
efficient solution, the algorithm takes advantage of a Gleam feature called TCO,
or tail-call optimization.

## Run the program in a Docker container
```bash
make docker
```

## Enter a Fibonacci term
The program will ask you to enter a Fibonacci sequence term.
```text
...
Enter a term:
```

## Example output
When you enter 100, it will show the 100th Fibonacci number: 354,224,848,179,261,915,075
```text
...
Enter a term: 100
+----------------------------------+
| FIB(100) = 354224848179261915075 |
+----------------------------------+
```
