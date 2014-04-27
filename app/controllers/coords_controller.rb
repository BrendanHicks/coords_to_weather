require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @latitude = 34.3373061
    @longitude = -118.155289
    your_api_key = "c59ddc888642d079061fe241c99d7145"

        @url = "https://api.forecast.io/forecast/#{your_api_key}/#{@latitude},#{@longitude}"
        raw_data = open(@url).read
            parsed_data =JSON.parse(raw_data)
            @temperature = parsed_data["currently"]["temperature"]
            @minutely_summary = parsed_data["minutely"]["summary"]
            @hourly_summary = parsed_data["hourly"]["summary"]
            @daily_summary = parsed_data["daily"]["summary"]

    # Your code goes here.
    # url = ?
    # raw_data = ?
    # parsed_data = ?
    # @temperature = ?
    # @minutely_summary = ?
    # @hourly_summary = ?
    # @daily_summary = ?
  end
end
