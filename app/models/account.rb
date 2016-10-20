class Account < ApplicationRecord
  belongs_to :user

  def extract(points)
    self.balance -= points
    save
  end
end
