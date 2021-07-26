require "bundler/setup"

APP_RAKEFILE = File.expand_path("test/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake"
load "rails/tasks/statistics.rake"

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.verbose = false
end

# Prepare webpack for dummy
task :prepare_assets do
  system "rm -rf test/dummy/public/packs"
  system "rm -rf test/dummy/public/packs-test"
  system "yarn install --frozen-lockfile"
  system "yarn build"
  system "(cd test/dummy && yarn install --frozen-lockfile)"
end

# Custom Rails stats command
task stats: :statsetup
task :statsetup do
  require "rails/code_statistics"

  custom_directories = [
    %w[Libraries\ tests test/lib]
  ]
  STATS_DIRECTORIES.concat(custom_directories)

  custom_test_types = %w[Libraries\ tests]
  CodeStatistics::TEST_TYPES.concat(custom_test_types)
end

task default: :test
