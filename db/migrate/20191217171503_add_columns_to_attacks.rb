class AddColumnsToAttacks < ActiveRecord::Migration[5.2]
  def change
    add_column :attacks, :effect, :text
    add_column :attacks, :kind, :string
  end
end
