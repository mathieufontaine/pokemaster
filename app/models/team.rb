class Team < ApplicationRecord
	belongs_to :pokedex
	has_and_belongs_to_many :pokemons
end
