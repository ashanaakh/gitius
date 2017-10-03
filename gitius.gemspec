
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gitius/version'

Gem::Specification.new do |spec|
  spec.name          = 'gitius'
  spec.version       = Gitius::VERSION
  spec.authors       = ['Ali Shanaakh']
  spec.email         = ['ashanaakh@gmail.com']

  spec.homepage      = 'https://github.com/ashanaakh/gitius'

  spec.summary       = 'Command line client for githib'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.20.0'
  spec.add_dependency 'octokit', '~> 4.7.0'

  spec.add_development_dependency 'bundler', '~> 1.15.4'
  spec.add_development_dependency 'rake', '~> 10.0'
end
