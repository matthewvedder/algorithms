require 'test/unit'

# simulate rolling two six sided die
def dice
  rand(1..6) + rand(1..6)
end

class DiceTest < Test::Unit::TestCase
  def test_dice
    results = { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0, 10 => 0, 11 => 0, 12 => 0 }
    1000.times do
      results[dice] += 1
    end
    assert results[7] > results[3]
    assert results[4] > results[11]
    assert results[8] > results[12]
  end
end
