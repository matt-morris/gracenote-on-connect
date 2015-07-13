require 'gracenote/on_connect/version'
require 'net/http'
require 'json'
require 'date'

module Gracenote
  module OnConnect
    class << self
      attr_accessor :configuration
    end

    class Configuration
      attr_accessor :api_key, :base_url

      def initialize
        @api_key = ENV['ONCONNECT_API_KEY']
        @base_url = 'http://data.tmsapi.com/v1.1'
      end
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield configuration
    end

    class Theater
      def self.find_by_zip(zip)
        params = { api_key: OnConnect.configuration.api_key, zip: zip }
        self.get("theatres", params)
      end

      def self.showtimes(theater_id, start_date: Date.today.to_s, days: 1, size: nil)
        params = {
          api_key: OnConnect.configuration.api_key,
          startDate: start_date,
          numDays: days,
          imageSize: size
        }

        params.select! { |k, v| k unless v.nil? }

        self.get("theatres/#{theater_id}/showings", params)
      end

      private

      def self.get(path, params = {})
        uri = URI("#{OnConnect.configuration.base_url}/#{path}")
        uri.query = URI.encode_www_form(params)
        response = Net::HTTP.get_response(uri)
        # binding.pry
        JSON.parse(response.body)
      rescue JSON::ParserError => e
        # binding.pry
        { errors: [e.message] }
      end
    end
  end
end
