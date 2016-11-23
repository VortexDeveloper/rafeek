class PackageTransactionController < ApplicationController
  skip_before_action  :verify_authenticity_token
  layout "admin", :only => [:performed_transactions]

  def purchase
    if params[:package_id].present?
      @transaction = PackageTransaction.create package_transaction_params
      @transaction.card_data = card_data_params
      @transaction.url_retorno = validate_purchase_url(@transaction.id)
      begin
        redirect_to @transaction.make_transaction
      rescue
        redirect_to package_path(params[:package_id]), notice: 'Dados inválidos'
      end
    end
  end

  def validate_purchase
    @transaction = PackageTransaction.find params[:id]
    StatusVerifierJob.perform_now(params[:id])
    redirect_to performed_path(@transaction)
  end

  def performed_transactions
    @performed_transactions = PackageTransaction.all
  end

  private
  def card_data_params
    {
      cartao_bandeira: params[:bandeira],
      cartao_validade: params[:cartao_validade],
      cartao_seguranca: params[:cartao_seguranca],
      cartao_portador: params[:cartao_portador]
    }
  end

  def package_transaction_params
    {
      amount: params[:amount] || 1,
      user: current_user,
      package_id: params[:package_id],
      card_number: params[:cartao_numero],
      tid: nil
    }
  end
end
