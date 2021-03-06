lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gitius/version'

Gem::Specification.new do |gem|
  gem.name                  = 'gitius'
  gem.version               = Gitius::VERSION
  gem.required_ruby_version = '>= 2.4.0'
  gem.authors               = ['Ali Shanaakh']
  gem.email                 = ['ashanaakh@gmail.com']
  gem.summary               = 'Command line interface for github'
  gem.homepage              = 'https://github.com/ashanaakh/gitius'
  gem.license               = 'MIT'
  gem.files                 = `git ls-files -z`.split("\0")
  gem.bindir                = 'bin'
  gem.executables           = ['gitius']
  gem.require_paths         = ['lib']

  gem.add_dependency 'octokit', '4.8.0'
  gem.add_dependency 'thor', '0.20.0'

  gem.add_development_dependency 'bump',      '~> 0.5.4'
  gem.add_development_dependency 'bundler',   '~> 1.16'
  gem.add_development_dependency 'codecov',   '= 0.1.10'
  gem.add_development_dependency 'colorize',  '~> 0.8.1'
  gem.add_development_dependency 'rake',      '~> 12.3'
  gem.add_development_dependency 'rspec',     '~> 3.0'
  gem.add_development_dependency 'simplecov', '= 0.15.1'
end
