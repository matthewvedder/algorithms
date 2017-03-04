require 'test/unit'

def find_primes(max)
  is_composite = []

  (4..max).step(2).each do |i|
    is_composite[i] = true
  end

  next_prime = 3
  stop = Math.sqrt(max)

  while next_prime < stop
    (next_prime * 2..max).step(next_prime).each do |multiple|
      is_composite[multiple] = true
    end

    next_prime += 2

    while next_prime <= max && is_composite[next_prime]
      next_prime += 2
    end
  end
  primes = []
  (2..max).each do |i|
    primes.push(i) unless is_composite[i]
  end
  primes
end

class FindPrimesTest < Test::Unit::TestCase
  def test_find_primes
    assert_equal([2,3,5,7,11,13,17,19], find_primes(20))
    assert_equal([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349], find_primes(350))
  end
end

