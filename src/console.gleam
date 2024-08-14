import gleam/erlang.{get_line}
import gleam/int
import gleam/io.{println}
import gleam/list
import gleam/option.{type Option, Some, None}
import gleam/result
import gleam/string.{repeat, length}

pub fn read_number() -> Option(Int) {
  case get_line("Enter a term: ") {
    Ok("\n") -> Some(0)
    Ok(term) -> {
      term
        |> string.trim
        |> int.parse
        |> result.unwrap(0)
        |> int.absolute_value
        |> Some
    }
    Error(_) -> None
  }
}

pub fn draw_box(text: String, size: Int) -> Nil {
  let line = repeat("─", size)
  let body = text
    |> str_split(size)
    |> string.join(" │\n│ ")
  println("┌─" <> line <> "─┐")
  println("│ " <> body <> " │")
  println("└─" <> line <> "─┘")
}

fn str_split(str: String, size: Int) -> List(String) {
  chunk_split(str, size, [])
}

fn chunk_split(str: String, size: Int, chunks: List(String)) -> List(String) {
  let len = length(str)
  case len > size {
    True -> {
      let head = string.slice(str, 0, size)
      let tail = string.slice(str, size, len)
      chunk_split(tail, size, [head, ..chunks])
    }
    False -> {
      let last = string.pad_right(str, size, " ")
      [last, ..chunks] |> list.reverse
    }
  }
}