require "vcr"

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = "test/support/cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data("<ADMINTERFACE_CLIENT_DOMAIN>") { "https://app.adminterface.io" }
  config.ignore_localhost = false
  config.default_cassette_options = {record: :new_episodes}
end
