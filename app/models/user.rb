class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_one :pokedex, dependent: :destroy
 has_many :teams, dependent: :destroy  
 has_many :pokemons, through: :pokedex
 mount_uploader :avatar, PhotoUploader

 validates :email, presence: true, uniqueness: true
 # validates :username, presence: true, uniqueness: true

	 def add_to_my_pokedex(pokemon)
	   @pokedex.pokemons << pokemon
	 end

	 def add_to_my_team(pokemon)
	   @team.pokedex.pokemons << pokemon
	 end

end
