require 'test/unit'
require './is-prime'

def find_prime(num_digits, max_tests)
  random = rand(0..100)/100.0
end

class FindPrimeTest < Test::Unit::TestCase
  def test_find_prime
    assert_equal(Fixnum, find_prime(3, 10).class)
    assert_equal(50, find_prime(50, 50).to_s.length)
  end
end
