# Adminterface <!-- omit in toc -->
[![CI](https://github.com/CMDBrew/adminterface/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/CMDBrew/adminterface/actions/workflows/ci.yml)

An add-on that brings Bootstrap 5 and other goodies into ActiveAdmin.

[![](preview.jpg)](https://adminterface.io)

## Dependencies
- Rails >= 6.0
- Ruby >= 2.7
- ActiveAdmin ~> 2.9
- Bootstrap ~> 5
- Webpacker >= 5.0

## Quick Start
1. Add the following to your application's Gemfile:
   ```ruby
   gem "adminterface"
   ```
2. Then execute:
   ```bash
   $ bundle install
   ```
3. Install ActiveAdmin (If you haven't)
   ```bash
   $ rails g active_admin:install --use_webpacker
   ```
4. Install Adminterface
   ```bash
   $ rails g adminterface:install
   ```
5. Migrate your database and start the server
   ```bash
   $ rails db:migrate
   $ rails server
   ```

## Documentation
Check our [website](https://adminterface.io) to find in-depth documentation for everything that Adminterface offers.

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md).

## License
Adminterface is free for personal and non-commercial use and with a yearly subscription for commercial purposes. See [our Terms of Service in full text](LICENSE.md) for more information.

### For Commerical License
Get a license at https://adminterface.io/pricing, then create and add the `license_key` into the following file in your project:
```ruby
# config/initializers/adminterface.rb
Adminterface.setup do |config|
  config.license_key = "**********************"

  ## Use Rails credentials:
  ## doc: https://edgeguides.rubyonrails.org/security.html#custom-credentials
  # config.license_key = Rails.application.credentials.adminterface[:license_key]

  ## Or, use environment variables:
  # config.license_key = ENV["ADMINTERFACE_LICENSE_KEY"]
end
```
