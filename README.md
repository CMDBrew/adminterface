# Adminterface <!-- omit in toc -->
[![CI](https://github.com/CMDBrew/adminterface/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/CMDBrew/adminterface/actions/workflows/ci.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/4dbedfdf21a2d675d2ca/maintainability)](https://codeclimate.com/github/CMDBrew/adminterface/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/4dbedfdf21a2d675d2ca/test_coverage)](https://codeclimate.com/github/CMDBrew/adminterface/test_coverage)
[![gem](https://img.shields.io/gem/v/adminterface?color=%23E9573F&label=rubygems.org)](https://rubygems.org/gems/adminterface)
[![npm](https://img.shields.io/npm/v/@cmdbrew/adminterface?color=%230273B4&label=npmjs.com)](https://www.npmjs.com/package/@cmdbrew/adminterface)

A gem that brings Bootstrap 5, advanced customizability, and other goodies into ActiveAdmin

[![](preview.jpg)](https://adminterface.io)

## Dependencies
- [Ruby](https://www.ruby-lang.org/en/) >= 2.7
- [Rails](http://rubyonrails.org/) >= 6.0
- [ActiveAdmin](https://github.com/activeadmin/activeadmin) ~> 2.9
- [Bootstrap](https://getbootstrap.com/) ~> 5.1.3
- [Webpacker](https://github.com/rails/webpacker) ~> 5.0

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

   > This command will ask for permissions to overwrite files generated by ActiveAdmin. Make sure to review the files carefully and accept them.
   > We recommend you commit your files before running this command to ensure you are aware of the changes made.

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
Adminterface is free for personal and non-commercial use and with a yearly subscription for commercial purposes. See our [Terms of Service in full text](LICENSE.md) for more information.

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
