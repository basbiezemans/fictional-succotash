import gleam/erlang.{get_line}
import gleam/int.{to_string}
import gleam/io.{println, println_error}
import gleam/list
import gleam/option.{Some, None}
import gleam/result
import gleam/string.{repeat, length}

// Read and show the n-th term of the Fibonacci sequence

pub fn main() {
  read_number() |> show_fib
}

fn read_number() {
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

fn show_fib(option) {
  case option {
    Some(term) -> print_box(term, 60)
    None -> println_error("Error reading from STDIN")
  }
}

fn print_box(term, boxsize) {
  let fib_n = fibonacci(term) |> to_string
  let seq_i = to_string(term)
  let fline = "FIB(" <> seq_i <> ") = " <> fib_n
  let lines = chunk_split(fline, boxsize, [])
  let hline = repeat("─", boxsize)
  let fbody = string.join(lines, " │\n│ ")
  println("┌─" <> hline <> "─┐")
  println("│ " <> fbody <> " │")
  println("└─" <> hline <> "─┘")
}

fn chunk_split(str, size, chunks) {
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
