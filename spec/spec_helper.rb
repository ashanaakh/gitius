require 'rspec'

RSpec.configure do |config|
  config.before { allow($stdout).to receive(:puts) }
end

if ENV['COVERAGE'] == 'true'
  require 'simplecov'

  formatters = []

  if ENV['CODECOV_TOKEN']
    require 'codecov'
    formatters << SimpleCov::Formatter::Codecov
  end

  unless formatters.empty?
    SimpleCov.formatters = formatters
  end

  SimpleCov.start do
    load_profile 'test_frameworks'
    add_group 'Lib', 'lib'
    track_files '{lib,bin}/**/*.{rb,erb}'
  end
end

require 'gitius'