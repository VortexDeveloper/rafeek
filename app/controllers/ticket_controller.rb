class TicketController < ApplicationController
  def purchase
    @purchase = {amount: params[:amount], raffle: Raffle.find(params[:raffle_id])}
    Ticket.create!(current_user, @purchase)
    verify_balance
  end

  def verify_balance
    needed_points = @purchase[:amount]*@purchase[:raffle].points
    user_points = current_user.account.balance

    if needed_points > user_points
      @transaction.tickets.each { |t| t.pending! }

      #deveria ser página de compra de pacotes que ainda não existe
      redirect_to root_path
    end
  end

  def account
    current_user.account
  end
end
