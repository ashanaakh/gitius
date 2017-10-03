module Gitius
  class Core < Base
    include Gitius::Helpers

    desc 'repo <command>', ''
    subtask 'repo', Repository

    desc 'gist <command>', ''
    subtask 'gist', Gist

    desc 'whoami', "Return user's github nickname"
    def whoami
      puts user.name
    rescue StandardError => e
      puts e.message
    end

    desc 'config', 'Set configurations for using cli'
    def config(key, value = nil)
      value.nil? ? puts(get_config(key)) : change_config(key, value)
    end

    desc 'version', 'Return gitius version'
    def version
      puts "v#{VERSION}"
    end
  end
end
