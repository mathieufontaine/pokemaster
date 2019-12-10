class Trainer::TeamsController < ApplicationController
  before_action :set_pokedex, only: [:show, :edit, :update, :destroy]


  def index
    @pokedex_teams = @pokedex.teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.pokedex = @pokedex
    if @team.save
      redirect_to pokedex_team_path(@pokedex, @team)
    else
      render 'new'
    end
  end

  def show
    @team = Team.find_by(id: params[:id])
    @team_pokemons = @team.pokemons.all
  end

  def edit
    @team = Team.find_by(id: params[:id])
    @pokedex = Pokedex.find_by_id(@team.pokedex_id)
  end

  def update
    @team = Team.find_by(id: params[:id])
    @pokedex = Pokedex.find_by_id(@team.pokedex_id)
      if @team.update(team_params)
        redirect_to pokedex_team_path(@pokedex, @team)
      else
          render 'edit'
      end
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team deleted"
    redirect_to pokedex_teams(@current_pokedex)
  end

  private

  def set_pokedex
    @pokedex = Pokedex.find_by(id: params[:pokedex_id])
  end

  def team_params
    params.require(:team).permit(:pokedex_id)
  end
end
