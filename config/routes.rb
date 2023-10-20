Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/users', to: 'users#index' , as: 'users'
  get '/users/:id', to: 'users#show' , as: 'user'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

   get '/home', to: 'app#home', as:'home'
  root 'app#home'
  # Defines the root path route ("/")
  # root "articles#index"
end
