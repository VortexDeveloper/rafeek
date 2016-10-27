class StatusVerifierJob < ApplicationJob
  queue_as :default

  rescue_from(StandardError) do
    retry_job wait: 1.hour, queue: :default
  end

  def perform(id)
    transaction = PackageTransaction.find id
    transaction.verify_status
  end
end
