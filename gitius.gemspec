lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gitius/version'

Gem::Specification.new do |spec|
  spec.name          = 'gitius'
  spec.version       = Gitius::VERSION
  spec.authors       = ['Ali Shanaakh']
  spec.email         = ['ashanaakh@gmail.com']

  spec.summary       = %q{ Command line interface for githib }
  spec.homepage      = 'https://github.com/ashanaakh/gitius'

  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['gitius']
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'
  spec.add_dependency 'octokit'

  spec.add_development_dependency 'bundler', '~> 1.15.4'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
