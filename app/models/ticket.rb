class Ticket < ApplicationRecord
  belongs_to :raffle
  belongs_to :owner, class_name: 'User'
  belongs_to :ticket_transaction

  enum active: [:active, :inactive]

  def points
    raffle.points
  end

  def self.create!(transaction, raffle)
    raise "Invalid amount" if transaction.amount <= 0

    transaction.amount.times do
      t = Ticket.create do |t|
        t.owner = transaction.user
        t.raffle = raffle
        t.ticket_transaction = transaction
      end
    end
  end
end
