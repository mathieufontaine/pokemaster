class Pokedex < ApplicationRecord
	belongs_to :user
	has_many :teams
	has_and_belongs_to_many :pokemons

	def is_trainer?(user)
	  self.user == user
	end
end
