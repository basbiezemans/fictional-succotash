import fibonacci.{fibonacci}
import gleam/erlang.{get_line}
import gleam/int.{to_string}
import gleam/io.{println, println_error}
import gleam/option.{type Option, None, Some}
import gleam/string.{length, pad_right, repeat}
import main/internal.{multiple_of, str_split}

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
      |> draw_box(size: 60)
    }
    None -> println_error("Error reading from STDIN")
  }
}

// Read an integer number from STDIN.
//
fn read_number(prompt: String) -> Option(Int) {
  case get_line(prompt) {
    Ok("\n") -> Some(0)
    Ok(input) -> {
      input
      |> string.trim
      |> int.parse
      |> option.from_result
    }
    Error(_) -> None
  }
}

// Draw a certain sized box around the given text.
//
fn draw_box(text: String, size size: Int) -> Nil {
  let line = repeat("─", size)
  let mult =
    text
    |> length
    |> multiple_of(size)
  let body =
    text
    |> pad_right(mult, " ")
    |> str_split(size)
    |> string.join(" │\n│ ")
  println("┌─" <> line <> "─┐")
  println("│ " <> body <> " │")
  println("└─" <> line <> "─┘")
}
