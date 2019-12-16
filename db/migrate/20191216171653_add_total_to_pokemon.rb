class AddTotalToPokemon < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :total ,:integer
  end
end
