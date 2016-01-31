# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'submit_once/version'

Gem::Specification.new do |spec|
  spec.name          = "submit_once"
  spec.version       = SubmitOnce::VERSION
  spec.authors       = ["bastengao"]
  spec.email         = ["bastengao@gmail.com"]

  spec.summary       = %q{Prevent from submitting form twice for rails.}
  spec.description   = %q{Prevent from submitting form twice for rails.}
  spec.homepage      = "https://github.com/bastengao/submit_once"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(bin|test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '>= 3.2', '< 5'
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'sqlite3'
end
