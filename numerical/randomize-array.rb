require 'test/unit'

# runtime of O(N)

def randomize_array(array)
  array.each_with_index do |element, index|
    random_index = rand(array.length)
    random = array[random_index]
    array[random_index] = element
    array[index] = random
  end
end

puts randomize_array([0,1,2,3,4,5,6,7,8,9])

class RandomizeArrayTest < Test::Unit::TestCase
  def test_randomize_array
    assert_not_equal([0,1,2,3,4,5], randomize_array([0,1,2,3,4,5]))
    assert randomize_array([0,1,2,3,4,5]).is_a?(Array)
    assert randomize_array([0,1,2,3,4,5]).count == 6
    assert randomize_array([0,1,2,3,4,5]).include?(3)
  end
end
