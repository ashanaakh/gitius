require 'spec_helper'
require 'octokit'

RSpec.describe Gitius do
  it 'has a version number' do
    expect(Gitius::VERSION).not_to be nil
  end

  it 'can save and display value' do
    Gitius::Core.start(%w[config key value], debug: true)
    expect { Gitius::Core.start(%w[config key]) }.to output("value\n").to_stdout
  end

  it 'can save token' do
    if ENV['COVERAGE']
      token = ENV['GITHUB_TOKEN']
      Gitius::Core.start(['config', 'token', token], debug: true)
    end
  end

  it 'can create and delete repository' do
    Gitius::Core.start(%w[repo create test-gitius -p], debug: true)
    expect { Gitius::Core.start(%w[repo delete ashanaakh/test-gitius]) }.not_to output("Error\n").to_stdout
  end

  it 'can create and delete gist' do
    File.write 'test.txt', 'text'

    old_stdout = $stdout
    $stdout = StringIO.new

    Gitius::Core.start(%w[gist create ./test.txt])

    result = $stdout.string.split('/')[-1].delete("\n")
    $stdout = old_stdout

    File.delete 'test.txt'

    expect { Gitius::Core.start(['gist', 'delete', result.to_s]) }
      .to output("gist deleted\n").to_stdout
  end
end