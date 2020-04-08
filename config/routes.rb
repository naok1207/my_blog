Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/order', 'posts#order'
  get 'categories/order', 'categories#order'
  get 'categories/serch', 'categories#serch'
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :categories, only: [:create, :destroy, :index, :show]
  resources :admin, only: [:new, :create, :destroy, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
