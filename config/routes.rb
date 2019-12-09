Rails.application.routes.draw do



  devise_for :users
  root to: 'pokemons#index'

  resources :pokemons, only: [:index, :show, :new, :create, :edit, :update]


  namespace :trainers do
    resources :my_pokedexes, only: [:show, :new, :create, :edit, :update, :destroy]
      resources :teams
    end

  resources :types, only: [:index, :show]

  resources :attacks, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
