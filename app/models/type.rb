class Type < ApplicationRecord
	has_many :pokemons
	has_many :attacks
end
