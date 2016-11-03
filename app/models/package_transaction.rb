class PackageTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :package
  belongs_to :coupon, optional: true

  CIELO_STATUS = {
    created: 0,
    authenticated: 2,
    not_authenticated: 3,
    authorized: 4,
    not_authorized: 5,
    captured: 6,
    in_canceled: 12,
    canceled: 9,
    in_authentication: 10
  }

  STATUS_MESSAGE = {
    created: "Transação criada.",
    authenticated: "Compra autenticada, aguarde a validação do banco.",
    not_authenticated: "Compra não autenticada.",
    authorized: "Compra autorizada, aguarde a validação do banco.",
    not_authorized: "Compra não autorizada",
    captured: "Compra efetuada com sucesso!",
    in_canceled: "Compra em cancelamento.",
    canceled: "Compra cancelada.",
    in_authentication: "Compra aguardando autenticação."
  }

  attr_accessor :card_data, :url_retorno

  def cielo_value
    "#{value.fix.to_i}#{(package.value.frac*100).to_i}"
  end

  def make_transaction
    if validate_card_number
      params = prepare_cielo_params
      cielo_transaction = Cielo::Transaction.new
      cielo_transaction = cielo_transaction.create!(params, :store)
      update_attributes(
        tid: cielo_transaction[:transacao][:tid],
        status: cielo_transaction[:transacao][:status]
      )
      cielo_transaction[:transacao][:"url-autenticacao"]
    end
  end

  #TODO em caso de status 4, capturar
  #TODO se autenticado, capturado ou cancelado, enviar emails
  def verify_status(cielo_transaction)
    update_attributes(status: cielo_transaction.verify!(tid)[:transacao][:status])
    raise unless captured? || canceled?
    assign_points
  end

  #TODO utilizar a gem aasm para estes 2 métodos abaixo
  def captured?
    CIELO_STATUS.key(status) == :captured
  end

  def canceled?
    CIELO_STATUS.key(status) == :canceled
  end

  def status_message
    STATUS_MESSAGE[CIELO_STATUS.key(status)]
  end

  #TODO implementar o método de verificação do cartão
  def validate_card_number
    true
  end

  def value
    apply_discounts(package.value * amount)
  end

  private
  def prepare_cielo_params
    {
      numero: package.id,
      valor: cielo_value,
      moeda: "986",
      bandeira: card_data[:cartao_bandeira],
      :"url-retorno" => url_retorno,
      cartao_numero: card_number,
      cartao_validade: card_data[:cartao_validade],
      cartao_seguranca: card_data[:cartao_seguranca],
      cartao_portador: card_data[:cartao_portador]
    }
  end

  def assign_points
    user.account.balance += package.points * amount
  end

  def apply_discounts(final_value)
    return final_value unless coupon.present?
    multiplier = (1 - coupon.discount.to_f/100)
    final_value*multiplier
  end
end
