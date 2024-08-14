import gleam/int.{to_string}
import gleam/io.{println_error}
import gleam/list.{fold}
import gleam/option.{Some, None}
import gleam/string

import console.{read_number, draw_box}

// Read and show the n-th term of the Fibonacci sequence

pub fn main() {
  read_number() |> show_fib
}

fn show_fib(option) {
  case option {
    Some(term) -> {
      let ans = [
        "FIB(", to_string(term),
        ") = ", to_string(fibonacci(term))
      ]
      draw_box(fold(ans, "", string.append), 60)
    }
    None -> println_error("Error reading from STDIN")
  }
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
