import gleam/int.{to_string}
import gleam/io.{println_error}
import gleam/option.{type Option, None, Some}
import gleam/string

import console.{draw_box, read_number}
import fibonacci.{fibonacci}

/// Read and show the n-th term of the Fibonacci sequence.
///
pub fn main() {
  read_number("Enter a term: ") |> show_fib
}

fn show_fib(option: Option(Int)) -> Nil {
  case option {
    Some(term) -> {
      ["FIB(", to_string(term), ") = ", to_string(fibonacci(term))]
      |> string.concat
      |> draw_box(60)
    }
    None -> println_error("Error reading from STDIN")
  }
}
