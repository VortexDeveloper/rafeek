class UserController < ApplicationController
  before_action :authenticate_user!

  layout "admin", :only => [:index, :edit_admin]

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = current_user
  end

  def tickets
    @tickets = Ticket.where("owner_id = ?", current_user.id)
  end

  def points
    @points = current_user.account.balance
    @tickets_transactions = TicketTransaction.where("user_id = ?", current_user.id)
  end

  def performed_transactions
    @performed_transactions = PackageTransaction.where("user_id = ?", current_user.id)
    .order(id: :desc)
  end

  def raffle(raffle_id)
    Raffle.where("id = ?", raffle_id)
  end

  def index
    @users = User.all
  end

  def edit_admin
    @user = User.find params[:id]
  end

end
