# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rekognition/version"

Gem::Specification.new do |s|
  s.name        = "rekognition"
  s.version     = Rekognition::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andy Schmidt"]
  s.email       = ["andy@thisislabcoat.com"]
  s.homepage    = "http://thisislabcoat.com"
  s.summary     = %q{Ruby wrapper of Rekognition Face Detection and Recognition API}
  s.description = %q{Ruby wrapper of Rekognition Face Detection and Recognition API}


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "rest-client", ">=1.6.1"
  s.add_dependency "json", ">=1.4.6"

  s.licenses = 'MIT'

end
