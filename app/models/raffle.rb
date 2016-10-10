class Raffle < ApplicationRecord
  has_many :tickets

  def amount_sold
    tickets.count
  end

  def tickets_available
    amount - amount_sold
  end
end
