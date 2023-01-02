Rails.application.routes.draw do

  # gen recources
  devise_for :users
  resources :test_posts
  resources :likes_you, only: :create
  resources :user
  resources :match, only: :create
  resources :messages
  #resources :admin_tools

  # admin tools
  post 'admin/reset_likes', to: 'admin_tools#reset_likes'
  post 'admin/reset_posts', to: 'admin_tools#reset_posts'
  post 'admin/reset_likes_dislikes', to: 'admin_tools#reset_likes_dislikes'
  post 'admin/reset_matches', to: 'admin_tools#reset_matches'
  get 'admin/search_user', to: 'admin_tools#search_user'
  

  # pages routes
  get 'chat', to: 'pages#chat'
  get 'profile', to: "pages#profile"
  get 'explore', to: "pages#explore"
  get 'admin', to: "pages#admin"

  # custom user routes
  get 'preferences', to: "user#preferences"
  post 'preferences', to: "user#preferences"

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
end
