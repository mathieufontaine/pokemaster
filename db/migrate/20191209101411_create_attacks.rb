class CreateAttacks < ActiveRecord::Migration[5.2]
  def change
    create_table :attacks do |t|
      t.string :name
      t.integer :power
      t.integer :precision
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
