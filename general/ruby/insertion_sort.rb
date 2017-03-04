require 'test/unit'


def insertion_sort(array)
  array_length = array.length - 1
  (0..array_length).each do |index|
    current_value = array[index]
    position = index
    while position > 0 && array[position-1] > current_value
      array[position] = array[position-1]
      array[position-1] = current_value
      position -= 1
    end
  end
  array
end


def random_array(length)
  array = []
  length.times do
    array.push rand(length)
  end
  array
end



class InsertionSortTest < Test::Unit::TestCase
  def test_insertion_sort
  assert_equal([1,2,3,4,5,6], insertion_sort([5,2,4,6,1,3]))
    assert do
      sorted = insertion_sort(random_array(1000))
      sorted_length = sorted.length - 1
      100.times do
        rand_indexes = [rand(0..sorted_length / 2), rand(sorted_length / 2 + 1..sorted_length)]
        @sorted_bool = sorted[rand_indexes[0]] <= sorted[rand_indexes[1]]
        break if @sorted_bool == false
      end
      @sorted_bool
    end
  end
end
