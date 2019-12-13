class Trainer::PokemonsController < ApplicationController

  

  def create
    @pokedex = Pokedex.find(params[:pokedex_id])
    @pokemon = Pokemon.find(1)
    @pokedex.user = current_user
    @pokedex.pokemons << @pokemon
    authorize @pokedex
    if @pokedex.save
    redirect_to pokemons_path, notice: "#{@pokemon.name} has been added to your Pokédex"
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:pokemon_id])
    @pokedex = Pokedex.find(params[:pokedex_id])
    authorize @pokedex
    @pokedex.pokemon.destroy
    redirect_to pokedex_path(@pokedex), notice: "#{@pokemon.name} has been removed from your Pokédex"
  end

end
