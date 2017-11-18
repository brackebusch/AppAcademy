# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  arr = []
  num = nums[0]
  until num == nums[-1]
    arr << num if nums.include?(num) == false
    num += 1
  end
  arr
end

# Write a method that given a string representation of a binary number will
# return that binary number in base 10.
#
# To convert from binary to base 10, we take the sum of each digit multiplied by
# two raised to the power of its index. For example:
#   1001 = [ 1 * 2^3 ] + [ 0 * 2^2 ] + [ 0 * 2^1 ] + [ 1 * 2^0 ] = 9
#
# You may NOT use the Ruby String class's built in base conversion method.

def base2to10(binary)
  sum = 0
  binary.reverse.chars.each_with_index do |num, idx|
    sum += ((2**idx) * num.to_i)
  end
  sum
end

class Hash

  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)
    new_hash = {}
    
        self.each do |key, value|
          new_hash[key] = value if prc.call(key, value)
        end
    
        new_hash
      end    

end

class Hash

  # Hash#merge takes a proc that accepts three arguments: a key and the two
  # corresponding values in the hashes being merged. Hash#merge then sets that
  # key to the return value of the proc in a new hash. If no proc is given,
  # Hash#merge simply merges the two hashes.
  #
  # Write a method with the functionality of Hash#merge. Your Hash#my_merge method
  # should optionally take a proc as an argument and return a new hash. If a proc
  # is not given, your method should provide default merging behavior. Do not use
  # Hash#merge in your method.

  def my_merge(hash, &prc)
    prc ||= Proc.new { |k, oldval, newval| newval }
    new_hash = {}

    self.each do |key, value|
      new_hash[key] =  hash[key] ? prc.call(key, value, hash[key]) : value
    end

    hash.each do |key, value|
      new_hash[key] = value if new_hash[key].nil?
    end

    new_hash
  end

end

# The Lucas series is a sequence of integers that extends infinitely in both
# positive and negative directions.
#
# The first two numbers in the Lucas series are 2 and 1. A Lucas number can
# be calculated as the sum of the previous two numbers in the sequence.
# A Lucas number can also be calculated as the difference between the next
# two numbers in the sequence.
#
# All numbers in the Lucas series are indexed. The number 2 is
# located at index 0. The number 1 is located at index 1, and the number -1 is
# located at index -1. You might find the chart below helpful:
#
# Lucas series: ...-11,  7,  -4,  3,  -1,  2,  1,  3,  4,  7,  11...
# Indices:      ... -5, -4,  -3, -2,  -1,  0,  1,  2,  3,  4,  5...
#
# Write a method that takes an input N and returns the number at the Nth index
# position of the Lucas series.

def lucas_numbers(n)
  arr = [2,1,3]
  idx1 = 1
  idx2 = 2

  until arr.length > (n.abs)
    arr << (arr[idx1] + arr[idx2])
    idx1 += 1
    idx2 += 1
  end

  if n < 0 && n.odd?
   return arr[n.abs] * -1
  end

  arr[n.abs]
end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the longest palindrome in a given
# string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
  idx1 = 0
  longest_pal = "oo"
  arr = string.split("")

  while idx1 < arr.length
    idx2 = idx1 +2

    while idx2 < arr.length
      if arr[idx1] == arr[idx2] && arr[idx1..idx2] == arr[idx1..idx2].reverse
        if arr[idx1..idx2].length > longest_pal.length  
          longest_pal = arr.slice(idx1..idx2)
        end 
      end
      idx2 += 1
    end    

    idx1 += 1
  end

  return false if longest_pal == "oo"
  longest_pal.length
end
