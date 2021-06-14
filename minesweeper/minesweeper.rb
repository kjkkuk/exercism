=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end

# require 'pry'

class Board
  def initialize(board)
    @board = board
    raise ArgumentError unless valid?
  end

  attr_accessor :board

  def self.transform(board)
    board = self.new(board)
    board.count_mines
  end

  def count_mines
    board.each_with_index.map do |row, row_index|
      row.split('').each_with_index.map { |cell, cell_index|
        cell != " " ? cell : count_bombs(row_index, cell_index)
      }.join
    end
  end

  def count_bombs(row_index, cell_index)
    bomb_count =  board[row_index - 1][cell_index-1..cell_index+1].count('*') +
                  board[row_index    ][cell_index-1..cell_index+1].count('*') +
                  board[row_index + 1][cell_index-1..cell_index+1].count('*')
    bomb_count == 0 ? " " : bomb_count
  end

  def valid?
    valid_bottom_and_top? &&
    valid_sides? &&
    valid_chars? &&
    valid_lengths?
  end

  def valid_bottom_and_top?
    board[0] == board[-1] && /^\+-+\+$/ === board[0]
  end

  def valid_sides?
    board[1...-1].all? do |row|
      row[0] == row[-1] &&
      row[0] == '|'
    end
  end

  def valid_chars?
    board[1...-1].all? { |row| /^[ *]+$/ === row[1...-1] }
  end

  def valid_lengths?
    board.all? { |row| row.length == board[0].length }
  end
end