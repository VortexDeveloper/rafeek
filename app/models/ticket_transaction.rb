class TicketTransaction < ApplicationRecord
  has_many :tickets
  belongs_to :user

  enum status: [:pending, :complete, :paidback]

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
    if self.pending?
      Raffle.new title: "Transação não finalizada", description: "Transação não finalizada", amount: 0, points: 0
    else
      self.tickets.first.raffle
    end
  end

  def payback
    count = how_many_paybacks?
    if count > 0
      total_points = count * raffle.points
      user.account.credit(total_points)
      logger.info "Giving #{total_points} to user #{user.id}"
      inactivate_tickets
    end
  end

  def how_many_paybacks?
    count = 0
    tickets.each do |t|
      count += 1 if t.active?
    end
    count
  end

  def inactivate_tickets
    tickets.each do |t|
      t.inactive!
      logger.info "Inactivating ticket #{t.id}"
    end
  end

  def save
    raise "StatusError" unless self.complete?
    super
  end
end
