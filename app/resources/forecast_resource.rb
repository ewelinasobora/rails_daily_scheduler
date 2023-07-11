# frozen_string_literal: true

class ForecastResource
  def initialize(location)
    @location = location
  end

  attr_reader :location

  # :disable:reek:FeatureEnvy:
  def weekly
    WeatherApi.get(location:).forecast.forecastday.each_with_object({}) do |day, week|
      week[day.date] = (day.day.daily_will_it_rain.zero? ? false : true)
    end
  end
end
# :enable:reek:FeatureEnvy:
