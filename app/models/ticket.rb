class Ticket < ApplicationRecord
  belongs_to :raffle
  belongs_to :owner, class_name: 'User'

  def points
    raffle.points
  end
end
