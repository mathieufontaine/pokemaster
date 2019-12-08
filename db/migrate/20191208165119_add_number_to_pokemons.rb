class AddNumberToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :number, :integer
  end
end
