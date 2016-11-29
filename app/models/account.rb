class Account < ApplicationRecord
  belongs_to :user

  def extract(points)
    self.balance ||= 0
    self.balance -= points
    save
  end

  def credit(points)
    self.balance ||= 0
    self.balance += points
    save
  end
end
