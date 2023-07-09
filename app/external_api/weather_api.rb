# frozen_string_literal: true

# module ExternalApi
class WeatherApi < Flexirest::Base
  # perform_caching true

  base_url Rails.configuration.weatherapi_base_url

  get :get, '/forecast.json?key=26488f822bd447dd852161451230307&q=Dagenham&days=8'

  after_request :cache_forecast

  def cache_forecast(name, response)
    return unless %i[get].include?(name)

    response.response_headers['Expires'] = 6.hours.from_now.iso8601
  end
end
