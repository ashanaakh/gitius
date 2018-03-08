class Repository < Thor
  include Gitius::Helpers

  desc 'create NAME', 'Create repository'
  option :description, aliases: %w[-d --desc], banner: 'TEXT'
  option :homepage, aliases: %w[--url -u], banner: 'URL'
  option :private, aliases: '-p'
  option :auto_init, aliases: %w[--init --auto -i']
  def create(name)
    response = client.create(name, options)
    puts response.html_url, response.ssh_url
  rescue StandardError => e
    show_error e.message
  end

  desc 'delete NAME', 'Delete repository'
  def delete(name)
    succeed = client.delete_repo(name)
    puts succeed ? 'Repository was successfully deleted' : 'Error'
  rescue StandardError => e
    show_error e.message
  end

  desc 'info NAME', 'Get information'
  option :forks, aliases: :f
  def info(name)
    puts client.forks(name) if options[:forks]
    puts "last update: #{repo(name).created_at}"
  rescue StandardError
    show_error 'Invalid repository'
  end

  desc 'fork NAME', 'Fork repository'
  def fork(name)
    response = client.fork(name)
    puts "#{name} forked", "url: #{response.html_url}",
         "url: #{response.ssh_url}"
  rescue StandardError
    show_error 'Invalid repository'
  end
end