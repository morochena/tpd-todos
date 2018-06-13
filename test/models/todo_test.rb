require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "valid todo" do
    todo = Todo.new(title: 'Test Todo', description: 'A test todo', completed: false)
    assert todo.valid?
  end

  test "invalid without title" do
    todo = Todo.new(description: 'A test todo', completed: false)
    refute todo.valid? 
    assert_not_nil todo.errors[:title], 'no validation error for title present'
  end

  test "invalid without completed" do 
    todo = Todo.new(title: 'Test Todo', description: 'A test todo')
    refute todo.valid? 
    assert_not_nil todo.errors[:completed], 'no validation error for completed present'
  end

end
