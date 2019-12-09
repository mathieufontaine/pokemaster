class PokedexesController < ApplicationController
   before_action :set_trainer, only: [:show]
   before_action :set_pokedex, only: [:show]
   skip_before_action :authenticate_user!, only: [:index]

  def index
  	@pokedexes = Pokedex.all
  end
  	
  def show
  	@pokedex = Pokedex.find(params[:id])
  end

  def new
    @pokedex = Pokedex.new
    # authorize @pokedex

  end

  def create
    @pokedex = Pokedex.new(pokedex_params)
    @pokedex.user = current_user
    # authorize @pokedex
    if @pokedex.save
    	current_user.role = 'trainer'
    	current_user.save
      redirect_to trainer_pokedex_path(@pokedex), notice: 'Gotcha! Your Pokédex was successfully created'
    else
      render 'new'
    end
  end

  def show
    @pokedex = Pokedex.find_by(id: params[:id])
    @pokemons = @pokedex.pokemons.all
  end


  private

  def set_trainer
    @trainer = Trainer.find_by(id: params[:trainer_id])
  end

  def pokedex_params
    params.require(:pokedex).permit(:name, :trainer_id)
  end
end