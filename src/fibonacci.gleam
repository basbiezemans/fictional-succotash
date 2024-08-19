import gleam/float
import gleam/int.{to_float, absolute_value as abs}

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
  let n = abs(i)
  pow_m1(n + 1) * fibonacci(n)
}

// Base -1 exponentiation
// pow_m1(exp) = (-1)^exp
//
fn pow_m1(e: Int) -> Int {
  let assert Ok(num) = int.power(-1, to_float(e))
  float.truncate(num)
}
