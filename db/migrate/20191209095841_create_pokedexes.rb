class CreatePokedexes < ActiveRecord::Migration[5.2]
  def change
    create_table :pokedexes do |t|
    	
    	t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
