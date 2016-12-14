class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.valid?
      p = Profile.new profile_params
      p.user = resource
      p.country = Country.first
      p.save!
      Account.create!(user: resource)
    end
  end

  def profile_params
    params.require(:profile).permit(
      :name,
      :last_name,
      :avatar,
      :sex,
      :birth_date,
      :street,
      :complement,
      :neighborhood,
      :city_id,
      :city,
      :state_id,
      :state,
      :zip_code
    )
  end
end
