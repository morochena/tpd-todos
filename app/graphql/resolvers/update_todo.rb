class Resolvers::UpdateTodo < GraphQL::Function 
    argument :id, !types.ID
    argument :title, types.String
    argument :description, types.String

    type Types::TodoType 

    def call(_obj, args, _ctx)
        todo = Todo.find(args[:id])
        
        if args[:title]
            todo.title = args[:title]
        end

        if args[:description]
            todo.description = args[:description] 
        end

        todo.save!
        todo

        rescue Mongoid::Errors::DocumentNotFound => e 
            GraphQL::ExecutionError.new("Todo does not exist!")
    end
end
