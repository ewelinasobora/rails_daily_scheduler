# frozen_string_literal: true

Forecast = Struct.new(:date, :precipitation, :condition)

class ForecastResource
  class << self
    def call(...)
      new(...).tap(&:populate_conditions)
    end
  end

  def initialize(location:, number_of_days:)
    @location = location
    @number_of_days = number_of_days
    @days = []
    @success = false
  end

  attr_reader :days, :location

  def successful?
    @success
  end

  def populate_conditions
    WeatherApi.get(location:, days: @number_of_days).forecast.forecastday.each do |weather|
      days << Forecast.new(date: weather.date.beginning_of_day,
                           precipitation: (weather.day.daily_will_it_rain.zero? ? false : true),
                           condition: weather.day.condition.text)
    end
    @success = true
  end
end
