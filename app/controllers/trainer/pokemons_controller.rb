class Trainer::PokemonsController < ApplicationController
  before_action :set_pokedex, only: [ :create, :destroy]


  def create
    @pokemon = Pokemon.find(params[:id])
    @pokedex.user = current_user
    @pokedex.pokemons << @pokemon
    authorize @pokedex
    if @pokedex.save
    redirect_to pokedex_path(@pokedex), notice: "Gotcha! #{@pokemon.name} has been added to your Pokédex"
    end
  end

  def destroy
    # @pokedex = current_user.pokedex
    @pokemon = @pokedex.pokemons.find(params[:id])
    # authorize @pokedex
    @pokedex.pokemons.destroy(params[:id])
    redirect_to pokedex_path(@pokedex), notice: "#{@pokemon.name} has been removed from your Pokédex"
  end

private

  def set_pokedex
    @pokedex = current_user.pokedex
    authorize @pokedex
  end

end
