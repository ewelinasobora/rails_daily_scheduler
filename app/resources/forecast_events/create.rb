# frozen_string_literal: true

module ForecastEvents
  class Create
    def self.call(location:, user:)
      forecast = ForecastResource.call(location)

      raise_error 'Unsuccessful forecast populating' unless forecast.successful?

      forecast.week.each do |weather|
        unless weather.precipitation
          Event.where(start_date: weather.date.beginning_of_day, end_date: weather.date.end_of_day, user:,
                      text: 'Water your outdoor plants!', published: true).first_or_create
        end
      end
    end
  end
end

# add search (elastic search)
# prifile settings page
# event settings page


#