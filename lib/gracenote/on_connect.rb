require 'gracenote/on_connect/version'
require 'net/http'
require 'json'
require 'date'

module Gracenote
  module OnConnect
    API_KEY = ENV['API_KEY']
    BASE_URL = 'http://data.tmsapi.com/v1.1'

    class Theater
      def self.find_by_zip(zip)
        params = { api_key: API_KEY, zip: zip }
        uri = URI("#{BASE_URL}/theatres")
        uri.query = URI.encode_www_form(params)

        results = Net::HTTP.get(uri)
        # binding.pry
        JSON.parse(results)
      end

      def self.showtimes(theater_id, start_date = Date.today.to_s, days = 1)
        params = { api_key: API_KEY, startDate: start_date, numDays: days }
        uri = URI("#{BASE_URL}/theatres/#{theater_id}/showings")
        uri.query = URI.encode_www_form(params)

        results = Net::HTTP.get(uri)
        # binding.pry
        JSON.parse(results)
      end
    end
  end
end
