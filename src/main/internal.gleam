import gleam/float.{ceiling}
import gleam/int
import gleam/list
import gleam/string.{length}

/// Round a value to a multiple of a given factor.
///
pub fn multiple_of(value: Int, factor: Int) -> Int {
  case value > factor {
    True -> {
      let x = int.to_float(value)
      let y = int.to_float(factor)
      ceiling(x /. y) *. y |> float.truncate
    }
    False -> factor
  }
}

/// Convert a string to a list of strings.
///
pub fn str_split(str: String, size: Int) -> List(String) {
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
