class Resolvers::CreateTodo < GraphQL::Function
  # arguments passed as "args"
  argument :content, !types.String
  argument :position, !types.Int
  argument :complete, !types.Boolean

  # return type from the mutation
  type Types::TodoType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context
  def call(obj, args, ctx)
    Todo.create!(
        content: args[:content],
        position: args[:position],
        complete: args[:complete]
    )
  rescue ActiveRecord::RecordInvalid => e
    # this would catch all validation errors and translate them to GraphQL::ExecutionError
    GraphQL::ExecutionError.new("Intput May be Blank For Details ,Read Me: #{e.record.errors.full_messages.join(', ')}")
  end
end
