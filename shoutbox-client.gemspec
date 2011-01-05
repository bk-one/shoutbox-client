# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{shoutbox-client}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Benjamin Krause"]
  s.autorequire = %q{shoutbox_client}
  s.date = %q{2011-01-05}
  s.default_executable = %q{shout}
  s.description = %q{ Simple Ruby Client to manage status on a node.js Shoutbox Server }
  s.email = %q{bk@benjaminkrause.com}
  s.executables = ["shout"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "bin/shout",
    "lib/shoutbox/configuration.rb",
    "lib/shoutbox/shout.rb",
    "lib/shoutbox_client.rb"
  ]
  s.homepage = %q{http://github.com/benjaminkrause/shoutbox-client}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{ruby client to publish shoutbox status updates}
  s.test_files = [
    "spec/shoutbox_client_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<trollop>, ["~> 1.16"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<webmock>, ["~> 1.6"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5"])
    else
      s.add_dependency(%q<trollop>, ["~> 1.16"])
      s.add_dependency(%q<rspec>, ["~> 2.3"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<webmock>, ["~> 1.6"])
      s.add_dependency(%q<jeweler>, ["~> 1.5"])
    end
  else
    s.add_dependency(%q<trollop>, ["~> 1.16"])
    s.add_dependency(%q<rspec>, ["~> 2.3"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<webmock>, ["~> 1.6"])
    s.add_dependency(%q<jeweler>, ["~> 1.5"])
  end
end

