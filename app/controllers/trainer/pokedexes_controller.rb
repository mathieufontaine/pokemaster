class Trainer::PokedexesController < ApplicationController
   # before_action :set_trainer, only: [:show, :edit, :update, :destroy]
   before_action :set_pokedex, only: [:show, :edit, :update, :destroy]


  def show
    @pokemons = @pokedex.pokemons.all
  end

  def edit
    # @trainer = Trainer.find_by_id(@pokedex.trainer_id)
  end

  def update
    # @trainer = Trainer.find_by_id(@pokedex.trainer_id)
      if @pokedex.update(pokedex_params)
        redirect_to trainer_pokedex_path(@trainer, @pokedex)
      else
          render 'edit'
      end
  end

  def destroy
    @pokedex.destroy
    flash[:success] = "Your Pokedex has been deleted"
    redirect_to pokemons_path
  end

  private

  # def set_trainer
  #   @trainer = Trainer.find_by(id: params[:trainer_id])
  # end

  def set_pokedex
    @pokedex = Pokedex.find_by(id: params[:id])
    # authorize @team
  end

  def pokedex_params
    params.require(:pokedex).permit(:name, :trainer_id)
  end
end