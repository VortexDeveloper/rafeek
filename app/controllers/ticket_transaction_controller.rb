class TicketTransactionController < ApplicationController
  def purchase
    @transaction = TicketTransaction.create do |t|
      t.status = :pending
      t.amount = params[:amount].to_i
      t.user = current_user
    end
    perfom_purchase
  end

  private
  def perfom_purchase
    if @transaction.verify_balance(raffle)
      @transaction.perfom_transaction(raffle)
      redirect_to root_path, notice: "Compra efetuada com sucesso!"
    else
      redirect_to packages_path, notice: "Você não possui pontos suficientes"
    end
  end

  def raffle
    Raffle.find params[:raffle_id]
  end
end
