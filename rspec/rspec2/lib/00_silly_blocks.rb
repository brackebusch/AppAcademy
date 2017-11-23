def reverser(&proc)
    string = proc.call
    words = string.split(" ")

    words.map! do |word|
        word.reverse
    end

    words.join(" ")
end

def adder(default = 1, &proc)  
    to_add = proc.call
    to_add + default
end

def repeater(repeats = 1, &proc)
    repeats.times {proc.call}
end