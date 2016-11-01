class DummyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Running job with params #{args}"
  end
end
