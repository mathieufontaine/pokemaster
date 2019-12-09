class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :team  
  
  def add_to_my_pokedex(pokemon)
    my_pokedex.pokemons << pokemon
  end

end
