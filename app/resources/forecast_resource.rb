# frozen_string_literal: true

Forecast = Struct.new(:date, :precipitation)

class ForecastResource
  class << self
    def call(...)
      new(...).tap(&:populate_weekly_conditions)
    end
  end

  def initialize(location)
    @location = location
    @week = []
    @success = false
  end

  attr_reader :location, :week

  def successful?
    @success
  end

  def populate_weekly_conditions
    WeatherApi.get(location:).forecast.forecastday.each do |weather|
      @week << Forecast.new(date: weather.date, precipitation: (weather.day.daily_will_it_rain.zero? ? false : true))
    end
    @success = true
  end
end
