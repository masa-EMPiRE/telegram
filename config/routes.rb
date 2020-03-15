Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :comments, only: [ :create, :destroy ]
  resources :users, only: :show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'comments' => redirect('posts')
  root 'posts#index'
end
