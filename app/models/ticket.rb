class Ticket < ApplicationRecord
  belongs_to :raffle
  belongs_to :user

  def points
    raffle.points
  end
end
