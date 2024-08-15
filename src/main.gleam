import gleam/int.{to_string}
import gleam/io.{println_error}
import gleam/list.{fold}
import gleam/option.{type Option, Some, None}
import gleam/string

import console.{read_number, draw_box}
import sequence.{fibonacci}

/// Read and show the n-th term of the Fibonacci sequence.
/// 
pub fn main() {
  read_number("Enter a term: ") |> show_fib
}

fn show_fib(option: Option(Int)) -> Nil {
  case option {
    Some(term) -> {
      [
        "FIB(", to_string(term),
        ") = ", to_string(fibonacci(term))
      ]
      |> fold("", string.append) |> draw_box(60)
    }
    None -> println_error("Error reading from STDIN")
  }
}
