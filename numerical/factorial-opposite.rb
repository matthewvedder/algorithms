require 'test/unit'

def factorial_opposite(number)
  dividend = number
  counter = 2.0
  while dividend > 1
    dividend /= counter
    counter += 1
  end
  "counter: #{counter.to_i - 1}, dividend: #{dividend}"
end

puts factorial_opposite(31536000000000)


class FactorialOppositeTest < Test::Unit::TestCase
  def test_factorial_opposite
    assert_equal('counter: 5, dividend: 1.0', factorial_opposite(120))
  end
end

