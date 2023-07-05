# frozen_string_literal: true

class WeatherApi < Flexirest::Base
  perform_caching true

  base_url Rails.configuration.weatherapi_base_url

  get :get, '&q=:location&days=:days'

  after_request :cache_forecast

  def cache_forecast(name, response)
    return unless %i[get].include?(name)

    response.response_headers['Expires'] = 6.hours.from_now.iso8601
  end
end
