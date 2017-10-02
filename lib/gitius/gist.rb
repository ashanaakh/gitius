class Gist < Thor
  include Gitius::Helpers

  desc 'create', 'Create gist'
  option :description, aliases: :d, banner: '<text>'
  option :public
  def create(*paths)
    paths.each do |f|
      options['files'][File.basename(f)] = { 'content' => File.read(f).to_s }
    end
    response = client.create_gist(options)
    puts response.html_url
  rescue StandardError => e
    puts e.message
  end

  desc 'delete', 'Delete gist'
  def delete(id)
    response = client.delete_repo(id)
    puts response ? 'gist deleted' : 'error'
  rescue StandardError => e
    puts e.message
  end
end
