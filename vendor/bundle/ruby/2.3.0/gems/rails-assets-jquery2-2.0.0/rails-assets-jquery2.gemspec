# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-assets-jquery2/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-assets-jquery2"
  spec.version       = RailsAssetsJquery2::VERSION
  spec.authors       = ["rails-assets.org"]
  spec.description   = "jQuery v2 component - if you need both v2 (ie9+) and v1 (ie8-)"
  spec.summary       = "jQuery v2 component - if you need both v2 (ie9+) and v1 (ie8-)"
  spec.homepage      = "https://github.com/iki/jquery2"
  spec.license       = "MIT"

  spec.files         = `find ./* -type f | cut -b 3-`.split($/)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
