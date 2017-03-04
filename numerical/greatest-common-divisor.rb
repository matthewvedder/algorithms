require 'test/unit'

def gcd(a,b)
  until b == 0
    remainder = a % b
    a = b
    b = remainder
  end
  a
end

class TestGcd < Test::Unit::TestCase
  def test_gcd
    assert_equal(8, gcd(32, 24))
    assert_equal(1, gcd(7, 22))
    assert_equal(200, gcd(0, 200))
  end
end
