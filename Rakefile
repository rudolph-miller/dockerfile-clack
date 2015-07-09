require "rspec/core/rake_task"

RSpec::Core::RakeTask.new("spec")
task :default => :spec

namespace :docker do
  task :build => ['docker:build:clack', 'docker:build:test']

  namespace :build do
    task :clack do
      sh 'docker build -t rudolphm/clack ./'
    end

    task :test do
      sh 'docker build -t rudolphm/clack-test ./test/'
    end
  end

  task :test => ['docker:build', 'spec']
end

