require 'rubygems'
require 'rest_client'
require 'json'

require File.expand_path('../rekognition/client', __FILE__)

module Rekognition
  
  def self.get_client(opts={})
    Rekognition::Client::Base.new(opts)
  end
  
end
