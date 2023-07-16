# frozen_string_literal: true

# require 'sidekiq-scheduler'

class CreateWeeklyForecastWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)

    ForecastEvents::Create.call(location: user.location, user:)
  end
end
