class PokedexesController < ApplicationController
   # before_action :set_pokedex, only: [:show]
   before_action :set_pokedex, only: [:show]
   skip_before_action :authenticate_user!, only: [:index, :show]
   before_action :skip_authorization

  def index
  	@pokedexes = policy_scope(Pokedex).sort {|a,b| b.pokemons.count <=> a.pokemons.count}
    
    @pokedexes.each do |pokedex|
    @total_power = pokedex_power(pokedex)
    end
  end
  

  def show
    @pokedex = Pokedex.find(params[:id])
    @pokemons = policy_scope(Pokemon).where(pokedex: @pokedex)

    @total_power = pokedex_power(@pokedex)
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

  def pokedexes_power(pokedexes)
    pokedexes.each do |poke|
    pokedex_power(poke)
    end
  end


  def pokedex_power(pokedex)
    array = []
    pokedex.pokemons.each do |pokemon|
      array << pokemon.total
    end
    array.inject(0){|sum,x| sum + x }
  end



  private

  def set_pokedex
    @pokedex = Pokedex.find_by(id: params[:pokedex_id])
  end

  def pokedex_params
    params.require(:pokedex).permit(:name, :user_id)
  end
end