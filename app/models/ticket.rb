class Ticket < ApplicationRecord
  belongs_to :raffle
  belongs_to :owner, class_name: 'User'
  belongs_to :ticket_transaction

  enum purchase_status: [:incomplete, :pending, :complete]

  def points
    raffle.points
  end
end
