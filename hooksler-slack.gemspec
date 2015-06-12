# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hooksler/slack/version'

Gem::Specification.new do |spec|
  spec.name          = "hooksler-slack"
  spec.version       = Hooksler::Slack::VERSION
  spec.authors       = ["schalexey@gmail.com"]
  spec.email         = ["schalexey@gmail.com"]

  spec.summary       = %q{Slack adapter for Hooksler.}
  spec.description   = %q{Slack adapter for Hoorsler.}
  spec.homepage      = "https://github.com/hooksler/hooksler-slack"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'
  spec.add_dependency 'hooksler'
  spec.add_dependency 'multi_json'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
