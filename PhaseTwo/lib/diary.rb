# File: lib/diary.rb
class Diary
    def initialize
        @books = []
    end
  
    def add(entry)
        @books.push(entry)
         # entry is an instance of DiaryEntry
      # Returns nothing
    end
  
    def all
        bookTitles = []
        @books.each{|b| bookTitles.push(b.title)}
        return bookTitles.join(', ')

      # Returns a list of instances of DiaryEntry
    end
  
    def count_words
        num = 0
        @books.each { |b|
            num += b.contents.count(" ") + 1

        }
        return num
      # Returns the number of words in all diary entries
      # HINT: This method should make use of the `count_words` method on DiaryEntry.
    end
  
    def reading_time(wpm)
        num = count_words
        return num.to_i/wpm
         # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # if the user were to read all entries in the diary.
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
        words = wpm*minutes
        l = []
        bookChosen = -1
        bookWords = 0
        for i in 0..@books.length-1
            currentwords = @books[i].contents.count(" ")+1
            if currentwords > bookWords && currentwords <= words
                bookChosen = i
                bookWords = currentwords
            end
        end
        return "You can read " + @books[bookChosen].title
          # `wpm` is an integer representing the number of words the user can read
          # per minute.
          # `minutes` is an integer representing the number of minutes the user
          # has to read.
      # Returns an instance of diary entry representing the entry that is closest 
      # to, but not over, the length that the user could read in the minutes they
      # have available given their reading speed.
    end
  end