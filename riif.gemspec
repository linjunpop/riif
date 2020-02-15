# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'riif/version'

Gem::Specification.new do |gem|
  gem.name          = "riif"
  gem.version       = Riif::VERSION
  gem.authors       = ["Jun Lin"]
  gem.email         = ["linjunpop@gmail.com"]
  gem.description   = "A simple DSL to generate QuickBooks IIF file"
  gem.summary       = "A simple DSL to generate QuickBooks IIF file"
  gem.homepage      = "https://github.com/linjunpop/riif"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = []
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rails', '~> 6.0'
  gem.add_development_dependency 'rspec', '~> 3.5'
  gem.add_development_dependency 'rspec-rails', '~> 3.5'
  gem.add_development_dependency 'rspec-its', '~> 1.2'
  gem.add_development_dependency 'rails-controller-testing', '~> 1.0'
  gem.add_development_dependency 'combustion', '~> 1.1'
  gem.add_development_dependency 'fuubar'
  gem.add_development_dependency 'coveralls'
end
