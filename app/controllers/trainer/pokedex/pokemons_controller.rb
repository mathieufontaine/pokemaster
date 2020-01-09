class Trainer::Pokedex::PokemonsController < ApplicationController
  before_action :set_team, only: [ :create, :destroy]


  def create
    @pokemon = Pokemon.find(params[:id])
    @team.user = current_user
    if @team.pokemons.include?(@pokemon)
        redirect_to request.referrer, notice: "#{@pokemon.name} is already in your team!"
    elsif @team.pokemons.size == 6
        redirect_to request.referrer, notice: "Your team can't include more than 6 Pokémons. Remove some Pokémons from your #{@team.name} or add #{@pokemon.name} to another team."
    else
        @team.pokemons << @pokemon
    end
    authorize @team
    if @team.save
    redirect_to request.referrer, notice: "Gotcha! #{@pokemon.name} has been added to your team."
    end
  end

  def destroy
    @pokemon = @team.pokemons.find(params[:id])
    authorize @team
    @team.pokemons.destroy(params[:id])
    redirect_to trainer_pokedex_team_path(@team), notice: "#{@pokemon.name} has been removed from your team."
  end

private

  def set_team
    @team = Team.find(params[:team_id])
    authorize @team
  end

end

