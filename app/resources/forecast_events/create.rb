# frozen_string_literal: true

module ForecastEvents
  class Create
    NUMBER_OF_DAYS = 3

    def self.call(user:, location:)
      forecast_days = ForecastResource.call(location:, number_of_days: NUMBER_OF_DAYS).days

      check_if_unsuccessful_forecast_populating(forecast_days)

      forecast_days.each do |forecast|
        if precipitation?(forecast)
          create_precipitation_events(forecast:, user:)
        else
          create_non_precipitation_events(forecast:, user:)
        end
      end
    end

    def precipitation?(forecast)
      forecast.precipitation
    end

    def create_precipitation_events(forecast:, user:)
      Event.where(start_date: forecast.date.beginning_of_day,
                  end_date: forecast.date.middle_of_day, text: forecast.condition,
                  published: true, user:, disable: false).first_or_create
    end

    def create_non_precipitation_events(forecast:, user:)
      Event.where(start_date: forecast.date.beginning_of_day,
                  end_date: forecast.date.middle_of_day, text: forecast.condition,
                  published: true, user:, disable: true).first_or_create
    end

    def check_if_unsuccessful_forecast_populating(forecast)
      raise_error 'Unsuccessful forecast populating' unless forecast.successful?
    end
  end
end
