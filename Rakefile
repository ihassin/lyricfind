require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new
Cucumber::Rake::Task.new

task :default => [:spec, :cucumber]

task :build do
  system "gem build lyricfind.gemspec"
end

task :release => :build do
  system "gem push lyricfind-#{LyricFind::VERSION}"
end
