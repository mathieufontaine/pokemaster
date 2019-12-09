class CreateMyPokedexes < ActiveRecord::Migration[5.2]
  def change
    create_table :my_pokedexes do |t|
    	
    	t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
