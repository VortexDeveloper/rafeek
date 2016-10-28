class StatusVerifierJob < ApplicationJob
  queue_as :default
  # sidekiq_options retry: 5

  rescue_from(StandardError) do
    retry_job wait: 1.minute, queue: :default
  end

  def perform(id)
    puts "executou aqui"
    # raise
    transaction = PackageTransaction.find id
    transaction.verify_status
  end
end
