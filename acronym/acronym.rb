=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end
class Acronym
    def self.abbreviate(name)
      name.split.map { |word|
        if word.include?('-')
          word.split('-').map{ |hyphened_words| hyphened_words[0].upcase }
        else
          word[0].upcase
        end
      }.join
    end
end

name = "Psefse Nsefsefse Gsefsef"
puts Acronym.abbreviate(name)