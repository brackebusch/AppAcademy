NUMBERS = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
    100 => "hundred",
    1000 => "thousand",
    1_000_000 => "million",
    1_000_000_000 => "billion",
    1_000_000_000_000 => "trillion",
}

class Fixnum
    def in_words
        return NUMBERS[self] if self < 20

        numbers_to_read = []
        sum = self
        divisor = 1_000_000_000_000

        until sum < 100
            if sum / divisor >= 1
                numbers_to_read << tens_numbers(sum/divisor) << divisor
                sum -= divisor * (sum / divisor)
            end

            if divisor >= 1_000_000
                divisor /= 1000            
            else
                divisor /= 10
            end
        end

        numbers_to_read << tens_numbers(sum)

        numbers_to_read.flatten.reduce("") {|acc, el| acc << NUMBERS[el] + " "}.strip
    end

    def tens_numbers(sum)
        return_numbers = []
        
        if sum > 100
        return_numbers << sum / 100 << 100
        sum -= sum / 100 * 100
        end

        if sum > 20 && sum % 10 == 0
            return_numbers << (sum / 10) * 10
        elsif sum > 20
            return_numbers << (sum / 10) * 10 
            sum -= (sum / 10) * 10
            return_numbers << sum             
        elsif sum != 0 && sum <= 20
            return_numbers << sum 
        end

        return_numbers
    end
end