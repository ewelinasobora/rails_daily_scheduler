# frozen_string_literal: true

# require 'sidekiq-scheduler'

class CreateWeeklyForecastWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)

    ForecastEvents::Create.call(user)
  end
end
