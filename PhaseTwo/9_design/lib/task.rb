class Task
    def initialize(task)
        @task = task
        @complete = false
    end

    def task
        return @task
    end

    def complete?
        return @complete
    end
    def completed
        @complete = true
    end
end