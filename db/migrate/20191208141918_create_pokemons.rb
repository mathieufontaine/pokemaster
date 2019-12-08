class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.float :height
      t.integer :weight
      t.string :picture
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
