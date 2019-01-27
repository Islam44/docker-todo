Types::TodoType = GraphQL::ObjectType.define do
  name 'Todo'
  field :id, !types.ID
  field :content, !types.String
  field :position, !types.Int
  field :complete, !types.Boolean
end
