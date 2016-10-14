class AddTicketToRaffle < ActiveRecord::Migration[5.0]
  def change
    add_reference :raffles, :winner_ticket, references: :ticket, index: true, null: true
    add_foreign_key :raffles, :tickets, column: :winner_ticket_id
  end
end
