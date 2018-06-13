class Resolvers::CreateTodo < GraphQL::Function 
    argument :title, !types.String
    argument :description, types.String

    type Types::TodoType 

    def call(_obj, args, _ctx)
        Todo.create!(
            title: args[:title],
            description: args[:description],
            completed: false
        )
    end
end
