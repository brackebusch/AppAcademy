# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
    hsh = Hash.new
    str.split.each do |x|
        hsh[x] = x.length
    end
    hsh
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
    hash.sort_by {|k,v| v}[-1][0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
    newer.each do |k, v| 
        older[k] = v
    end
    older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
    count = Hash.new(0)
    word.chars do |let|
        count[let] += 1
    end
    count
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
    hsh = Hash.new
    arr.each do |x|
        if hsh.has_key?(x)
            next
        else
            hsh[x] = 1
        end
    end
    hsh.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
    hsh = {even:0, odd:0}

    numbers.each do |el|
        if el.even?
            hsh[:even] += 1
        else
            hsh[:odd] += 1
        end
    end

    hsh
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
    hsh = Hash.new(0)
    string.chars.each do |let|
        if 'aeiouy'.include?(let)
            hsh[let] +=1
        end
    end
    hsh.sort_by {|k,v| v}[-1][0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
    arr = []

    students.each do |k,v|
        if v > 6
            arr << k
        end
    end

    combo_array = []

    arr.each_with_index do |el, idx|
        while idx < arr.length - 1
            combo_array << [el,arr[idx+1]]
            idx += 1 
        end
    end

    combo_array
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
    hsh = Hash.new(0)
    specimens.each do |x|
        hsh[x] += 1
    end
    arr = hsh.sort_by {|k,v| v}

    hsh.length**2 * (arr[0][1]/arr[-1][1])
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
    sign_1 = Hash.new(0)
    sign_2 = Hash.new(0)

    normal_sign.downcase.chars.each do |char|
        sign_1[char] +=1
    end
    
    vandalized_sign.downcase.chars.each do |char|
        sign_2[char] += 1
    end

    sign_2.each do |k,v|
        if sign_1[k] < sign_2[k]
            return false
        end 
    end
    true
end

def character_count(str)

end
