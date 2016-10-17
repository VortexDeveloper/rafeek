class TicketController < ApplicationController
  def purchase
    @purchase = {amount: params[:amount], raffle: Raffle.find params[:raffle_id]}
    create!
    verify_balance
  end

  def create!
    @transaction = TicketTransaction.create!
    @purchase[:amount].times do
      Ticket.create do |t|
        t.owner = current_user
        t.raffle = @purchase[:raffle]
        t.incomplete!
        t.ticket_transaction = @transaction
      end
    end
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
