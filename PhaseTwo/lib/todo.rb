# File: lib/todo.rb
class Todo
    def initialize(task) # task is a string
      @task = task
      @completed = false
    end
  
    def task
        return @task
      # Returns the task as a string
    end
  
    def mark_done!
    @completed = true
      # Marks the todo as done
      # Returns nothing
    end
  
    def done?
    return @completed
      # Returns true if the task is done
      # Otherwise, false
    end
  end