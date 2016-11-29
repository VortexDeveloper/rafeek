class AddActiveToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :active, :integer, default: 1, limit: 1
  end
end
