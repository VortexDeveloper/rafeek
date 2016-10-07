class Users::RegistrationsController < Devise::RegistrationsController
    def create
        super
        Profile.create!(user: resource)
    end
end
