class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo)
    # Returns nothing
    @todo_list.push(todo)
  end

  def incomplete
    # Returns all non-done todos
    incomplete_list = @todo_list.select {|todo|
      !todo.done?
    }

    incomplete_list.map {|todo|
      todo.task
    }.join(', ')
  end

  def complete
    # Returns all complete todos
    complete_list = @todo_list.select {|todo|
      todo.done?
    }

    complete_list.map {|todo|
      todo.task
    }.join(', ')
  end

  def give_up!
    # Marks all todos as complete
    @todo_list.select {|todo|
      todo.mark_done!
    }
  end
end

todo_list = TodoList.new
todo1 = Todo.new('First todo')