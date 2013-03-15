require 'geocoder/results/base'

module Geocoder::Result
  class PostcodeAnywhere < Base

    def coordinates
      [@data['Latitude'].to_f, @data['Longitude'].to_f]
    end

    def address(format = :full)
      @data['Location']
    end

    def city
      ''
    end

    def state
      ''
    end

    def state_code
      ''
    end

    def postal_code
      ''
    end

    def country
      ''
    end

    def country_code
      ''
    end

  end
end
