class RemoveRaffleFromTicketTransaction < ActiveRecord::Migration[5.0]
  def change
    remove_reference :ticket_transactions, :raffle, foreign_key: true
  end
end
