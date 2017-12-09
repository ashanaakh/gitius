lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gitius/version'

Gem::Specification.new do |gem|
  gem.name          = 'gitius'
  gem.version       = Gitius::VERSION
  gem.authors       = ['Ali Shanaakh']
  gem.email         = ['ashanaakh@gmail.com']

  gem.summary       = %w[Command line interface for githib]
  gem.description   = ''

  gem.homepage      = 'https://github.com/ashanaakh/gitius'

  gem.license       = 'MIT'

  gem.files         = `git ls-files -z`.split("\0")
  gem.bindir        = 'bin'
  gem.executables   = ['gitius']
  gem.require_paths = ['lib']

  gem.add_dependency 'octokit', '4.7.0'
  gem.add_dependency 'thor', '0.20.0'


  gem.add_development_dependency 'bundler', '~> 1.16'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'simplecov', '= 0.15.1'
  gem.add_development_dependency 'codecov', '= 0.1.10'
end
