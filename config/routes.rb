Rails.application.routes.draw do
  resources :books
  resources :usergroups
  resources :groups
  resources :posts
  resources :discussions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
