---
sidebar_position: 1
---

# Installation

## Requirements
- [Ruby](https://www.ruby-lang.org/en/) >= 2.7
- [ActiveAdmin](https://github.com/activeadmin/activeadmin) ~> 2.9
- [Webpacker](https://github.com/rails/webpacker) >= 5.0

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