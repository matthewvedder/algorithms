require 'test/unit'

# indexes: p <= q < r
def merge(numbers, p, q, r)
  left = numbers[p..q]
  right = numbers[q + 1..r]
  i = 0
  j = 0
  (p..r).each do |k|
    puts k
    if left[i] == nil
      numbers[k] = right[j]
      j += 1
    elsif right[j] == nil
      numbers[k] = left[i]
      i += 1
    else
      if left[i] <= right[j]
        numbers[k] = left[i]
        i += 1
      else
        numbers[k] = right[j]
        j += 1
      end
    end
  end
  numbers
end

def merge_sort(numbers,p,r)
  if p < r
    q = (p + r) / 2
    merge_sort(numbers, p, q)
    merge_sort(numbers, q + 1, r)
    merge(numbers, p, q, r)
  end
end


class MergeSortTest < Test::Unit::TestCase
  def test_merge
    assert_equal([9,9,1,1,1,2,2,3,4,5,9,9], merge([9,9,1,2,2,4,1,1,3,5,9,9],2,5,9))
  end
  def test_merge_sort
    assert_equal([1,1,1,2,2,3,4,5,9,9,9,9], merge_sort([9,9,1,2,2,4,1,1,3,5,9,9],0,11))
    assert_equal([3, 9, 26, 38, 41, 49, 52, 57], merge_sort([3,41,52,26,38,57,9,49],0,7))
  end
end
