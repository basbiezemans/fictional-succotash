import gleam/erlang.{get_line}
import gleam/int.{to_string}
import gleam/io.{println, println_error}
import gleam/result
import gleam/string.{repeat, length}

// Read and show the n-th term of the Fibonacci sequence

pub fn main() {
  read_number() |> show_fib
}

fn read_number() {
  case get_line("Enter a term: ") {
    Ok("\n") -> 0
    Ok(term) -> {
      term
        |> string.trim
        |> int.parse
        |> result.unwrap(0)
        |> int.absolute_value
    }
    Error(_) -> {
      println_error("Error reading from STDIN")
      0
    }
  }
}

fn show_fib(term) {
  let fib_n = fibonacci(term) |> to_string
  let seq_i = to_string(term)
  let fline = "| FIB(" <> seq_i <> ") = " <> fib_n <> " |"
  let ndash = length(fline) - 2
  let hline = "+" <> repeat("-", ndash) <> "+"
  println(hline)
  println(fline)
  println(hline)
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
