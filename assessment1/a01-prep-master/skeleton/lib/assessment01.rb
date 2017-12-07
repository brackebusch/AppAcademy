require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &block)
    i = 0
    if accumulator.nil?
      accumulator = self.first
      i+=1
    end

    while i < length
      accumulator = block.call(accumulator, self[i])
      i+=1
    end

    accumulator
  end
  
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).none? {|factor| num % factor == 0}
end

def primes(num)
  prime_numbers = []
  counter = 2

  until prime_numbers.count >= num
    prime_numbers << counter if is_prime?(counter)
    counter+=1
  end

  prime_numbers
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1

  currrent_list = factorials_rec(n-1)
  currrent_list << currrent_list.last * currrent_list.length
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hsh = Hash.new {|h,k| h[k] = []}

    each_with_index do |item, index|
      hsh[item] << index
    end

    hsh.select {|key,val| val.count > 1}
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    arr = []

    self.chars.each_with_index do |let, idx|
      second_index = idx+1
      while second_index < self.length
        if self[idx..second_index] == self[idx..second_index].reverse
          arr << self[idx..second_index]
        end
        second_index+=1
      end
    end

    arr
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.length <= 1
  end

  private
  def self.merge(left, right, &prc)
  end
end
