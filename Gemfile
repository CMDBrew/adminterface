source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in active_admin_bootstrap.gemspec.
gemspec

# Databases to test against
gem "pg"
gem "mysql2"
gem "sqlite3"

group :development do
  # Test application against different versions
  gem "appraisal"
end

group :development, :test do
  gem "standardrb"
  gem "byebug"
  gem "webrick"
end
