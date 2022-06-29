# This file is part of the sinatra-sse ruby gem.
#
# Copyright (c) 2016, 2017 @radiospiel, mediapeers Gem
# Distributed under the terms of the modified BSD license, see LICENSE.BSD

Gem::Specification.new do |gem|
  gem.name     = "simple-benchmark"
  gem.version  = File.read "VERSION"

  gem.authors  = [ "radiospiel" ]
  gem.email    = "radiospiel@open-lab.org"
  gem.homepage = "https://github.com/radiospiel/simple-benchmark"
  gem.summary  = "A simple benchmark tool"

  gem.description = "Runs benchmarks and tracks results over a projects history"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths =  %w(lib)

  # executables are used for development purposes only
  gem.executables   = [ "simple-benchmark" ]

  gem.required_ruby_version = '~> 2.7'

  gem.add_dependency 'simple-cli', '~> 0.4', '>= 0.4.0'
end
