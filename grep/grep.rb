=begin
Write your code for the 'Grep' exercise in this file. Make the tests in
`grep_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grep` directory.
=end

class Grep

    def self.grep(pattern, flags, files)
      regex = build_regexp_instance(pattern, flags)
  
      inverse = flags.include?('-v')
      number_lines = flags.include?('-n')
      file_names_only = flags.include?('-l')
      multiple_files = files.length > 1
  
      res = ""
  
      files.each do |file|
        current_file = File.open(file)
        line_number = 1
        res += current_file.readlines.reduce("") {|output, line|
          line = line.chomp
  
          # If match and not inverse, or not match and inverse, output file/line
          if (regex.match?(line) ^ inverse)
            if file_names_only
              break "#{file}\n"
            else
              output.concat(multiple_files ? "#{file}:" : "")
              output.concat(number_lines ? "#{line_number}:" : "")
              output.concat("#{line}\n")
            end
          end
          line_number += 1
          output
        }
      end
      res.chomp
    end
  
    def self.build_regexp_instance(pattern, flags)
      pattern = (flags.include?('-x') ? "^#{pattern}$" : "#{pattern}")
      Regexp.new(pattern, flags.include?('-i'))
    end
  
  end