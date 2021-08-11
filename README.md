# ActiveAdminBootstrap <!-- omit in toc -->
[![CI](https://github.com/CMDBrew/active_admin_bootstrap/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/CMDBrew/active_admin_bootstrap/actions/workflows/ci.yml)
[![Rails](https://img.shields.io/badge/Rails->%3D6.0-%23CB0000)](https://rubyonrails.org/)
[![Ruby](https://img.shields.io/badge/Rails->%3D2.7-%23CB0000)](https://www.ruby-lang.org/en/)
[![ActiveAdmin](https://img.shields.io/badge/ActiveAdmin-2.9-%23407985)](https://github.com/activeadmin/activeadmin)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5-563D7C)](https://getbootstrap.com/)
[![Webpacker](https://img.shields.io/badge/Webpacker->%3D5.0-0174B6)](https://github.com/rails/webpacker)

Enhance ActiveAdmin with Bootstrap 5 and extended functionalities.

## Getting started <!-- omit in toc -->
- [Installation](#installation)
- [Usages](#usages)
- [Contributing](#contributing)
- [License](#license)

## Installation
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
This will:
1. Add the followings to your `config/webpack/environment.js`
   ```javascript
   environment.loaders.get('sass').use.splice(-1, 0, {
     loader: 'resolve-url-loader'
   })
   ```
2. Create a `.npmrc` file.
   ```
   @cmdbrew:registry=https://npm.pkg.github.com
   ```
3. Install `@cmdbrew/active_admin_bootstrap` via yarn
4. Overwrite [`active_admin.js`](./lib/generators/active_admin_bootstrap/webpacker/templates/active_admin.js) with `app/javascript/packs/active_admin.js`.
5. Overwrite [`active_admin.scss`](./lib/generators/active_admin_bootstrap/webpacker/templates/active_admin.scss) with `app/javascript/stylesheets/active_admin.scss`.
6. Set `config.use_webpacker = true` in `config/initializers/active_admin.rb`.
7. Remove unnecessary dependencies from ActiveAdmin such as jQuery.

## Usages
See the docs in the [docs](./docs) folder.
- [General Configurations](./docs/General-Configurations.md)
- [Arbre Components](./docs/Arbre-Components.md)
- [Batch Actions](./docs/Batch-Actions.md)
- [Confirm Dialog](./docs/Confirm-Dialog.md)
- [Customizing the Form](./docs/Customizing-the-Form)

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md).

## License
See [LICENSE.md](LICENSE.md).
