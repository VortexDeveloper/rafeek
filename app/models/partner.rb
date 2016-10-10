class Partner < ApplicationRecord
  belongs_to :user

  def registered_by
    user
  end
end
