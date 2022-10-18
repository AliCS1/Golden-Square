class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents
    end
  
    def title
        return @title
      # Returns the title as a string
    end
  
    def contents
        return @contents
      # Returns the contents as a string
    end
  
    def count_words
        a = @contents.split ' '
        return a.length
      # Returns the number of words in the contents as an integer
    end
  
    def reading_time(wpm) 
      return count_words.to_f/wpm
      # wpm is an integer representing the number of words the
                          # user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
    end
end