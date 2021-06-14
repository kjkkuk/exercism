=begin
Write your code for the 'Queen Attack' exercise in this file. Make the tests in
`queen_attack_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/queen-attack` directory.
=end

class Queens
    def initialize(**queens)
      @white = queens[:white]
      @black = queens[:black]
      raise ArgumentError if invalid?(@white) || invalid?(@black)
    end
  
    def attack?
      same_row? || same_column? || diagonal?
    end
  
    private
  
    def same_row?
      @white[0] == @black[0]
    end
  
    def same_column?
      @white[1] == @black[1]
    end
  
    def diagonal?
      (@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
    end
  
    def invalid?(coordinates)
      coordinates&.find { |num| !num.between?(0, 7) }
    end
  end