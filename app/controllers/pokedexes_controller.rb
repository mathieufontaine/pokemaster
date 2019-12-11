class PokedexesController < ApplicationController
   # before_action :set_pokedex, only: [:show]
   before_action :set_pokedex, only: [:show]
   skip_before_action :authenticate_user!, only: [:index, :show]
   before_action :skip_authorization

  def index
  	@pokedexes = policy_scope(Pokedex)
  end
  	
  def show
    @pokedex = Pokedex.find(params[:id])
    @pokemons = policy_scope(Pokemon).where(pokedex: @pokedex)
  end

  def new
    @pokedex = Pokedex.new
    authorize @pokedex
  end

  def create
    @pokedex = Pokedex.new(pokedex_params)
    @pokedex.user = current_user

    authorize @pokedex
    if @pokedex.save
      current_user.role = 'trainer'
      current_user.save
      redirect_to pokedexes_path, notice: 'Gotcha! Your Pokédex was successfully created'
    else
      render :new
    end
  end




  private

  def set_pokedex
    @pokedex = Pokedex.find_by(id: params[:pokedex_id])
  end

  def pokedex_params
    params.require(:pokedex).permit(:name, :user_id)
  end
end