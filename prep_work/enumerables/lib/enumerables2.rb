require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
    return 0 if arr.length < 1
    arr.reduce(:+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
    long_strings.each do |el|
        return false if !el.include?(substring)
    end
    true
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
    arr = []
    string.chars.sort.each do |el|
        arr << el if string.count(el) > 1
        string.delete!(el)
    end
    arr[1..-1]
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
    string = string.downcase.gsub(/\W+/, ' ')
    string = string.split(" ").sort_by {|word| word.length }
    string[-2..-1]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
    ("a".."z").reduce([]) do |acc, el|
        if string.include?(el)
            acc
        else
            acc << el
        end
    end
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
    (first_yr..last_yr).reduce([]) do |acc, el|
        if not_repeat_year?(el)
            acc << el
        else
            acc
        end
    end
end

def not_repeat_year?(year)
    year = year.to_s
    year.chars.each do |el|
        return false if year.count(el) > 1
    end
    true
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
    arr = []
    repeats = []

    songs.each_with_index do |song, idx|
        if song == songs[idx+1] || song == songs[idx-1]
            repeats << song
            next
        else
            arr << song
        end
    end
    
    arr.reduce([]) do |acc,el|
        if repeats.include?(el) || acc.include?(el)
            acc
        else
            acc << el
        end
    end    
end

def no_repeats?(song_name, songs)
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
    return("") if string.downcase.count("c") == 0
    string = string.downcase.gsub(/\W+/, ' ')
    string = string.split(" ")
    
    string.reduce do |acc, el|
        if c_distance(acc) >  c_distance(el)
            el
        else
            acc
        end
    end
end

def c_distance(word)
    word.chars.reverse.each_with_index do |el, idx|
        return idx if el == "c"
    end
    9999
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
    result_arr = []
        
    arr.each_with_index do |num, idx|
        if arr[idx-1] == num
            next
        elsif arr[idx+1] == num
            first_idx = idx
            i = idx
            while arr[i] == num
                second_idx = i
                i+= 1                
            end
            result_arr << [first_idx,second_idx]
        end  
    end
    result_arr
end
