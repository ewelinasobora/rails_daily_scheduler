# frozen_string_literal: true

module ForecastEvents
  class Create
    NUMBER_OF_DAYS = 3

    class << self
      def call(...)
        new(...).tap(&:update_events)
      end
    end

    def initialize(user)
      @user = user
      @location = @user.location
    end

    def update_events
      forecast_days = ForecastResource.call(location: @location, number_of_days: NUMBER_OF_DAYS)

      check_if_unsuccessful_forecast_populating(forecast_days)

      forecast_days.days.each do |forecast|
        if precipitation?(forecast)
          create_precipitation_events(forecast)
        else
          create_non_precipitation_events(forecast)
        end
      end
    end

    private

    def precipitation?(forecast)
      forecast.precipitation
    end

    def create_precipitation_events(forecast)
      Event.where(start_date: forecast.date.beginning_of_day,
                  end_date: forecast.date.middle_of_day, text: forecast.condition,
                  published: true, user: @user, disable: false).first_or_create
    end

    def create_non_precipitation_events(forecast)
      Event.where(start_date: forecast.date.beginning_of_day,
                  end_date: forecast.date.middle_of_day, text: forecast.condition,
                  published: true, user: @user, disable: true).first_or_create
    end

    def check_if_unsuccessful_forecast_populating(forecast)
      raise_error 'Unsuccessful forecast populating' unless forecast.successful?
    end
  end
end
