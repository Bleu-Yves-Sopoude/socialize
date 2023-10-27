Rails.application.routes.draw do
<<<<<<< HEAD
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
  devise_for :users
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[new create]
=======
  root to: "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create ] do
      resources :comments, only: [:create, :new]
       resources :likes, only: [:create, :new] 
>>>>>>> dev
    end
  end
end