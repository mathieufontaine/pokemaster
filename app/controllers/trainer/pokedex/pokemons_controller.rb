class Trainer::Pokedex::PokemonsController < ApplicationController
  before_action :set_team, only: [ :create, :destroy]


  def create
    @pokemon = Pokemon.find(params[:id])
    @team.user = current_user
    @team.pokemons << @pokemon
    authorize @team
    if @team.save
    redirect_to request.referrer, notice: "Gotcha! #{@pokemon.name} has been added to your team"
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:pokemon_id])
    authorize @team
    @team.pokemon.destroy
    redirect_to team_path(@team), notice: "#{@pokemon.name} has been removed from your team"
  end

private

  def set_team
    @team = Team.find(params[:team_id])
    authorize @team
  end

end
