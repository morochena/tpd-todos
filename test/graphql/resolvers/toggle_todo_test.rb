require 'test_helper'

class Resolvers::ToggleTodoTest < ActiveSupport::TestCase 
    def perform(args = {})
        
        Resolvers::ToggleTodo.new.call(nil, args, {})
    end

    test 'toggling todo' do 
        todo = Todo.create(title: 'Test Todo', completed: false)

        todo = perform(
            id: todo.id 
        )
        assert_equal todo.completed, true 

        todo = perform(
            id: todo.id 
        )
        assert_equal todo.completed, false
    end

end