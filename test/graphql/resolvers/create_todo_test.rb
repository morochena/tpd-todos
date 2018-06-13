require 'test_helper'

class Resolvers::CreateTodoTest < ActiveSupport::TestCase 
    def perform(args = {})
        Resolvers::CreateTodo.new.call(nil, args, {})
    end

    test 'creating new todo' do 
        todo = perform(
            title: 'Test Todo',
            description: 'Description of test todo'
        )

        assert todo.persisted?
        assert_equal todo.title, 'Test Todo'
        assert_equal todo.description, 'Description of test todo'
        assert_equal todo.completed, false
    end

end