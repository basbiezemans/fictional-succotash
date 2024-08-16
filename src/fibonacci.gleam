import gleam/float
import gleam/int.{to_float}

/// Calculate the n-th term of the Fibonacci sequence.
/// 
pub fn fibonacci(i: Int) -> Int {
  case i {
    0 -> 0
    1 -> 1
    n if n > 1 -> fib(n - 2, 0, 1)
    negative_i -> neg_fib(negative_i)
  }
}

fn fib(i: Int, x: Int, y: Int) -> Int {
  case i {
    0 -> x + y
    n -> fib(n - 1, y, x + y)
  }
}

// Extension to negative integers
// F(-n) = (-1)^(n + 1) × F(n)
//
fn neg_fib(i: Int) -> Int {
  let n = int.absolute_value(i)
  let e = n + 1
  case int.power(-1, to_float(e)) {
    Ok(sign) -> {
      let fib = fibonacci(n)
      sign
        |> float.truncate
        |> int.multiply(fib)
    }
    Error(_) -> panic as "No way!"
  }
}
