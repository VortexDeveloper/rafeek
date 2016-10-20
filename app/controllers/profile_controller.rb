class ProfileController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)

    redirect_to profile_edit_path
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
      :state_id,
      :country_id,
      :zip_code,
      :avatar
    )
  end
end
