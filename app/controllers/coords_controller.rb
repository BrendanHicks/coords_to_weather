require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather


    if params[:location] == nil

      @address = "Chicago, IL"

    else

          @address = params[:location]

    end

    @url_safe_address = URI.encode(@address)
            full_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=true"

        raw_data = open(full_url).read
            parsed_data = JSON.parse(raw_data)
                results = parsed_data["results"]

                    if results[0] != nil

                        @longitude   = results[0]["geometry"]["location"]['lng']
                        @latitude    = results[0]["geometry"]["location"]["lat"]

                    else

                        @longitude =-87.6297982
                        @latitude = 41.8781136

                    end

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
