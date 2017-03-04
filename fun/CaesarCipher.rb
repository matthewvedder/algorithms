require 'test/unit'

class CaesarCipher
  def initialize(shift)
    @shift = shift
  end

  def encode(string)
    shifted_string = ''
    upcase = string.upcase.split('')
    upcase.each do |character|
      if character.ord < 65 || character.ord > 90
        shifted_string += character
      else
        sum = character.ord + @shift
        if sum <= 90 && sum
          shifted_string += sum.chr
        elsif sum > 90
          shifted_string += (sum - 90 + 64).chr
        end
      end
    end
    shifted_string
  end

  def decode(string)
    shifted_string = ''
    upcase = string.upcase.split('')
    upcase.each do |character|
      if character.ord < 65 || character.ord > 90
        shifted_string += character
      else
        diff = character.ord - @shift
        if diff >= 65
          shifted_string += diff.chr
        elsif diff < 65
          shifted_string += ((91 - (65 - diff)).chr)
        end
      end
    end
    shifted_string
  end
end


class CaesarCipherTest < Test::Unit::TestCase
  def test_cipher
    c=CaesarCipher.new(5)

    assert_equal(c.encode('Codewars'), 'HTIJBFWX')
    assert_equal(c.decode('HTIJBFWX'), 'CODEWARS')
    assert_equal(c.encode('WAFFLES'), 'BFKKQJX')
    assert_equal(c.decode('BFKKQJX'), 'WAFFLES')
    assert_equal(c.encode("IT'S A SHIFT CIPHER!!"), "NY'X F XMNKY HNUMJW!!")
    assert_equal(c.decode("NY'X F XMNKY HNUMJW!!"), "IT'S A SHIFT CIPHER!!")
  end
end
