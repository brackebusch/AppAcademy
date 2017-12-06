# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
    attr_accessor :towers

    def initialize
        @towers = [[3,2,1], [], []]
    end

    def play
        puts "Welcome to Towers Of Hanoi."
        render

        until won?
            puts "Select tower to move from (1, 2, or 3)"
            from_tower = gets.chomp.to_i
            puts "Select tower to move to (1, 2, or 3)"
            to_tower = gets.chomp.to_i
            move(from_tower, to_tower)
        end

        puts "You won the game, well done!"
    end

    def render
        puts " #{check_spot(@towers[0][2])}    #{check_spot(@towers[1][2])}    #{check_spot(@towers[2][2])}"
        puts " #{check_spot(@towers[0][1])}    #{check_spot(@towers[1][1])}    #{check_spot(@towers[2][1])}"
        puts " #{check_spot(@towers[0][0])}    #{check_spot(@towers[1][0])}    #{check_spot(@towers[2][0])}"
        puts "---  ---  ---"
        3.times {puts "\n"}
    end

    def check_spot(disk)
        if disk == nil
            return "0"
        else
            return disk.to_s
        end
    end

    def won?
        return true if @towers[1] == [3,2,1] || @towers[2] == [3,2,1]
        false
    end

    def valid_move?(from_tower, to_tower)
        return true if @towers[from_tower] != [] && (@towers[to_tower] == [] || @towers[to_tower].last > @towers[from_tower].last)
        false
    end

    def move(from_tower, to_tower)
        if valid_move?(from_tower, to_tower)
            @towers[to_tower].push(@towers[from_tower].pop)
            render
        else
            raise "That is not a legal move."
        end
    end

end
#{@towers[to_tower].last} is greater than #{@towers[from_tower].last}