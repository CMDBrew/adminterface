# ActiveAdminBootstrap <!-- omit in toc -->
[![CI](https://github.com/CMDBrew/active_admin_bootstrap/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/CMDBrew/active_admin_bootstrap/actions/workflows/ci.yml)

An add-on that brings Bootstrap 5 and other goodies into ActiveAdmin.

[![](preview.jpg)](https://cmdbrew.github.io/active_admin_bootstrap)

## Dependencies
- Rails >= 6.0
- Ruby >= 2.7
- ActiveAdmin ~> 2.9
- Bootstrap ~> 5
- Webpacker >= 5.0

## Quick Start
1. Add the following to your application's Gemfile:
   ```ruby
   source "https://rubygems.pkg.github.com/cmdbrew" do
     gem "active_admin_bootstrap"
   end
   ```
2. Then execute:
   ```bash
   $ bundle install
   ```
3. Install ActiveAdmin (If you haven't)
   ```bash
   $ rails g active_admin:install --use_webpacker
   ```
4. Install ActiveAdminBootstrap
   ```bash
   $ rails g active_admin_boostrap:install
   ```

## Documentation
Check our [website](https://cmdbrew.github.io/active_admin_bootstrap) to find in-depth documentation for everything that ActiveAdminBootstrap offers.

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md).

## License
ActiveAdminBootstrap is free for personal and non-commercial use and with a yearly subscription for commercial purposes. See [our Terms of Service in full text](LICENSE.md) for more information.
