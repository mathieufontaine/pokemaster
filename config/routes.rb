Rails.application.routes.draw do


  post   "/trainer/pokedexes/:pokedex_id/pokemons/:id", to: "trainer/pokemons#create", as: :trainer_pokedex_pokemon

  devise_for :users
  root to: 'pokemons#index'


  resources :pokemons, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :pokedexes, only: [:index, :show, :new, :create]

  namespace :trainer do
    resources :pokedexes, only: [:show, :edit, :update, :destroy] do
      resources :pokemons, only: [:new, :destroy]
    end
    resources :teams do
      resources :pokemons, only: [:create, :destroy]
    end
  end

  resources :types, only: [:index, :show] do
    resources :pokemons, only: [:index, :show]
    resources :attacks, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
