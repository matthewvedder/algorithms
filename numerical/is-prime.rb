require 'test/unit'

# fermat primality test

def is_prime(number, max_tests)
  max_tests.times do
    n = rand(2..max_tests-1)
    return false if ( n ** (number-1) % number ) != 1
  end
  true
end

class IsPrimeTest < Test::Unit::TestCase
  def test_is_prime
    assert_equal(true, is_prime(23, 5))
    assert_equal(false, is_prime(50, 20))
    assert_equal(true, is_prime(349, 20))
  end
end
