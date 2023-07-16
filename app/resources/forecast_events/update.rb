# frozen_string_literal: true

module ForecastEvents
  class Update
    DEFAULT_DAYS_COUNT = 1

    class << self
      def call(...)
        new(...).tap(&:update_events)
      end
    end

    def initialize(locations)
      @locations = locations
    end

    def update_events
      forecast_collection.each do |forecast|
        if precipitation?(forecast)
          update_disabled_events(forecast)
        else
          update_enabled_events(forecast)
        end
      end
    end

    def precipitation?(forecast)
      forecast.days.first.precipitation
    end

    # rubocop:disable Rails/SkipsModelValidations
    def update_disabled_events(forecast)
      Event.current_day.by_location(forecast.location).disabled.update_all(
        disable: false,
        text: forecast.days.first.condition
      )
    end

    def update_enabled_events(forecast)
      Event.current_day.by_location(forecast.location).enabled.update_all(disable: true)
    end
    # rubocop:enable Rails/SkipsModelValidations

    def forecast_collection
      @locations.each_with_object([]) do |location, forecast_collection|
        forecast_collection << ForecastResource.call(location:, number_of_days: DEFAULT_DAYS_COUNT)
      end
    end
  end
end
