Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments, :likes
    end
  end
end
