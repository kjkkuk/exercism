def my_count(&block)
    raise ArgumentError, "wrong" if block.nil?
end

my_count(&:even?)

