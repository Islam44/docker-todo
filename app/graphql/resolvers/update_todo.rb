class Resolvers::UpdateTodo < GraphQL::Function
  # arguments passed as "args"
  argument :id, !types.ID
  argument :content, !types.String
  argument :complete, !types.Boolean

  # return type from the mutation
  type Types::TodoType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context
  def call(obj, args, ctx)
    params = args.to_h.with_indifferent_access

    Todo.find(params.delete(:id)).tap { |todo| todo.update(params) }
  rescue ActiveRecord::RecordInvalid => e
    # this would catch all validation errors and translate them to GraphQL::ExecutionError
    GraphQL::ExecutionError.new("Error ,Read Me: #{e.record.errors.full_messages.join(', ')}")
  end
end
