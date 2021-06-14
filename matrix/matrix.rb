=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
	attr_reader :rows, :columns
	def initialize(list)
		array = []
		rows = list.split("\n")
		rows.each { |row| array << row.split.each.map(&:to_i) }
		@rows = array
		@columns = array.transpose
	end
end