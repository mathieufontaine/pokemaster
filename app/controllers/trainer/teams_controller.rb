class TeamsController < ApplicationController
  before_action :set_my_pokedex, only: [:show, :edit, :update, :destroy]


  def index
    @my_pokedex_teams = @my_pokedex.teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.my_pokedex = @my_pokedex
    if @team.save
      redirect_to my_pokedex_team_path(@my_pokedex, @team)
    else
      render 'new'
    end
  end

  def show
    @team = Team.find_by(id: params[:id])
    @my_team_pokemons = @team.pokemons.all
  end

  def edit
    @team = Team.find_by(id: params[:id])
    @my_pokedex = MyPokedex.find_by_id(@team.my_pokedex_id)
  end

  def update
    @team = Team.find_by(id: params[:id])
    @my_pokedex = MyPokedex.find_by_id(@team.my_pokedex_id)
      if @team.update(team_params)
        redirect_to my_pokedex_team_path(@my_pokedex, @team)
      else
          render 'edit'
      end
  end

  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Team deleted"
    redirect_to my_pokedex_teams(@current_my_pokedex)
  end

  private

  def set_my_pokedex
    @my_pokedex = MyPokedex.find_by(id: params[:my_pokedex_id])
  end

  def team_params
    params.require(:team).permit(:my_pokedex_id)
  end
end
