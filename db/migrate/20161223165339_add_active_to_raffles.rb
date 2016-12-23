class AddActiveToRaffles < ActiveRecord::Migration[5.0]
  def change
    add_column :raffles, :active, :integer, default: 1
  end
end
