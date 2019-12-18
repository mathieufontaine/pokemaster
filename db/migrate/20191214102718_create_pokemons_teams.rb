class CreatePokemonsTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons_teams do |t|
      t.integer :team_id
      t.integer :pokemon_id
    end
  end
end
