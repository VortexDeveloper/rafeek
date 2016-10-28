class DummyJob < ApplicationJob
  queue_as :default

  def perform(params)
    p "running dummy job with params #{params}"
  end
end
