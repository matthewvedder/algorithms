require 'test/unit'

def raise_to(number, power)
  factors = [number * number]
  factors.unshift number if power.odd?
  exponent = 4
  while exponent <= power
    factors.push( factors.last * factors.last )
    exponent *= 2
  end
  puts factors
  factors.reduce(:*)
end

class RaiseToTest < Test::Unit::TestCase
  def test_raise_to
    assert_equal(8, raise_to(2, 3))
    assert_equal(64, raise_to(2, 6))
    assert_equal(16, raise_to(2, 4))
    assert_equal(73296297596894671194679467281666017876936144887237684747595248746205105058136664662597084059678669544148492467642033016554778566668452647644046940902679823589082567348293472699134109889519, raise_to(79, 99))
  end
end
