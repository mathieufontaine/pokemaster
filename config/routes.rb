Rails.application.routes.draw do


  get 'my_pokedex/show'
  get 'my_pokedex/new'
  get 'my_pokedex/create'
  get 'my_pokedex/edit'
  get 'my_pokedex/update'
  get 'my_pokedex/destroy'
  get 'team/index'
  get 'team/show'
  get 'team/new'
  get 'team/create'
  get 'team/edit'
  get 'team/update'
  get 'team/destroy'
  devise_for :users
  root to: 'pokemons#index'

  resources :pokemons, only: [:index, :new, :create, :show, :edit, :update]

  namespace :user do
      resources :pokemons, only: [:index, :show, :destroy]
    end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
