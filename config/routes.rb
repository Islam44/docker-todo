Rails.application.routes.draw do
  get 'demo/index'
  root to: "demo#index"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
   mount GraphqlPlayground::Rails::Engine, at: '/graphql/playground', graphql_path: '/graphql'
  end
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
