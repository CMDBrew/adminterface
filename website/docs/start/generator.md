---
sidebar_position: 2
---

# Generator

## Install
```bash
rails g active_admin_boostrap:install
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
4. Overwrite `/lib/generators/active_admin_bootstrap/webpacker/templates/active_admin.js` with `app/javascript/packs/active_admin.js`.
5. Overwrite `/lib/generators/active_admin_bootstrap/webpacker/templates/active_admin.scss` with `app/javascript/stylesheets/active_admin.scss`.
6. Set `config.use_webpacker = true` in `config/initializers/active_admin.rb`.
7. Remove unnecessary dependencies from ActiveAdmin such as jQuery.

## Webpacker
When you run `rails active_admin_bootstrap:install`, it triggers this generator by default.
```bash
$ rails g active_admin_bootstrap:webpacker
```

## Configs
Generate configs for a resource
```bash
$ rails g active_admin_bootstrap:configs [NAMESPACE]
# e.g.
$ rails g active_admin_bootstrap:configs admin/user
```

## Views
Copy views to the main app
```bash
$ rails g active_admin_bootstrap:views
```