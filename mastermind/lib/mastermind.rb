class Code
  PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
    "O" => :orange,
    "P" => :purple
  }

  attr_reader :pegs

  def self.parse(string)
    pegs = string.chars.map do |let|
      raise "parse error" unless PEGS.has_key?(let.upcase)

      PEGS[let.upcase]
    end

    Code.new(pegs)
  end

  def self.random
    pegs = []
    colors = PEGS.keys
    4.times { pegs << colors[rand(0..5)]}

    Code.new(pegs)
  end

  def initialize(pegs)
    @pegs = pegs
  end

  def [](i)
    pegs[i]
  end

  def exact_matches(user_code)
    color_and_place = 0
    pegs.each_index do |i|
      color_and_place +=1 if self[i] == user_code[i]  
    end
    
    color_and_place
  end

  def near_matches(user_code)
    color_not_place = 0
    pegs.each.with_index do |color, i|
      if self[i] != user_code[i] && pegs.include?(color)
        color_not_place +=1 
      end
    end

    color_not_place
  end

  def ==(user_code)
    return false unless user_code.is_a?(Code)

    self.pegs == user_code.pegs
  end

end


class Game
  attr_reader :secret_code

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def play
    10.times do 
      guess = get_guess

      if guess == @secret_code
        puts "You win!"
        return
      end

      display_matches(guess)
    end

    puts "You have lost the game"
  end

  def get_guess
    puts "Guess the colors: "

    begin
      Code.parse(gets.chomp)
    rescue
      puts "Not a valid entry"
      retry
    end
  end

  def display_matches(guess)
    exact_matches = @secret_code.exact_matches(guess)
    near_matches = @secret_code.near_matches(guess)

    puts "You got #{exact_matches} colors and placements correct"
    puts "You got #{near_matches} colors correct but wrong placements"
  end

end




