class AddLocationToPokemons < ActiveRecord::Migration[5.2]
  def change
  	add_column :pokemons, :location, :string 
  end
end
