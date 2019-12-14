class Trainer::PokemonsController < ApplicationController
  before_action :set_pokedex, only: [ :create, :destroy]


  def create
    @pokemon = Pokemon.find(params[:id])
    @pokedex.user = current_user
    @pokedex.pokemons << @pokemon
    authorize @pokedex
    if @pokedex.save
    redirect_to pokemons_path, notice: "Gotcha! #{@pokemon.name} has been added to your Pokédex"
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:pokemon_id])
    authorize @pokedex
    @pokedex.pokemon.destroy
    redirect_to pokedex_path(@pokedex), notice: "#{@pokemon.name} has been removed from your Pokédex"
  end

private

  def set_pokedex
    @pokedex = Pokedex.find(params[:pokedex_id])
    authorize @pokedex
  end

end
