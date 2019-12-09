class CreatePokemonPokedexes < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon_pokedexes do |t|
      t.integer :pokedex_id
      t.integer :pokemon_id
    end
  end
end
