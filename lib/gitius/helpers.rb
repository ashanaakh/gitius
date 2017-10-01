module Gitius::Helpers
  def token
    yaml = YAML.load_file 'settings.yml'
    yaml['user']['token']
  end
end
