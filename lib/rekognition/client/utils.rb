module Rekognition
  module Client
    module Utils

      class RekognitionError < StandardError; end

      API_METHOD =  "http://rekognition.com/func/api/"

      def api_credentials
        { :api_key => api_key, :api_secret => api_secret }
      end

      def make_request(opts={})
        response = RestClient.post(API_METHOD, opts.merge(api_credentials), :content_type => :json, :accept => :json)
        begin
          JSON.parse response.body
        rescue
          raise(RekognitionError, "Malformed response from Rekognition API: #{response}")
        end
      end
    end
  end
end