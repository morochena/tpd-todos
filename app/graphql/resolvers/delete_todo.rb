class Resolvers::DeleteTodo < GraphQL::Function 
    argument :id, !types.ID

    type Types::TodoType 

    def call(_obj, args, _ctx)
        todo = Todo.find(args[:id])
        todo.destroy!
        todo
        
        rescue Mongoid::Errors::DocumentNotFound => e 
            GraphQL::ExecutionError.new("Todo does not exist!")
    end
end
