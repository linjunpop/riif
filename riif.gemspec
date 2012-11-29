# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'riif/version'

Gem::Specification.new do |gem|
  gem.name          = "riif"
  gem.version       = Riif::VERSION
  gem.authors       = ["Jun Lin"]
  gem.email         = ["linjunpop@gmail.com"]
  gem.description   = "Generate IIF file"
  gem.summary       = "A Simple gem to generate iif file"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
