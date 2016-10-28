# ActiveJob::Base.queue_adapter = :sidekiq
# Sidekiq.configure_server do |config|
#   config.server_middleware do |chain|
#     chain.add Sidekiq::Middleware::Server::RetryJobs, :max_retries => 5
#   end
#   config.redis = { url: 'redis://127.0.0.1:6379' }
# end

# Sidekiq.configure_client do |config|
#   config.redis = { url: 'redis://127.0.0.1:6379' }
# end
