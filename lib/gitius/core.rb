module Gitius
  class Core < Base
    include Gitius::Helpers

    desc 'whoami', "Return user's github nickname"
    def whoami
      client = Octokit::Client.new(access_token: token)
      user = client.user
      p user.name
    end

    desc 'lastrepo', 'Return information about last repository'
    def lastrepo
      client = Octokit::Client.new(access_token: token)
      repos = client.repositories
      p repos[-1]
    end

    desc 'version', 'Return gitius version'
    def version
      say "v#{VERSION}"
    end
  end
end
