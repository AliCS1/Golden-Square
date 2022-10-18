class TodoList
    def initialize
        @tasksToDo = []
        @tasksCompleted = []
    end

    def add(todo)
        @tasksToDo.push(todo)
         # todo is an instance of Todo
      # Returns nothing
    end
  
    def incomplete
        a = ""
        for i in 0..@tasksToDo.length-1
            a += @tasksToDo[i].task
            a += ", "
        end
        a = a[0..a.length-3]
        return a
      # Returns all non-done todos
    end
  
    def complete
        a = ""
        for i in 0..@tasksCompleted.length-1
            a += @tasksCompleted[i].task
            a += ", "
        end
        a = a[0..a.length-3]
        return a
      # Returns all complete todos
    end

    def complete_task(str)
        @tasksToDo.each{|task| 
            if task.task == str
                task.mark_done!
                @tasksCompleted.push(task)
            end
        }
        @tasksToDo.delete_if{|task| task.done? == true}
    end

    def give_up!
        @tasksToDo.each{|task|
            @tasksCompleted.push(task)
        }
        @tasksToDo = []
      # Marks all todos as complete
    end
  end