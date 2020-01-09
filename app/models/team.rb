class Team < ApplicationRecord
	belongs_to :user
	belongs_to :pokedex
	has_and_belongs_to_many :pokemons


	def is_trainer?(user)
	  self.user == user
	end
end
