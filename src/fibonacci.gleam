/// Calculate the n-th term of the Fibonacci sequence.
/// 
pub fn fibonacci(i: Int) -> Int {
  case i {
    0 -> 0
    1 -> 1
    n -> fib(n - 2, 0, 1)
  }
}

fn fib(i: Int, x: Int, y: Int) -> Int {
  case i {
    0 -> x + y
    n -> fib(n - 1, y, x + y)
  }
}