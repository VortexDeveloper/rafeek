Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Middleware::Server::RetryJobs, :max_retries => 5
  end
end
