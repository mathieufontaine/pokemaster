class UserController::PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :destroy]

  def index
    @pokemons = current_user.pokemons.order(:id)
  end

  def show
  end

  def destroy
    @pokemon = current_user.pokemon
    @pokemon.destroy
    redirect_to pokemons_path(@pokemon), notice: 'pokemon was successfully removed from your Pokédex'
  end

  private

  def set_pokemon
    @pokemon = pokemon.find(params[:id])
  end

end
