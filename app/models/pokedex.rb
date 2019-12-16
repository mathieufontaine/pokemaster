class Pokedex < ApplicationRecord
	belongs_to :user
	has_many :teams
	has_and_belongs_to_many :pokemons

	def is_trainer?(user)
	  self.user == user
	end




  # def pokedex_power(pokemons)
  #   array = []
  #   self.pokemons.each do |pokemon|
  #     array << pokemon.total
  #   end
  #   array.inject(0){|sum,x| sum + x }
  # end


end
