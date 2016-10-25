class TicketController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  def index
    @tickets = Ticket.all
  end

end
