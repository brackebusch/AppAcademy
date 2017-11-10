# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
    str.chars.each do |ch|
        str.delete!(ch) if ch.downcase == ch
    end 
    str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
    return str[(str.length)/2] if str.length.odd?
    str[str.length/2-1]+str[str.length/2]
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
    count = 0

    str.chars.each do |ch|
        count +=1 if VOWELS.include?(ch.downcase)
    end

    count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
    factoral = 1
    while num > 0
        factoral *= num
        num -= 1
    end
    
    factoral
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
    new_string = ""
    
    arr.each do |item|
        new_string += item + separator
    end

    return new_string if separator == ""
    new_string[0...-1]
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
    str.downcase!

    str.each_char.with_index do |ch, idx|
        str[idx] = ch.upcase if idx.odd?
    end

    str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
    str = str.split(" ")
    arr = []
    str.each do |item|
        item = item.reverse if item.length > 4
        arr << item
    end
    my_join(arr, " ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
    (1..n).to_a.map { |int| 
        if int % 3 == 0 && int % 5 == 0
            int = "fizzbuzz"
        elsif int % 5 == 0
            int = "buzz"
        elsif int % 3 == 0
            int = "fizz"
        end
        int
    }
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
    new_arr = []
    arr.each { |el|
        new_arr.unshift(el)
    }
    new_arr
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
    return false if num == 1  
    (2..(num/2)).each { |counter| return false if num % counter == 0 }
    true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
    arr =[]
    (1..num).each { |x|
        arr << x if num % x == 0
    }
    arr
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
    arr = factors(num)
    final = []

    arr.each { |i|
       final << i if prime?(i)
    }

    final
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
    prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
    odd_count = 0
    even_count = 0
    idx1 = nil
    idx2 = nil

    arr.each.with_index do |x, idx|
        if x.odd?
            odd_count +=1
            idx1 = idx
        else
            even_count +=1
            idx2 = idx
        end

        if odd_count > 1 && even_count
            return arr[idx2]
        elsif even_count > 1 && odd_count
            return arr[idx1]
        end
    end
    


end
