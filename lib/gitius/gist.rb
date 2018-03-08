class Gist < Thor
  include Gitius::Helpers

  desc 'create PATHS', 'Create gist'
  option :description, aliases: :d, banner: 'TEXT'
  option :public
  def create(*paths)
    options[:files] ||= {}

    paths.each { |path| add_file options, path }

    puts client.create_gist options.html_url
  rescue StandardError => e
    show_error e.message
  end

  desc 'delete ID', 'Delete gist'
  def delete(id)
    response = client.delete_gist id

    puts response ? 'gist deleted' : 'error'
  rescue StandardError => e
    show_error e.message
  end

  private

  def add_file(options, path)
    base    = File.basename path
    content = File.read path

    options[:files][base] = { content: content.to_s }
  end
end
