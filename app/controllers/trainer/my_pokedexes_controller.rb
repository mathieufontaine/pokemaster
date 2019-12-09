class MyPokedexesController < ApplicationController
   before_action :set_trainer, only: [:show, :edit, :update, :destroy]

  def new
    @my_pokedex = MyPokedex.new
  end

  def create
    @my_pokedex = MyPokedex.new(my_pokedex_params)
    @my_pokedex.trainer = @trainer
    if @my_pokedex.save
      redirect_to trainer_my_pokedex_path(@trainer, @my_pokedex)
    else
      render 'new'
    end
  end

  def show
    @my_pokedex = MyPokedex.find_by(id: params[:id])
    @my_pokemons = @my_pokedex.pokemons.all
  end

  def edit
    @my_pokedex = MyPokedex.find_by(id: params[:id])
    @trainer = Trainer.find_by_id(@my_pokedex.trainer_id)
  end

  def update
    @my_pokedex = MyPokedex.find_by(id: params[:id])
    @trainer = Trainer.find_by_id(@my_pokedex.trainer_id)
      if @my_pokedex.update(my_pokedex_params)
        redirect_to trainer_my_pokedex_path(@trainer, @my_pokedex)
      else
          render 'edit'
      end
  end

  def destroy
    MyPokedex.find(params[:id]).destroy
    flash[:success] = "MyPokedex deleted"
    redirect_to trainer_my_pokedexes(@current_trainer)
  end

  private

  def set_trainer
    @trainer = Trainer.find_by(id: params[:trainer_id])
  end

  def my_pokedex_params
    params.require(:my_pokedex).permit(:trainer_id)
  end
end