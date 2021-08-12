---
sidebar_position: 1
---

# Arbre Components
We've kept the existing functionalities and applied [Bootstrap] styles with some enhancements. Please see [ActiveAdmin] for basic configurations.

## Icons
We've added a component that helper rendering icons inside [ActiveAdmin]. The default icons we're using are [Bootstrap Icons].
If you wish, you can change them to your custom icons by changing the value for `icon:` inside `/lib/active_admin_bootstrap/fixtures/css_classes.yml`. You can find more information in [Configuration](../start/configuration.md).

## Panels
- **Configuration**: [ActiveAdmin/arbre-components/panels]

### Title not required
We've removed the requirements for the `title` param. If you don't pass in the title param or passed in an empty value, the panel header will not be visible.

```ruby
show do
  panel do
    h1 "Hello world"
  end

  panel "" do
    h1 "Hello world"
  end
end
```

### Header and Body HTML options
You can pass in `:header_html` and `:body_html` to add additional attributes to the panel's header and body, respectively.

```ruby
show do
  panel header_html: {class: "my-header-class"}, body_html: {class: "my-body-class"} do
    h1 "Hello world"
  end
end
```

## Columns
We've replaced columns from using inline css to using [Bootstrap/layout/grid].

- **Configuration**: [ActiveAdmin/arbre-components/columns]

### Gutter
You can change the gutter between columns by passing in your own gutter class.
```ruby
columns(class: "g-5") do
  column do
    h1 "Column #1"
  end
  column do
    h1 "Column #2"
  end
end
```

Will output
```html
<div class="g-5 row">
  <div class="col-md">
    <h1>Column #1</h1>
  </div>
  <div class="col-md">
    <h1>Column #2</h1>
  </div>
</div>
```

### Sizing
:::danger

`:max_width` and `:min_width` options no longer works.

:::

```ruby
columns do
  column(class: "custom-column", size: "md", span: 8) do
    h1 "Column #1"
  end
  column(class: "custom-column", size: "md", span: 4) do
    h1 "Column #2"
  end
end
```

Will output
```html
<div class="g-3 row">
  <div class="col-md-8 custom-column">
    <h1>Column #1</h1>
  </div>
  <div class="col-md-4 custom-column">
    <h1>Column #2</h1>
  </div>
</div>
```

## Table For
- **Configuration**: [ActiveAdmin/arbre-components/table_for]

### Overflow & Scrolling
By usings [Bootstrap]'s `.table-responsive`, you can add scrolling to your table.

```ruby
div class: "table-responsive" do
  table_for order.payments do
    column(:payment_type) { |payment| payment.payment_type.titleize }
    column "Received On", :created_at
    column "Details & Notes", :payment_details
    column "Amount", :amount_in_dollars
  end
end
```

## Tabs
We've replaced jQuery tabs with [Bootstrap].

- **Configuration**: [ActiveAdmin/arbre-components/tabs]

### Nav and Content HTML Options
You can pass in `:nav_html` and `:content_html` to add additional attributes to the tab's nav and content, respectively.

```ruby
tabs nav_html: {class: "my-tabs-nav"}, content_html: {class: "my-tabs-content"} do
  tab "tab-1"
  tab "tab-2"
end
```

### HTTP Tabs
Sometimes, you would want the page to refresh when viewing another tab. To achieve that, you can pass in `http: true` to the tabs.
If you add an `:id` to the tab, it will automatically set as the anchor for the nav links.

```ruby
tabs(http: true, id: "test") do
  tab "tab-1" do
    h1 "tab1"
  end
  tab "tab-2" do
    h1 "tab2"
  end
end
```

The tab parameter is memorized in the session, so it works with form submission as well! ✌️
```ruby
ActiveAdmin.register User do
  form do |f|
    panel do
      tabs http: true, id: "user-form" do
        tab :info do
          f.inputs do
            f.input :name
          end
        end
        tab :password do
          f.inputs do
            f.input :password
          end
        end
      end

      f.actions
    end
  end
end
```

[ActiveAdmin]: https://activeadmin.info/12-arbre-components.html
[ActiveAdmin/arbre-components/columns]: https://activeadmin.info/12-arbre-components.html#columns
[ActiveAdmin/arbre-components/panels]: https://activeadmin.info/12-arbre-components.html#panels
[ActiveAdmin/arbre-components/table_for]: https://activeadmin.info/12-arbre-components.html#table_for
[ActiveAdmin/arbre-components/tabs]: https://activeadmin.info/12-arbre-components.html#tabs
[Bootstrap Icons]: https://icons.getbootstrap.com/
[Bootstrap]: https://getbootstrap.com/docs/5.0/
[Bootstrap/layout/grid]: https://getbootstrap.com/docs/5.0/layout/grid/