class Raffle < ApplicationRecord
  has_many :tickets
  belongs_to :winner_ticket, class_name: 'Ticket', optional: true

  def amount_sold
    tickets.count
  end

  def tickets_available
    amount - amount_sold
  end

  def random_select
    winner_ticket = tickets.sample
    update_attributes winner_ticket_id: winner_ticket.id
    winner_ticket
  end

  def winner
    winner_ticket.owner
  end
end
