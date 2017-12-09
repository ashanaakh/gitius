# Gitius

[![Build Status](https://travis-ci.org/ashanaakh/gitius.svg?branch=tests)][travis]
[![Gem Version](https://badge.fury.io/rb/gitius.svg)][gem]
[![Dependency Status](https://beta.gemnasium.com/badges/github.com/ashanaakh/gitius.svg)][gemnasium]
[![codecov](https://codecov.io/gh/ashanaakh/gitius/branch/master/graph/badge.svg)][coverage]

[travis]: https://travis-ci.org/ashanaakh/gitius
[gem]: https://badge.fury.io/rb/gitius
[gemnasium]: https://beta.gemnasium.com/projects/github.com/ashanaakh/gitius
[coverage]: https://codecov.io/gh/ashanaakh/gitius

Command line interface based on GitHub official [Octokit](https://github.com/octokit/octokit.rb)
gem and [Thor](https://github.com/erikhuda/thor) library for creating CLI on ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gitius'
```

And then execute:

```shell
bundle
```

Or install it yourself as:

```shell
gem install gitius
```

## Getting started

```shell
gitius config token <token>
gitius config token # shows your token
gitius whoami # prints user's nickname
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ashanaakh/gitius.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
