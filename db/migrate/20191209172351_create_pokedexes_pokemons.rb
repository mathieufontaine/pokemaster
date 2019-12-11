class CreatePokedexesPokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokedexes_pokemons do |t|
      t.integer :pokedex_id
      t.integer :pokemon_id
    end
  end
end
