Rails.application.routes.draw do
  root "users#index" ## Added because on the big image the root url shows the list of users
  get "/users/:user_id/posts", to: "posts#index", as: "user_posts"
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_post' # new_post
  get '/users/:user_id/posts/new_comment', to: 'comments#new', as: 'new_comment' # new_comment
  get "/users/:user_id/posts/:id", to: "posts#show", as: "user_post"
  get "/users", to: 'users#index'
  get "/users/:id", to: "users#show", as: "user"
end
