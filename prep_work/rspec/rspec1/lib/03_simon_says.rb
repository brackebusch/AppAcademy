def echo(string)
    string
end

def shout(string)
    string.upcase
end

def repeat(string, num = 2)
    str = ""
    num.times do |word|
        str << string + " "
    end
    str.strip
end

def start_of_word(string, num = 0)
    string[0...num]
end

def first_word(string)
    string.split(" ")[0]
end

def titleize(string)
    string = string.split(" ")

    string.map! do |word|
        if (word.length > 3 || word == string[0]) && word != "over"
           word = word.capitalize
        else
            word
        end
    end

    string.join(" ")
end