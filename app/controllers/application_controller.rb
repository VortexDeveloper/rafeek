class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
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
    user_edit_path
  end
end
