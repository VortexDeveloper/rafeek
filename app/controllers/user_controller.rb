class UserController < ApplicationController
    before_action :authenticate_user!

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = current_user
  end
end