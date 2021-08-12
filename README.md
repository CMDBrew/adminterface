# ActiveAdminBootstrap <!-- omit in toc -->
[![CI](https://github.com/CMDBrew/active_admin_bootstrap/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/CMDBrew/active_admin_bootstrap/actions/workflows/ci.yml)

Enhance ActiveAdmin with Bootstrap 5 and extended functionalities.

## Table of Contents <!-- omit in toc -->
- [Dependencies](#dependencies)
- [Quick Start](#quick-start)
- [Usages](#usages)
- [Contributing](#contributing)
- [License](#license)

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

## Usages
- Check out the [docs](http(s)://cmdbrew.github.io/active_admin_bootstrap)

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md).

## License
See [LICENSE.md](LICENSE.md).
