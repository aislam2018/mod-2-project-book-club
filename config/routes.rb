Rails.application.routes.draw do
  resources :books
  resources :usergroups
  resources :groups
  resources :posts
  resources :discussions
  resources :users
  resources :sessions, only:[:new, :create]
  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#show'

end
