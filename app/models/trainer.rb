class Trainer < ApplicationRecord
	has_one :my_pokedex
	has_many :teams, through: :pokedex  
	has_many :pokemons, through: :pokedex

	def add_to_my_pokedex(pokemon)
	  @pokedex.pokemons << pokemon
	end

	def add_to_my_team(pokemon)
	  @team.pokedex.pokemons << pokemon
	end

end
