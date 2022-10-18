class DiaryEntry 
    def initialize(title,contents)
        @title = title
        @contents = contents
        @phone_numbers = []
    end

    def title
        return @title
    end
    def contents
        return @contents

    end
    def word_count
        return @contents.count(" ")+1
    end

    def reading_time(time,wpm)
        count = word_count
        return count.to_f <= time.to_f*wpm/60
    end

    def time_it_takes_to_read(time,wpm)
        #contents = 20 words
        #we have 30 seconds
        #we can read 60 words per minute
        #this means 1 word per second
        #so contents/word per second
        return (word_count.to_f)/(wpm/60)
    end

    def add_phone_number(number)
        @phone_numbers << number
    end

    def get_phone_numbers
        fail 'No phone numbers added' if @phone_numbers.empty?
        return @phone_numbers
    end
end