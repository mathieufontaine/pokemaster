class Pokemon < ApplicationRecord
  belongs_to :type
  has_many :attacks, through: :type
  has_and_belongs_to_many :pokedexes
  has_and_belongs_to_many :teams

end
