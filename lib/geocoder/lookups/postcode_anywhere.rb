require 'geocoder/lookups/base'
require 'geocoder/results/postcode_anywhere'

module Geocoder::Lookup
  class PostcodeAnywhere < Base

    def name
      "Postcode Anywhere"
    end

    def query_url(query)
      protocol + host + path + "?" + url_query_string(query)
    end

    private # ---------------------------------------------------------------

    def results(query)
      return [] unless doc = fetch_data(query)
      return doc['Items']
    end

    def query_url_postcode_anywhere_params(query)
      params = {}

      unless query.reverse_geocode?
        params[:Location] = query.sanitized_text
      end

      params
    end

    def query_url_params(query)
      query_url_postcode_anywhere_params(query).merge(
        :Key => configuration.api_key
      ).merge(super)
    end

    def protocol
      super + "://"
    end

    def host
      "services.postcodeanywhere.co.uk"
    end

    def path
      "/Geocoding/UK/Geocode/#{version}/json3.ws"
    end

    def version
      "v2.00"
    end

  end
end
