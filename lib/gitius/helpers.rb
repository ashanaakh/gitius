module Gitius::Helpers
  def token
    yaml = YAML.load_file Gitius::PATH
    yaml['token']
  end

  def change_configs(key, value)
    File.new Gitius::PATH, 'w' unless File.exist? Gitius::PATH
    configs = YAML.load_file(Gitius::PATH) || {}
    configs[key.split[-1]] = value
    File.open(Gitius::PATH, 'w') { |file| file.write configs.to_yaml }
  end

  def client
    Octokit::Client.new(access_token: token)
  end

  def user
    client.user
  end

  def repo(name)
    client.repo(name)
  end
end
