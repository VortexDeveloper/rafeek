class AddTicketTransactionToTicket < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :ticket_transaction, foreign_key: true
  end
end
