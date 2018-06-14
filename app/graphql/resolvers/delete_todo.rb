class Resolvers::DeleteTodo < GraphQL::Function 
    argument :id, !types.ID

    type Types::TodoType 

    def call(_obj, args, _ctx)
        Todo.find(args[:id]).destroy!
        true
        
        rescue Mongoid::Errors::DocumentNotFound => e 
            GraphQL::ExecutionError.new("Todo does not exist!")
    end
end
