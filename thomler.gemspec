# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thomler/version'

Gem::Specification.new do |spec|
  spec.name          = "thomler"
  spec.version       = Thomler::VERSION
  spec.authors       = ["Thomas Osborn"]
  spec.email         = ["trosborn@gmail.com"]
  spec.description   = %q{Ruby on Thomler}
  spec.summary       = %q{Thomler is an opinionated MVC framework written in the Ruby programming language. All credit to Rebuilding Rails.}
  spec.homepage      = "http://www.trosborn.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "test-unit"

  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "erubis"
  spec.add_runtime_dependency "multi_json"
  spec.add_runtime_dependency "sqlite3"
end
