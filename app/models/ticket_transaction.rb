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

  def raffle
    # byebug
    if self.pending?
      Raffle.new title: "Transação não finalizada", description: "Transação não finalizada", amount: 0, points: 0
    else
      self.tickets.first.raffle
    end
  end

  def save
    raise "StatusError" unless self.complete?
    super
  end
end
