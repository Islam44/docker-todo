Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createTodo, function: Resolvers::CreateTodo.new
  field :updateTodo, function: Resolvers::UpdateTodo.new
  field :updatePosition, function: Resolvers::UpdatePosition.new
  field :deleteTodo, function: Resolvers::DeleteTodo.new
end
