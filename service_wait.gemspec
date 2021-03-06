# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'service_wait/version'

Gem::Specification.new do |spec|
  spec.name          = "service_wait"
  spec.version       = ServiceWait::VERSION
  spec.authors       = ["Alexandru Keszeg"]
  spec.email         = ["akeszeg@pitechnologies.ro"]

  spec.summary       = %q{Wait for a network service to be available}
  spec.homepage      = "https://github.com/artworx/service_wait"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["service-wait"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
