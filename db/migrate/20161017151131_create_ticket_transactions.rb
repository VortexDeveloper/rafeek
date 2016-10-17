class CreateTicketTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :ticket_transactions do |t|

      t.timestamps
    end
  end
end
