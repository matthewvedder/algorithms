# linear congruential generator for psuedo random numbers
# Xn+1 = (A × Xn + B) Mod M
require 'test/unit'

def random_array(seed, quantity, a, b, m)
  randoms = []
  until randoms.count == quantity
    randoms.empty? ? last = seed : last = randoms.last
    random = (a * last + b) % m
    randoms.push(random)
  end
  randoms
end

class RandomTest < Test::Unit::TestCase
  def test_random_array
    assert_equal([5,7,10,9,2,8], random_array(0,6,7,5,11))
  end
end
