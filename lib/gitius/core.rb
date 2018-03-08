module Gitius
  class Core < Base
    include Gitius::Helpers

    desc 'repository COMMAND', 'Github Repositories'
    subcommand 'repository', Repository

    desc 'gist COMMAND', 'Github Gist'
    subcommand 'gist', Gist

    desc 'whoami', 'Return user\'s github nickname'
    option :name, aliases: '-n', type: :boolean
    def whoami
      name = options[:name] ? user.name : user.login
      puts name
    rescue StandardError
      show_error 'Incorrect settings'
    end

    desc 'config', 'Set configurations for using CLI'
    def config(key, value = nil)
      value.nil? ? puts(get_config(key)) : change_config(key, value)
    end

    map %w[--version -v] => :version
    desc 'version', 'Return gitius version'
    def version
      puts "v#{Gitius::VERSION}"
    end
  end
end