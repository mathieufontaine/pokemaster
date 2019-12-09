class CreatePokemonMyPokedexes < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon_my_pokedexes do |t|
      t.integer :my_pokedex_id
      t.integer :pokemon_id
    end
  end
end
