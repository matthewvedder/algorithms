
def tutnese(english)
  key = {
    'B' => 'Bub',  'K' => 'Kuck',  'S' => 'Sus',
    'C' => 'Cash', 'L' => 'Lul',  'T' => 'Tut',
    'D' => 'Dud', 'M' => 'Mum', 'V' => 'Vuv',
    'F' => 'Fuf', 'N' => 'Nun', 'W' => 'Wack',
    'G' => 'Gug', 'P' => 'Pub',  'X' => 'Ex',
    'H' => 'Hash', 'Q' => 'Quack', 'Y' => 'Yub',
    'J' => 'Jay', 'R'  => 'Rug', 'Z' => 'Zub'
  }

  tutnese_array = []

  english_array = english.upcase.split('')
  english_array.each_with_index do |letter, index|
    if index > 0 && english_array[index-1] == letter
      is_vowel = /[aeiou]/i.match(english_array[index-1]) ? true : false
      is_vowel ? tutnese_array[-1] = 'Squat' : tutnese_array[-1] = 'Squa'
    end
      key[letter] ? tutnese_array.push(key[letter]) : tutnese_array.push(letter)
  end
  tutnese_array.join('')
end

puts 'hello = ' + tutnese('hello')
puts 'My name is Matt Vedder = ' + tutnese('My name is Matt Vedder')


