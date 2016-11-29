class ProfileController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)

    redirect_to request.referrer
  end

  private
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
      :country_id,
      :zip_code,
      :avatar
    )
  end
end
