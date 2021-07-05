source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in active_admin_bootstrap.gemspec.
gemspec

# Databases to test against
gem "pg"
gem "mysql2"
gem "sqlite3"
gem "webpacker", "~> 5.0"

# Use Factory to create fake data
gem "faker"
gem "factory_bot_rails"

# Use Devise for authentication
gem "devise"

group :development do
  # Test application against different versions
  gem "appraisal"
end

group :development, :test do
  gem "standardrb"
  gem "byebug"
  gem "puma"
end

group :test do
  # For system and integration tests
  gem "capybara"
  gem "webdrivers"
  # For test coverage reports
  gem "simplecov", require: false
end
