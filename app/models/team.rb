class Team < ApplicationRecord
	belongs_to :my_pokedex
	has_many :pokemons, through: :my_pokedex
end
