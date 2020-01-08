Rails.application.routes.draw do


  get 'types/index'
  get 'types/show'
  post   "/trainer/pokedexes/:pokedex_id/pokemons/:id", to: "trainer/pokemons#create", as: :trainer_pokedex_pokemon
  post   "/trainer/pokedex/teams/:team_id/pokemons/:id", to: "trainer/pokedex/pokemons#create", as: :trainer_team_pokemon


  devise_for :users
  resources :users, only: [:show]

  root to: 'pages#home'


  resources :pokemons, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :pokedexes, only: [:index, :show, :new, :create]
  resources :attacks, only: [:index, :show]
  # resources :teams, only: [:new, :create]

  namespace :trainer do
    resources :pokedexes, only: [:show, :edit, :update, :destroy] do
      resources :pokemons, only: [:new, :destroy]
    end
    namespace :pokedex do
      resources :teams do
        resources :pokemons, only: [:new, :destroy]
      end
    end
  end

  resources :types, only: [:index, :show] do
    resources :pokemons, only: [:index, :show]
    resources :attacks, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
