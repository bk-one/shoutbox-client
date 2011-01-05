require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "shoutbox-client"
  gem.homepage = "http://github.com/benjaminkrause/shoutbox-client"
  gem.license = "MIT"
  gem.summary = %Q{ ruby client to publish shoutbox status updates }
  gem.description = %Q{ Simple Ruby Client to manage status on a node.js Shoutbox Server }
  gem.email = "bk@benjaminkrause.com"
  gem.authors = ["Benjamin Krause"]
  gem.autorequire = 'shoutbox_client'
  gem.files = Dir['lib/**/*.rb'] + Dir['bin/*']
  gem.executable = 'shout'
  gem.add_dependency 'json', '~> 1.4.0'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "shoutbox-client #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
