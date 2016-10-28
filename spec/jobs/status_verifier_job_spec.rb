require 'rails_helper'

RSpec.describe StatusVerifierJob, type: :job do
  include ActiveJob::TestHelper
  let(:package_transaction) { FactoryGirl.create :package_transaction }
  let(:job) { StatusVerifierJob.perform_later(package_transaction.id) }

  before do
    allow_any_instance_of(Cielo::Transaction).to receive(:verify!).and_return({
      :transacao=> {
        :status=>"6"
      }
    })
  end

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in urgent queue' do
    expect(StatusVerifierJob.new.queue_name).to eq('default')
  end

  it 'executes perform' do
    expect_any_instance_of(PackageTransaction).to receive(:verify_status)
    perform_enqueued_jobs { job }
  end

  it 'handles no results error' do
    allow_any_instance_of(PackageTransaction).to receive(:verify_status).and_raise

    perform_enqueued_jobs do
      expect_any_instance_of(StatusVerifierJob)
        .to receive(:retry_job).with(wait: 1.hour, queue: :default)
      job
    end
  end
end
