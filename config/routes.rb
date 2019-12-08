Rails.application.routes.draw do


  devise_for :users
  root to: 'pokemons#index'

  resources :pokemons, only: [:index, :new, :create, :show, :edit, :update]

  namespace :user do
      resources :pokemons, only: [:index, :show, :destroy]
    end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
