class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :city, optional: true
  belongs_to :state, optional: true
  belongs_to :country, optional: true
end
