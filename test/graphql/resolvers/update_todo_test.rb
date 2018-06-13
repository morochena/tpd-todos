require 'test_helper'

class Resolvers::UpdateTodoTest < ActiveSupport::TestCase 
    def perform(args = {})
        Resolvers::UpdateTodo.new.call(nil, args, {})
    end

    test 'update a todo' do 
        todo = Todo.create(title: 'Test Todo', description: 'A cool todo', completed: false)

        todo = perform(
            id: todo.id,
            title: 'Another Test Todo',
        )
        assert_equal todo.title, 'Another Test Todo'
        assert_equal todo.description, 'A cool todo'

        todo = perform(
            id: todo.id,
            description: 'A cooler todo'
        )

        assert_equal todo.title, 'Another Test Todo'
        assert_equal todo.description, 'A cooler todo'
    end

end