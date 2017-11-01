Rails.application.routes.draw do
  resources :games
  resources :questions
  resources :subgenres
  resources :genres
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'home#index'
  post '/games/:id', to: 'games#submit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
