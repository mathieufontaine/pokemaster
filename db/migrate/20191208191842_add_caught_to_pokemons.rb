class AddCaughtToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :caught, :boolean, default: false
  end
end
