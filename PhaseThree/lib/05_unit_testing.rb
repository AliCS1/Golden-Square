class InteractiveCalculator
    def initialize(io)
        @io = io
    end

    def run
        @io.puts("Hello. I will subtract two numbers.")
        @io.puts("Please enter a number")
        num1 = @io.gets.chomp
        @io.puts("Please enter another number")
        num2 = @io.gets.chomp
        @io.puts("Here is your result:")
        @io.puts(num1 + " - "+num2 + " = "+((num1.to_i)-(num2.to_i)).to_s)
    end
end

class StringRepeater
    def initialize(io)
        @io = io
    end

    def run
        @io.puts("Hello. I will repeat a string many times.")
        @io.puts("Please enter a string")
        word = @io.gets.chomp
        @io.puts("Please enter a number of repeats")
        num = @io.gets.chomp
        @io.puts("Here is your result:")
        r = ""
        for i in 0..num.to_i-1
            r += word
        end
        @io.puts(r)
    end
end