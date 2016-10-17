class Ticket < ApplicationRecord
  belongs_to :raffle
  belongs_to :owner, class_name: 'User'
  belongs_to :ticket_transaction

  enum purchase_status: [:incomplete, :pending, :complete]

  def points
    raffle.points
  end

  def self.create!(user, args)
    raise "Invalid amount" if args[:amount].to_i <= 0
    
    transaction = TicketTransaction.create!
    args[:amount].to_i.times do
      Ticket.create do |t|
        t.owner = user
        t.raffle = args[:raffle]
        t.purchase_status = :incomplete
        t.ticket_transaction = transaction
      end
    end
    transaction
  end
end
