import gleam/erlang.{get_line}
import gleam/float.{ceiling}
import gleam/int
import gleam/io.{println}
import gleam/list
import gleam/option.{type Option, Some, None}
import gleam/result
import gleam/string.{repeat, length, pad_right}

/// Read an integer number from STDIN.
///
pub fn read_number(prompt: String) -> Option(Int) {
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

/// Draw a certain sized box around the given text.
///
pub fn draw_box(text: String, size: Int) -> Nil {
  let line = repeat("─", size)
  let mult = text
    |> length
    |> multiple_of(size)
  let body = text
    |> pad_right(mult, " ")
    |> str_split(size)
    |> string.join(" │\n│ ")
  println("┌─" <> line <> "─┐")
  println("│ " <> body <> " │")
  println("└─" <> line <> "─┘")
}

// Round a value to a multiple of a given factor.
//
fn multiple_of(value: Int, factor: Int) -> Int {
  case value > factor {
    True -> {
      let x = int.to_float(value)
      let y = int.to_float(factor)
      ceiling(x /. y) *. y |> float.truncate
    }
    False -> factor
  }
}

// Convert a string to a list of strings.
//
fn str_split(str: String, size: Int) -> List(String) {
  chunk_split(str, size, [])
}

// Split a string into chunks of a specific size.
//
fn chunk_split(str: String, size: Int, chunks: List(String)) -> List(String) {
  let len = length(str)
  case len > size {
    True -> {
      let head = string.slice(str, 0, size)
      let tail = string.slice(str, size, len)
      chunk_split(tail, size, [head, ..chunks])
    }
    False -> [str, ..chunks] |> list.reverse
  }
}