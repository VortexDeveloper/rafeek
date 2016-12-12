class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.valid?
      Profile.create!(user: resource)
      Account.create!(user: resource)
    end
  end
end
