Rails.application.routes.draw do
  get 'join', to: 'users#new', as: :join
  post 'join', to: 'users#create'
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout
  root to: 'rooms#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
