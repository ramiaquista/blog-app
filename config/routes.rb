Rails.application.routes.draw do
  root "users#index" ## Added because on the big image the root url shows the list of users
  get "/users/:user_id/posts", to: "posts#index", as: "user_posts"
  get "/users/:user_id/posts/:id", to: "posts#show", as: "user_post"
  get "/users", to: 'users#index'
  get "/users/:id", to: "users#show", as: "user"
end
