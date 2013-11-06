require File.expand_path('../utils', __FILE__)
require File.expand_path('../face', __FILE__)
require File.expand_path('../scene', __FILE__)

module Rekognition
  module Client
    class Base
      
      attr_accessor :api_key, :api_secret

      include Rekognition::Client::Utils
      include Rekognition::Client::Face
      include Rekognition::Client::Scene


      def initialize(opts={})
        opts.assert_valid_keys(:api_key, :api_secret)
        @api_key, @api_secret = opts[:api_key], opts[:api_secret]
      end

      protected
      def compile_jobs_string_and_make_request(method_name, opts)
        jobs_string = method_name
        if opts[:jobs]
          opts[:jobs].delete(method_name)
          opts[:jobs].prepend(method_name)
          jobs_string << opts[:jobs].join("_")
          opts[:jobs] = jobs_string
        else
          opts = opts.merge(:jobs => method_name)
        end
        make_request(opts)
      end
    end
  end
end