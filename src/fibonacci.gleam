import gleam/int.{to_string}
import gleam/io
import gleam/string.{repeat, length}

// Calculate the 100th Fibonacci number: 354,224,848,179,261,915,075

pub fn main() {
  let fib_100 = to_string(fibonacci(100))
  let fline = "| FIB(100) = " <> fib_100 <> " |"
  let ndash = length(fline) - 2
  let hline = "+" <> repeat("-", ndash) <> "+"
  io.println(hline)
  io.println(fline)
  io.println(hline)
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
