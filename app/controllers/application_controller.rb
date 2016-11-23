class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :resource, :resource_name, :devise_mapping, :resource_class

  def index

  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def after_sign_in_path_for(resource)
    profile_edit_path
  end

  def authenticate_admin!
    if user_signed_in?
      redirect_to edit_user_registration_path unless current_user.admin?
    else
      redirect_to root_path
    end
  end
end
