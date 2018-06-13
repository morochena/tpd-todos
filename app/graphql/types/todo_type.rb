Types::TodoType = GraphQL::ObjectType.define do 
    name 'Todo'

    field :id, !types.ID 
    field :title, !types.String 
    field :description, !types.String 
    field :completed, !types.Boolean
end