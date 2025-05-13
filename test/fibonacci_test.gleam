import fibonacci_lib.{fibonacci}
import gleam/list
import gleam/pair.{first, second}
import gleeunit
import gleeunit/should
import utils/util_lib.{multiple_of, str_split}

pub fn main() {
  gleeunit.main()
}

/// Test the first 12 Fibonacci numbers.
pub fn fibonacci_test() {
  let terms = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  let fnums = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
  let pairs = list.zip(terms, fnums)
  list.each(pairs, fn(pair) {
    first(pair)
    |> fibonacci
    |> should.equal(second(pair))
  })
}

/// Test the first 7 Negafibonacci numbers.
pub fn negafibonacci_test() {
  let terms = [-1, -2, -3, -4, -5, -6, -7]
  let fnums = [1, -1, 2, -3, 5, -8, 13]
  let pairs = list.zip(terms, fnums)
  list.each(pairs, fn(pair) {
    first(pair)
    |> fibonacci
    |> should.equal(second(pair))
  })
}

/// Test a larger Fibonacci number.
pub fn larger_fibonacci_number_test() {
  fibonacci(100) |> should.equal(354_224_848_179_261_915_075)
}

/// Test multiple of a given factor.
pub fn multiple_of_test() {
  multiple_of(4, 8) |> should.equal(8)
  multiple_of(10, 8) |> should.equal(16)
  multiple_of(24, 8) |> should.equal(24)
}

/// Test split a string into a list of strings.
pub fn str_split_test() {
  let pieces = ["hel", "lo ", "wor", "ld"]
  str_split("hello world", 3) |> should.equal(pieces)
}
