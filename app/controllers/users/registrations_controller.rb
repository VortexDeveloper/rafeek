class Users::RegistrationsController < Devise::RegistrationsController
    def create
        super
        Profile.create!(user: resource)
        Account.create!(user: resource)
    end
end
