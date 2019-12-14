class AddPowerPointToAttacks < ActiveRecord::Migration[5.2]
  def change
  	add_column :attacks, :power_point, :string
  end
end
