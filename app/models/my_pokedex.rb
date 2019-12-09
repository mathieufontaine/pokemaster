class MyPokedex < ApplicationRecord
	belongs_to :trainer
	has_many :teams
	has_and_belongs_to_many :pokemons
end
