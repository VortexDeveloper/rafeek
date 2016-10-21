class AddRaffleToTicketTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :ticket_transactions, :raffle, foreign_key: true
  end
end
