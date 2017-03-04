require 'test/unit'

def prime_factors(number)
  factors = []
  while number % 2 == 0
    factors.push 2
    number /= 2
  end

  stop = Math.sqrt(number)

  (3..stop).step(2) do |i|
    while number % i == 0
      factors.push i
      number /= i
    end
  end
  factors.push number if number > 1
  factors
end

puts prime_factors(125)

class PrimeFactorsTest < Test::Unit::TestCase
  def test_prime_factors
    assert_equal([3,3,5,7], prime_factors(315))
  end
end
