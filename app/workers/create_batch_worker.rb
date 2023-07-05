# frozen_string_literal: true

require 'sidekiq-scheduler'

class CreateBatchWorker
  include Sidekiq::Worker

  def perform
    uniq_locations = User.distinct.pluck(:location)
    batch = Sidekiq::Batch.new
    batch.description = 'Create Batch Worker'
    batch.on(:success, CreateBatchWorker, { 'cluster_id' => 999 })

    batch.jobs do
      5.times { ForecastEvents::Update.call(uniq_locations) }
    end
  end
end

class Created
  def on_success(status, options)
    Rails.logger.debug '----'
    Rails.logger.debug status, options
    Rails.logger.debug 'Created cluster.'
  end
end
