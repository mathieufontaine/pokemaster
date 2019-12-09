class Trainer < ApplicationRecord
	has_one :my_pokedex
	has_many :teams, through: :my_pokedex  
	has_many :pokemons, through: :my_pokedex

	def add_to_my_pokedex(pokemon)
	  my_pokedex.pokemons << pokemon
	end

	def add_to_my_team(pokemon)
	  team.my_pokedex.pokemons << pokemon
	end

end
