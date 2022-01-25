Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :posts do
      resources :comments, :likes
    end
  end
  delete '/users/:user_id/posts/:id', to: 'posts#destroy', as: "delete_post"
  root :to => 'users#index'
end
