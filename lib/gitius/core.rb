module Gitius
  class Core < Base
    include Gitius::Helpers

    desc 'repo <command>', ''
    subtask 'repo', Repository

    desc 'gist <command>', ''
    subtask 'gist', Gist

    desc 'whoami', "Return user's github nickname"
    def whoami
      user.name
    end

    desc 'howmany', 'Return number of repositories'
    def howmany
      response = client.repos(user)
      puts response.length
    rescue StandardError => e
      puts e.message
    end

    desc 'config', 'Set configurations for using cli'
    def config(key, value)
      change_configs key, value
    end

    desc 'version', 'Return gitius version'
    def version
      puts "v#{VERSION}"
    end
  end
end
