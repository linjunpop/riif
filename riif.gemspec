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
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rails'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-rails'
  gem.add_development_dependency 'rspec-its'
  gem.add_development_dependency 'rails-controller-testing'
  gem.add_development_dependency 'awesome_print'
  gem.add_development_dependency 'combustion', '~> 0.3.1'
  gem.add_development_dependency 'fuubar'
  gem.add_development_dependency 'coveralls'
end
