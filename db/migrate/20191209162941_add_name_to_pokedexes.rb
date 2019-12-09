class AddNameToPokedexes < ActiveRecord::Migration[5.2]
  def change
    add_column :pokedexes, :name, :string
  end
end
