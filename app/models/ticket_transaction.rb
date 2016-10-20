class TicketTransaction < ApplicationRecord
  has_many :tickets
  belongs_to :user

  enum status: [:pending, :complete]

  def verify_balance(raffle)
    return false if user.account.balance < value(raffle)
    true
  end

  def perfom_transaction(raffle)
    user.account.extract(value(raffle))
    Ticket.create!(self, raffle)
    complete!
  end

  def value(raffle)
    self.amount*raffle.points
  end
end
