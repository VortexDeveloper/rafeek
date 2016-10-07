class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :state
  belongs_to :country
end
