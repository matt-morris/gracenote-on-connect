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
        params = { api_key: Gracenote::OnConnect.configuration.api_key, zip: zip }
        uri = URI("#{Gracenote::OnConnect.configuration.base_url}/theatres")
        uri.query = URI.encode_www_form(params)

        results = Net::HTTP.get(uri)
        # binding.pry
        JSON.parse(results)
      end

      def self.showtimes(theater_id, start_date = Date.today.to_s, days = 1)
        params = { api_key: Gracenote::OnConnect.configuration.api_key, startDate: start_date, numDays: days }
        uri = URI("#{Gracenote::OnConnect.configuration.base_url}/theatres/#{theater_id}/showings")
        uri.query = URI.encode_www_form(params)

        results = Net::HTTP.get(uri)
        # binding.pry
        JSON.parse(results)
      end
    end
  end
end
