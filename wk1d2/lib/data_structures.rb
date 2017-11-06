# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  arr.max - arr.min
  # your code goes here
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  arr == arr.sort
  # your code goes here
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  str.downcase.count("aeiou")
  # your code goes here
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  str.downcase.delete("aeiou")
  # your code goes here
end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
    int.to_s.split("").sort.reverse
  # your code goes here
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
   arr = str.downcase.split("")

   arr.each_with_index do |x, idx|
    if arr.count(x) > 1
      return true if arr[idx+1] = x  
    end
  end

  false
  # your code goes here
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  arr.map!(&:to_s)
  return "(#{arr[0..2].join}) #{arr[3..5].join}-#{arr[6..9].join}"
  # your code goes here
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  arr_of_int = str.split(",").map(&:to_i)
  range(arr_of_int)
  # your code goes here
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  offset = offset % arr.length if offset.abs > arr.length
  p offset
  new_arr = []
  new_arr += arr[offset..-1]
  new_arr += arr[0...offset]
  # arr.delete_at(arr.index (offset+1))
  # your code goes here
end
