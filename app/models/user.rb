class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_one :pokedex
 has_many :teams, through: :pokedex  
 has_many :pokemons, through: :pokedex

	 def add_to_my_pokedex(pokemon)
	   @pokedex.pokemons << pokemon
	 end

	 def add_to_my_team(pokemon)
	   @team.pokedex.pokemons << pokemon
	 end

end
