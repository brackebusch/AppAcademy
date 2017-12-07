require 'byebug'

# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  back_shift = -26 + shift
  letters = ("a".."z").to_a
  new_str = ""

  str.chars do |let|
    if letters.include?(let)
      new_str += letters[(letters.find_index(let) + back_shift)]
    else
      new_str += " "
    end
  end
  new_str.chomp
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)

def digital_root(num)
  return num if num < 10
  final = converter(num)

  until final > 0 && final < 10
    final = converter(final)
  end

  final
end

def converter(num)
  arr = []
  reducer = 1000

  while num > 0
    arr << num / reducer
    num -= arr.last * reducer
    reducer /= 10
  end

  arr.reduce(:+)
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  return str.sort if alphabet == nil
  working_string = str.chars
  working_string.sort {|let| alphabet.find_index(let)}
  working_string.join("")
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    arr = []
    self.each_with_index do |num, idx|
      num == 0 ? pair = 0 :pair = -1 * num
      if self.include?(pair) && self.find_index(pair) != idx
        arr << [idx, self.find_index(pair)] unless arr.include?([self.find_index(pair), idx])
      end
    end
    arr.map! {|el| el.sort}
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    result_arr = []
      dictionary.each do |word2|
        result_arr << word2 if self.include?(word2)
      end
    result_arr
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  arr = []
  (1..num).to_a.each do |factor|
    arr << factor if num % factor == 0
  end
  arr
end
