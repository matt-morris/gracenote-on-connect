# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gracenote/on_connect/version'

Gem::Specification.new do |spec|
  spec.name          = "gracenote-on_connect"
  spec.version       = Gracenote::OnConnect::VERSION
  spec.authors       = ["Matt Morris"]
  spec.email         = ["double.emms@gmail.com"]
  spec.summary       = %q{A wrapper for Gracenote's OnConnect REST API.}
  spec.description   = %q{A convenient wrapper for Gracenote's OnConnect REST API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-nav"
end
