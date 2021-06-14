class AboutPlain


    x = 1
    y = 2
    z = 3

    args_array = [x = 1, y = 2, z = 3]
    args_hash = { x: 1, y: 2, z: 3 }


    def about_plain_arguments(*args_array)
        x + y*z
    end

    def about_plain_arguments_with_defaults(x = 1, y = 2, z = 3)
        x + y*z
    end

    def about_keyword_arguments(**args_hash)
        x + y*z
    end

    def about_keyword_arguments_with_defaults(x: 1, y: 2, z: 3)
        x + y*z
    end

end



AboutPlain.new.about_keyword_arguments
AboutPlain.new.about_plain_arguments(args_array, args_hash)
# AboutPlain.new.about_plain_arguments_with_defaults
# AboutPlain.new.about_keyword_arguments_with_defaults

