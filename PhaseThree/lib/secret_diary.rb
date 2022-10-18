class SecretDiary
    def initialize(diary)
        @diary = diary
        @lock = false # diary is an instance of Diary
      # ...
    end
  
    def read
        if @lock == true
            return "Go away!"
        end
        return @diary.read
      # Raises the error "Go away!" if the diary is locked
      # Returns the diary's contents if the diary is unlocked
      # The diary starts off locked
    end
  
    def lock
        @lock = true
      # Locks the diary
      # Returns nothing
    end
  
    def unlock
        @lock = false
      # Unlocks the diary
      # Returns nothing
    end
  end

  class TaskFormatter
    def initialize(task)
        @task = task # task is an instance of Task
    end
  
    def format
        if @task.complete
            return [@task.title]
        else
            return [ ]
      # Returns the task formatted as a string.
      # If the task is not complete, the format is:
      # - [ ] Task title
      # If the task is complete, the format is:
      # - [x] Task title
    end
  end 
end