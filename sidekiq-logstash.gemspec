# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/logstash/version'

Gem::Specification.new do |spec|
  spec.name = 'sidekiq-logstash'
  spec.version = Sidekiq::Logstash::VERSION
  spec.authors = ['Mattia Giuffrida']
  spec.email = ['giuffrida.mattia@gmail.com']

  spec.summary = 'Logstash plugin for Sidekiq'
  spec.description = <<~DESC
    Sidekiq::Logstash turns your Sidekiq log into an organised, aggregated, JSON-syntax log ready to be sent to a logstash server.
  DESC
  spec.homepage = 'https://github.com/iMacTia/sidekiq-logstash'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'logstash-event', '~> 1.2'
  spec.add_runtime_dependency 'sidekiq', '>= 3.0', '< 7'

  spec.add_development_dependency 'bundler', '< 3'
  spec.add_development_dependency 'factory_girl', '~> 4.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-json_expectations', '~> 2.1.0'
  spec.add_development_dependency 'rubocop', '~> 0.67.2'
  spec.add_development_dependency 'rubocop-performance'
end
