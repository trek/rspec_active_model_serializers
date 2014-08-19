# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/active_model_serializers/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec_active_model_serializers'
  spec.version       = RSpec::ActiveModelSerializers::VERSION
  spec.authors       = ['Tema Bolshakov']
  spec.email         = ['abolshakov@spbtv.com']
  spec.summary       = %q{ RSpec for ActiveModel::Serializer }
  spec.description   = %q{ RSpec matchers for testing integration between Rails' controllers and ActiveModel::Serialize }
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'active_model_serializers', '~> 0.9.0.alpha1'
  spec.add_dependency 'rspec-rails', '~> 3'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rails', '~> 4'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sqlite3'
end
