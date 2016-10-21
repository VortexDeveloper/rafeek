class PackageTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :package

  CIELO_STATUS = {
    authenticated: 2,
    not_authenticated: 3,
    authorized: 4,
    not_authorized: 5,
    captured: 6,
    in_canceled: 12,
    canceled: 9
  }

  STATUS_MESSAGE = {
    authenticated: "Compra autenticada, aguarde a validação do banco.",
    not_authenticated: "Compra não autenticada.",
    authorized: "Compra autorizada, aguarde a validação do banco.",
    not_authorized: "Compra não autorizada",
    captured: "Compra efetuada com sucesso!",
    in_canceled: "Compra em cancelamento.",
    canceled: "Compra cancelada."
  }

  attr_accessor :card_data

  def cielo_value
    "#{package.value.fix.to_i}#{(package.value.frac*100).to_i}"
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

  def verify_status
    cielo_transaction = Cielo::Transaction.new
    byebug
    status = cielo_transaction.verify!(tid)[:transacao][:status]
    save
  end

  def captured?
    CIELO_STATUS.key(status) == :captured
  end

  def status_message
    STATUS_MESSAGE[CIELO_STATUS.key(status)]
  end

  private
  def prepare_cielo_params
    {
      numero: package.id,
      valor: cielo_value,
      moeda: "986",
      bandeira: card_data[:cartao_bandeira],
      :"url-retorno" => 'http://localhost:3000',
      cartao_numero: card_number,
      cartao_validade: card_data[:cartao_validade],
      cartao_seguranca: card_data[:cartao_seguranca],
      cartao_portador: card_data[:cartao_portador]
    }
  end

  def validate_card_number
    true
  end
end
