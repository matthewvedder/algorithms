require 'test/unit'

# indexes: p <= q < r
def merge(numbers,p,q,r)
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

def merge_insertion(numbers,p,r,k)
  if numbers.length <= k
    insertion_sort(numbers)
  else
    if p < r
      q = (p + r) / 2
      merge_insertion(numbers,p, q, k)
      merge_insertion(numbers,q + 1,r, k)
      merge(numbers,p,q,r)
    end
  end
end

def insertion_sort(numbers)
  length = numbers.length - 1
  (1..length).each do |j|
    current = numbers[j]
    i = j - 1
    while i >= 0 && numbers[i] > current do
      numbers[i + 1] = numbers[i]
      numbers[i] = current
      i = i - 1
    end
  end
  numbers
end

class MergeInsertionTest < Test::Unit::TestCase
  def test_merge_insertion
    assert_equal([1,1,1,2,2,3,4,5,9,9,9,9], merge_insertion([9,9,1,2,2,4,1,1,3,5,9,9],0,11,4))
    assert_equal([3, 9, 26, 38, 41, 49, 52, 57], merge_insertion([3,41,52,26,38,57,9,49],0,7,4))
  end
end


