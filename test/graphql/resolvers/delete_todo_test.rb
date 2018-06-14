require 'test_helper'

class Resolvers::DeleteTodoTest < ActiveSupport::TestCase 
    def perform(args = {})
        Resolvers::DeleteTodo.new.call(nil, args, {})
    end

    test 'deleting todo' do 
        todo = Todo.create(title: 'Test Todo', completed: false)

        assert_difference('Todo.count', -1) do 
            todo = perform(
                id: todo.id 
            )
        end

    end

end