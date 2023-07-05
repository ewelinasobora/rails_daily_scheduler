# frozen_string_literal: true

require 'sidekiq-scheduler'

class WaterPlantEventWorker
  include Sidekiq::Worker

  def perform
    ForecastResource.new.weekly.each do |date, rain|
      unless rain
        Event.create!(start_date: date.beginning_of_day, end_date: date.end_of_day, user: User.first,
                      text: 'Water your outdoor plants!')
      end
    end
  end
end
