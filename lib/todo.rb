class Todo
  def initialize(task) # task is a string
    @task = task
    @done = false
  end

  attr_reader :task

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @done = true
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    @done
  end
end
