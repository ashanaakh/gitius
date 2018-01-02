module Gitius
  class Core < Base
    include Gitius::Helpers

    desc 'repository <command>', ''
    subcommand 'repository', Repository

    desc 'gist <command>', ''
    subcommand 'gist', Gist

    desc 'whoami', "Return user's github nickname"
    option :name, aliases: '-n', type: :boolean
    def whoami
      name = options[:name] ? user.name : user.login
      puts name
    rescue StandardError
      show_error 'Incorrect settings'
    end

    desc 'config', 'Set configurations for using cli'
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