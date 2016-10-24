class PackageTransactionController < ApplicationController
  def purchase
    if params[:package_id].present?
      @transaction = PackageTransaction.create package_transaction_params
      @transaction.card_data = card_data_params
      @transaction.url_retorno = validate_purchase_url(@transaction.id)
      redirect_to @transaction.make_transaction
    end
  end

  def validate_purchase
    @transaction = PackageTransaction.find params[:id]
    @transaction.verify_status
    redirect_to after_validate_path, notice: @transaction.status_message
  end

  private
  def after_validate_path
    return pages_raffles_path if @transaction.captured?
    pages_packages_path
  end

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
      status: 14,
      package_id: params[:package_id],
      card_number: params[:cartao_numero],
      tid: nil
    }
  end
end
