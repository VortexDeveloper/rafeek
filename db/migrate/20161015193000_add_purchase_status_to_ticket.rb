class AddPurchaseStatusToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :purchase_status, :integer
  end
end
