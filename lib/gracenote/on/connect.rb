require 'gracenote/on/connect/version'
require 'net/http'
require 'json'

module Gracenote
  module On
    module Connect
      API_KEY = ENV['API_KEY']

      class Theater
        def self.find_by_zip(zip)
          params = { api_key: API_KEY, zip: zip }
          uri = URI('http://data.tmsapi.com/v1.1/theatres')
          uri.query = URI.encode_www_form(params)

          results = Net::HTTP.get(uri)
          JSON.parse(results)
        end
      end
    end
  end
end
