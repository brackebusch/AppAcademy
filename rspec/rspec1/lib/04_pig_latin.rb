def translate(string)
    words = string.split(" ")
    
    words.map! do |word|
        change_word(word)    
    end
    
    words.join(" ")
end

def change_word(word)
    start = 0

    word.each_char.with_index do |let, idx|
        if let == 'u' && word[idx-1] == 'c' || word[idx-1] == 'q'
            next
        elsif 'aeiou'.include?(let)
            start = idx
            break
        end
    end

    word[start..-1] + word[0...start] + "ay"
end