class Resolvers::DeleteTodo < GraphQL::Function
  argument :id, !types.ID
  type Types::TodoType

  def call(obj, args, ctx)
    # TODO: check if `ctx[:current_user`] can actually destroy
    todo = Todo.find(args[:id]) # can throw ActiveRecord::RecordNotFound
    todo.destroy! # destroys the record, can throw
    todo# returns the link so it can be queried.
  end
end
