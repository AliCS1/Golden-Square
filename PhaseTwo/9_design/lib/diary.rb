class Diary
    def initialize
        @entries = []
        @todo_list = []
    end

    def add(entry)
        @entries << entry
    end

    def entries
        fail "There are no entries" if @entries.empty?
        return @entries
    end

    def content(entry)
        return @entries[entry].contents
    end

    def allContents
        contents = []
        @entries.each {|entry| 
            contents << entry.contents
        }
        return contents
    end

    def ChooseDiary(time,wpm)
        fail 'There are no entries in the diary' if @entries.empty?
        current_reading = "TEST"
        current_time = -1
        @entries.each {|entry| 
            if entry.reading_time(time,wpm)
                if current_time == -1
                    current_reading = entry
                    current_time = entry.time_it_takes_to_read(time,wpm)
                end
                if entry.time_it_takes_to_read(time,wpm) > current_time
                    current_reading = entry
                    current_time = entry.time_it_takes_to_read(time,wpm)
                end
                
            end
        }
        fail "You cannot read any entry in that time." if current_time == -1
        
        return current_reading

    
    end

    def add_task(task)
        @todo_list << task
    end

    def to_do_list
        fail "There are no tasks in the list" if @todo_list.empty?
        return @todo_list
    end
end