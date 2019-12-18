class TeamsController < ApplicationController
   before_action :set_team, only: [:show]
   skip_before_action :authenticate_user!, only: [:index, :show]
   before_action :skip_authorization


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



  private

  def set_pokedex
    @pokedex = MyPokedex.find_by(id: params[:pokedex_id])
  end

  def team_params
    params.require(:team).permit(:pokedex_id)
  end
end
