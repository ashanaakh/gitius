class Repository < Thor
  include Gitius::Helpers

  desc 'create', 'Create repository'
  option :description, aliases: :d, banner: '<text>'
  option :homepage, aliases: :url, banner: '<url>'
  option :private, aliases: :p
  option :auto_init, aliases: :i
  def create(name)
    response = client.create(name, options)
    puts response.html_url, response.ssh_url
  rescue StandardError => e
    puts e.message
  end

  desc 'delete', 'Delete repository'
  def delete(name)
    succeed = client.delete_repo(name)
    puts succeed ? 'Repository was succfully deleted' : 'Error'
  rescue StandardError => e
    puts e.message
  end

  desc 'info', 'Get information'
  option :forks, aliases: :f
  def info(name)
    puts client.forks(name) if options[:forks]
    puts "last update: #{repo(name).created_at}"
  rescue StandardError => e
    puts e.message
  end

  desc 'fork', 'Fork repository'
  def fork(name)
    response = client.fork(name)
    puts "#{name} forked", "url: #{response.html_url}",
         "url: #{response.ssh_url}"
  rescue StandardError => e
    puts e.message
  end
end
