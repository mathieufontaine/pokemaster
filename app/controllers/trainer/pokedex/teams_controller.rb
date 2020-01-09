class Trainer::Pokedex::TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :skip_authorization



  def index
    # @user = current_user
    @teams = policy_scope(Team).order(:name)
    # authorize(@user)
  end

  def show
    @pokemons = policy_scope(Pokemon).where(team: @team)
    @total_power = team_power(@team)
  end

  def new
    @team = Team.new
    authorize @team
  end

  def create
    @team = Team.new(team_params)
    @team.user = current_user

    if @team.save
      redirect_to trainer_teams_path(@trainer), notice: 'Gotcha! Your Team was successfully created'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
      if @team.update(team_params)
        redirect_to trainer_team_path(@trainer, @team)
      else
          render 'edit'
      end
  end

  def destroy
    flash[:success] = "Team deleted"
    redirect_to trainer_teams_path(@trainer)
  end


  def team_power(team)
    array = []
    team.pokemons.each do |pokemon|
      array << pokemon.total
    end
    array.inject(0){|sum,x| sum + x }
  end


  private

  def set_team
    @team = Team.find(params[:id])
    # authorize @team
  end

  def team_params
    params.require(:team).permit(:name, :user_id)
  end

end



