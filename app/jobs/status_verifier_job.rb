class StatusVerifierJob < ApplicationJob
  queue_as :default

  #Resgatar parâmetros do Job para imprimir no log o id da transação
  rescue_from(StandardError) do
    logger.debug "Reagendando job"
    retry_job wait: 1.hour, queue: :default
  end

  def perform(id)
    logger.debug "Início da transação: #{id}"
    transaction = PackageTransaction.find id
    transaction.verify_status(Cielo::Transaction.new)
    logger.debug "Fim da transação: #{id}"
  end
end
