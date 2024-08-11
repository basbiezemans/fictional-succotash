import gleam/io

// Calculate the 100th Fibonacci number: 354,224,848,179,261,915,075

pub fn main() {
  io.debug(fibonacci(100))
}

// Efficient Fibonacci implementation

fn fibonacci(i) {
  case i {
    0 -> 0
    1 -> 1
    n -> fib(n - 2, 0, 1)
  }
}

fn fib(i, x, y) {
  case i {
    0 -> x + y
    n -> fib(n - 1, y, x + y)
  }
}
