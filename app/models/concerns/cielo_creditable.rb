module CieloCreditable
  extend ActiveSupport::Concern

  included do
    include AASM

    enum status: {
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

    aasm column: :status do
      state :created, initial: true
      state :authenticated
      state :not_authenticated
      state :authorized
      state :not_authorized
      state :captured
      state :in_canceled
      state :canceled
      state :in_authentication
    end
  end

  STATUS_MESSAGE = {
    "created" => "Transação criada.".freeze,
    "authenticated" => "Compra autenticada, aguarde a validação do banco.".freeze,
    "not_authenticated" => "Compra não autenticada.".freeze,
    "authorized" => "Compra autorizada, aguarde a validação do banco.".freeze,
    "not_authorized" => "Compra não autorizada".freeze,
    "captured" => "Compra efetuada com sucesso!".freeze,
    "in_canceled" => "Compra em cancelamento.".freeze,
    "canceled" => "Compra cancelada.".freeze,
    "in_authentication" => "Compra aguardando autenticação.".freeze
  }

  def initialize_transaction(params)
    cielo_transaction = Cielo::Transaction.new
    cielo_transaction = cielo_transaction.create!(params, :store)
    cielo_transaction
  end

  def status_message
    STATUS_MESSAGE[self.status]
  end

  def cielo_value
    individual_value = BigDecimal.new value
    package_value = BigDecimal.new(package.value)
    "#{individual_value.fix.to_i}#{(package_value.frac*100).to_i}"
  end

  def value
    apply_discounts(package.value * amount)
  end

  def prepare_cielo_params
    {
      moeda: "986",
      bandeira: card_data[:cartao_bandeira],
      cartao_numero: card_number.gsub(' ', ''),
      cartao_validade: format_validity,
      cartao_seguranca: card_data[:cartao_seguranca],
      cartao_portador: card_data[:cartao_portador]
    }
  end

  def format_validity
    card_data[:cartao_validade].split('/').reverse.join("").gsub(" ", '')
  end

  #TODO implementar o método de verificação do cartão
  def validate_card_number
    true
  end

  def update_status(cielo_transaction)
    status = cielo_transaction.verify!(tid)[:transacao][:status]
    status = cielo_transaction.catch!(tid)[:transacao][:status] if authorized?
    update_column 'status', status
  end
end
