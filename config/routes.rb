Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/order', 'posts#order'
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :categories, only: [:create, :destroy, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
