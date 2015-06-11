# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dooie/version'

Gem::Specification.new do |spec|
  spec.name          = "dooie"
  spec.version       = Dooie::VERSION
  spec.authors       = ["Joey Ferguson"]
  spec.email         = ["fergmastaflex@gmail.com"]
  spec.description   = 'Finds task comments in your repo and creates a list'
  spec.summary       = 'We all add comments to our code that let us know we need to come back and do something. 
                        This finds those and puts them in a file for you so you don\'t lose them'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables   << 'dooie'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
