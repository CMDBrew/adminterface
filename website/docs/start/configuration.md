---
sidebar_position: 3
---

# Configuration
We've kept the existing functionalities and add some enhancements to the configurations. Please see [ActiveAdmin] for basic configurations.

## Scoping
:::tip PRO TIP
You can load your configs from YAML files to keep things tidy ✌️.

```ruby
ActiveAdmin.register User do
  config.css_classes = YAML.load_file(Rails.root.join("config/active_admin_bootstrap/users/css_classes.yml").to_s)
end
```
:::

### Global Settings
```ruby
ActiveAdmin.setup do
  config.css_classes = {header: {wrapper: "navbar-dark bg-dark navbar-expand-lg"}}
  config.components = {action_items: {new: {icon_class: "bi-plus"}}}
end
```

### Namespace Settings
```ruby
config.namespace :site_1 do |site|
  site.css_classes = {header: {wrapper: "navbar-dark bg-dark navbar-expand-lg"}}
  site.components = {action_items: {new: {icon_class: "bi-plus"}}}
end
```

### Resource Settings
```ruby
ActiveAdmin.register User do
  config.css_classes = {header: {wrapper: "navbar-dark bg-dark navbar-expand-lg"}}
  config.components = {action_items: {new: {icon_class: "bi-plus"}}}
end
```

## SiteTitle image for logged out pages
We've added an extra option for logo displays for the logged-out pages.
- `site_title_image_logged_out:`
  - Type: `String`, `Symbol`, or `Proc`
  - Note: It fallbacks to `site_title_image:` if not specified

## CSS Classes
We've updated ActiveAdmin's components with [Bootstrap] classes. Specify the changes you want to make, and we will merge your configs with the defaults.

- **Defaults**: `/lib/active_admin_bootstrap/fixtures/components.yml`

## Components
Customize how components should behave.

- **Defaults**: `/lib/active_admin_bootstrap/fixtures/components.yml`

### ActionItems
`action_items:` — the actions items for the resource. Available actions items are `:new`, `:edit`, and `:destroy`.

- `css_class:` — change the CSS class for this button. If not set, it will default to the `action_items.item` setting in [css_classes.yml]
  - Type: `String`
- `icon_class:` — add the classes for the icon. The based class is set globally using `icon` setting in [css_classes.yml], which defaults to [Bootstrap Icons]
  - Type: `String`
- `only:` — the actions you want this action_item to display
  - Type: `Array`

### ActiveAdminComments
`active_admin_comments:` — the ActiveAdminComment component.

- `input:` — the input type for comments
  - Type: `String`
  - Available Options: `rich_text` or `text`

### Columns
`columns:` — the Columns component.

- `breakpoint:` — use [Bootstrap]'s breakpoints
  - Type: `String`
  - Available Options: `sm`, `md`, `lg`, `xl`, `xxl` or `null`

### Filter
`filter:` — filters on the index page.

- `position:` — the placement for the filters
  - Type: `String`
  - Available Options: `sidebar`, `table_tools`, or `aside`

### Flash
`flash:` — the flash messages for the app.

- `dismissible:` — set to `true` if you want to display the dismiss button
  - Type: `Boolean`

### Header
`header:` — the Header component.

- `position:` — the placement for the header navbar
  - Type: `String`
  - Available Options: `top`, `sidebar`, or `aside`
- `css_class:` — `position:` specific css classes
  - `top:` — add additional class when the header position is `top`
    - Type: `String`
  - `sidebar:` — add additional class when the header position is `sidebar`
    - Type: `String`
  - `aside:` — add additional class when the header position is `aside`
    - Type: `String`

### IndexAsGrid
`index_as_grid:` - the IndexAsGrid component.

- `breakpoint:` — use [Bootstrap]'s breakpoints
  - Type: `String`
  - Available Options: `sm`, `md`, `lg`, `xl`, `xxl` or `null`

### Inputs
`inputs:` — formtastic input components

#### DatePicker
See [Flatpickr] for config options.

#### DateTimePicker
See [Flatpickr] for config options.

#### TomSelect
See [TomSelect] for config options.

#### Text
- `counter:` — letter/word count limit config
  - `type:` — the mode for counting
    - Type: `String`
    - Available Options: `letter`, `word`
  - `limit:` — the maximum count
    - Type: `Integer`

### Sidebar
`sidebar:` — filters on the index page.

- `position:` — the default placement for the sidebar
  - Type: `String`
  - Available Options: `left`, or `right`

## Theme
You can update the theme of your application by overwriting the [Bootstrap] variables.
We also have our own variables in `app/assets/stylesheets/active_admin_bootstrap/meta/_variables.scss`
and vendor specific variables inside the `app/assets/stylesheets/active_admin_bootstrap/vendors` folder.


[ActiveAdmin]: https://activeadmin.info/1-general-configuration.html
[Bootstrap Icons]: https://icons.getbootstrap.com/
[Bootstrap]: https://getbootstrap.com/docs/5.0/getting-started/introduction/
[Flatpickr]: https://flatpickr.js.org/
[TomSelect]: https://tom-select.js.org/