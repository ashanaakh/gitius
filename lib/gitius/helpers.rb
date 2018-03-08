module Gitius
  module Helpers
    def token
      get_config :token
    end

    def change_config(key, value)
      File.new Gitius::PATH, 'w' unless File.exist? Gitius::PATH

      configs = YAML.load_file(Gitius::PATH) || {}
      configs[key.to_sym] = value

      File.open(Gitius::PATH, 'w') { |f| f.write configs.to_yaml }
    rescue StandardError => e
      raise e
    end

    def get_config(key)
      if File.exist? Gitius::PATH
        File.new Gitius::PATH, 'w'
      end

      configs = YAML.load_file(Gitius::PATH) || {}

      configs[key.to_sym]
    rescue StandardError => e
      raise e
    end

    def client
      Octokit::Client.new access_token: token
    rescue StandardError => e
      raise e
    end

    def user
      client.user
    rescue StandardError => e
      raise e
    end

    def repo(name)
      client.repo name unless client.nil?
    rescue StandardError => e
      raise e
    end

    def show_error(text)
      puts text.colorize :red
    end

    def show_success(text)
      puts text.colorize :green
    end
  end
end