---
sidebar_position: 2
---

# Customizing the Form
We've kept the existing functionalities and applied [Bootstrap] styles with some additional inputs types and enhancements. Please see [Formtastic] and [ActiveAdmin] for basic configurations.

## Form
### Multiple Forms
```ruby
ActiveAdmin.register User do
  form multiple: true do
    form_section [:admin, resource] do |f|
      f.input :name
      ...
      f.actions
    end

    form_section [:admin, resource] do |f|
      f.input :email
      ...
      f.actions
    end
  end
end
```

## Inputs
### Boolean
`:boolean` - a checkbox. Default for column types: `:boolean`.

- **Configuration**: [Formtastic/BooleanInput]
- **Styling**: [Bootstrap/checks-radios#checks]

#### Examples
```ruby
f.input :accept, as: :boolean
```

### CheckBoxes
`:check_boxes` - a set of check_box inputs. Alternative to `:select` for ActiveRecord-associations: `has_many`, and `has_and_belongs_to_many`.

- **Configuration**: [Formtastic/CheckBoxesInput]
- **Styling**: [Bootstrap/checks-radios#checks]

#### Examples
```ruby
f.input :interests, as: :check_boxes, collection: %w[movies sports]
```

#### Addons
- [Inline Options](#inline-radio--check-options)

### Color
`:color` - a color select using the [Bootstrap] color component. New in HTML5.

- **Configuration**: [Formtastic/StringInput]
- **Styling**: [Bootstrap/form-control#color]

#### Examples
```ruby
f.input :favorite_color, as: :color
```

#### Addons
- [Input Groups](#input-groups)

### Country
:::danger

Requires a `country_select` gem to be installed.

:::

`:country` - a select menu of country names. Default for column types: :string with name "country".


- **Configuration**: [Formtastic/CountryInput], [CountrySelect]
- **Styling**: [Bootstrap/select]

#### Examples
```ruby
# basic
f.input :country, as: :country

# prioritize countries
f.input :country, as: :country, priority_countries: ["GB", "FR", "DE"]

# exclude countries
f.input :country, as: :country, except: ["GB", "FR", "DE"]

# only countries
f.input :country, as: :country, only: ["GB", "FR", "DE"]
```

#### Compatibility
:::danger

BatchAction form only supports the following options:
- `priority_countries:`
- `except:`
- `only:`

:::

#### Addons
- [Input Groups](#input-groups)

### Datalist
`:datalist` - a text field with a accompanying [datalist tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/datalist) which provides options for autocompletion.

- **Configuration**: [Formtastic/DatalistInput]
- **Styling**: [Bootstrap/form-control]

#### Examples
```ruby
f.input :friend, as: :datalist, collection: %w[john mary]
```

#### Addons
- [Input Groups](#input-groups)

### DatePicker
`:date_picker` - a date select. Alternative to `:date` using the [Flatpickr] js library replacing the jQuery datepicker in [ActiveAdmin]

- **Configuration**: [Formtastic/StringInput], [Configuration](../start/configuration.md)
- **Styling**: [Bootstrap/form-control], [Flatpickr]

#### Examples
```ruby
# basic
f.input :published_at, as: :date_picker

# change flatpickr config
f.input :published_at, as: :datetime_picker, flatpickr: {altFormat: "Y-m-d"}
```

`:datepicker` also works for ActiveAdmin datepicker compatibility
```ruby
f.input :published_at, as: :datepicker
```

#### Addons
- [Input Groups](#input-groups)

### DateSelect
`:date_select` - a date select. Default for column types: `:date`.

- **Configuration**: [Formtastic/DateSelectInput]
- **Styling**: [Bootstrap/select]

#### Examples
```ruby
f.input :published_at, as: :date_select
```

### DateTimePicker
`:datetime_picker` - a date and time select. Alternative to `:datetime` using the [Flatpickr] js library.

- **Configuration**: [Formtastic/StringInput], [Configuration](../start/configuration.md)
- **Styling**: [Bootstrap/form-control], [Flatpickr]

#### Examples
```ruby
# basic
f.input :published_at, as: :datetime_picker

# change flatpickr config
f.input :published_at, as: :datetime_picker, flatpickr: {altFormat: "Y-m-d, h:i K"}
```

#### Addons
- [Input Groups](#input-groups)

### DateTimeSelect
`:datetime_select` - a date and time select. Default for column types: `:datetime`.

- **Configuration**: [Formtastic/DateTimeSelectInput]
- **Styling**: [Bootstrap/select]

#### Examples
```ruby
f.input :published_at, as: :datetime_select
```

### Email
`:email` - a text field (just like string). Default for columns with name matching "email". New in HTML5. Works on some mobile browsers already.

- **Configuration**: [Formtastic/EmailInput]
- **Styling**: [Bootstrap/form-control]

#### Examples
```ruby
f.input :email, as: :email
```

#### Addons
- [Input Groups](#input-groups)

### File
`:file` - a file field.

- **Configuration**: [Formtastic/FileInput]
- **Styling**: [Bootstrap/form-control#file-input]

#### Examples
```ruby
f.input :attachment, as: :file
```

#### Addons
- [Input Groups](#input-groups)

### Hidden
`:hidden` - a hidden field. Creates a hidden field (added for compatibility).

- **Configuration**: [Formtastic/HiddenInput]
- **Styling**: not visible

#### Examples
```ruby
f.input :invisible, as: :hidden
```

### Number
`:number` - a text field (just like string). Default for column types: `:integer`, `:float`, and `:decimal`.

- **Configuration**: [Formtastic/NumberInput]
- **Styling**: [Bootstrap/form-control]

#### Examples
```ruby
f.input :price, as: :number
```

#### Addons
- [Input Groups](#input-groups)

### Password
`:password` - a password input. Default for column types: `:string` with name matching "password".

- **Configuration**: [Formtastic/PasswordInput]
- **Styling**: [Bootstrap/form-control]

#### Examples
```ruby
f.input :secret, as: :password
```

#### Addons
- [Input Groups](#input-groups)

### Phone
`:phone` - a text field (just like string). Default for columns with name matching "phone" or "fax". New in HTML5.

- **Configuration**: [Formtastic/PhoneInput]
- **Styling**: [Bootstrap/form-control]

#### Examples
```ruby
f.input :telephone, as: :phone
```

#### Addons
- [Input Groups](#input-groups)

### Radio
`:radio` - a set of radio inputs. Alternative to `:select` for ActiveRecord-associations: `belongs_to`.

- **Configuration**: [Formtastic/RadioInput]
- **Styling**: [Bootstrap/checks-radios#radios]

#### Examples
```ruby
f.input :interests, as: :radio, collection: %w[movies sports]
```

#### Addons
- [Inline Options](#inline-radio--check-options)

### Range
`:range` - a slider field using the [Bootstrap] range component.

- **Configuration**: [Formtastic/RangeInput]
- **Styling**: [Bootstrap/range]

#### Examples
```ruby
f.input :quantity, as: :range
```

### RichText
:::danger

You need to install ActionText to use this. See the [official doc](https://edgeguides.rubyonrails.org/action_text_overview.html).

:::

`:rich_text` - a WYSIWYG editor input using [Trix] for [Rails/ActionText] attributes.

- **Configuration**: [Formtastic/TextInput]
- **Styling**: custom

#### Examples
```ruby
f.input :biography, as: :rich_text
```

### Search
`:search` - a text field (just like string). Default for columns with name matching "search". New in HTML5. Works on Safari.

- **Configuration**: [Formtastic/SearchInput]
- **Styling**: [Bootstrap/form-control]

#### Examples
```ruby
f.input :keyword, as: :search
```

#### Addons
- [Input Groups](#input-groups)

### Select
`:select` - a select menu. Default for ActiveRecord associations: `belongs_to`, `has_many`, and `has_and_belongs_to_many`.

- **Configuration**: [Formtastic/SelectInput], [TomSelect], [General-Configurations]
- **Styling**: [Bootstrap/select]

#### Examples
```ruby
f.input :interests, as: :select, collection: %w[movies sports]
```

You can pass in the `multiple: true` option if you want to allow multiple selections.
```ruby
f.input :interests, as: :select, collection: %w[movies sports], multiple: true
```

You can enable [TomSelect] by passing the `tom_select:` option
```ruby
# basic
f.input :interests, as: :select, collection: %w[movies sports], tom_select: true

# change tom_select options
f.input :interests, as: :select, collection: %w[movies sports], tom_select: {create: true}
```

#### Addons
- [Input Groups](#input-groups)

### String
`:string` - a text field. Default for column types: `:string`

- **Configuration**: [Formtastic/StringInput]
- **Styling**: [Bootstrap/form-control]

#### Examples
```ruby
f.input :name, as: :string
```

#### Addons
- [Input Groups](#input-groups)

### Switch
`:boolean` - a toggle. Alternative to `:boolean` using the [Bootstrap] switch component.

- **Configuration**: [Formtastic/BooleanInput]
- **Styling**: [Bootstrap/checks-radios#switches]

#### Examples
```ruby
f.input :accept, as: :switch
```

### Text
`:text` - a textarea. Default for column types: `:text`

- **Configuration**: [Formtastic/TextInput], [General-Configurations]
- **Styling**: [Bootstrap/form-control]

#### Examples
```ruby
f.input :biography, as: :text
```

You can enable counter by passing the `counter:` option.

:::danger

To ensure data integrity, you should also implement server-side validations.

:::

```ruby
# basic
f.input :biography, as: :text, counter: true

# change counter options
f.input :biography, as: :text, counter: {type: "word", limit: 10}
```

### TimePicker
`:time_select` - a time select. Alternative to `:time`. New in HTML5.

- **Configuration**: [Formtastic/StringInput]
- **Styling**: [Bootstrap/form-control]

#### Examples
```ruby
f.input :published_at, as: :time_picker
```

#### Addons
- [Input Groups](#input-groups)

### TimeSelect
`:time_select` - a time select. Default for column types: `:time`.

- **Configuration**: [Formtastic/TimeSelectInput]
- **Styling**: [Bootstrap/select]

#### Examples
```ruby
f.input :published_at, as: :time_select
```

### TimeZone
`:time_zone` - a select input. Default for column types: :string with name matching "time_zone".

- **Configuration**: [Formtastic/TimeZoneInput]
- **Styling**: [Bootstrap/select]

#### Examples
```ruby
# basic
f.input :timezone, as: :time_zone

# prioritize timezones
f.input :timezone, as: :time_zone, priority_zones: ActiveSupport::TimeZone.us_zones
```

#### Compatibility
:::danger

BatchAction form only supports the following options:
- `priority_zones:`

:::

#### Addons
- [Input Groups](#input-groups)

### UrlInput
`:url` - a text field (just like string). Default for columns with name matching "url". New in HTML5. Works on some mobile browsers already.

- **Configuration**: [Formtastic/UrlInput]
- **Styling**: [Bootstrap/form-control]

#### Examples
```ruby
f.input :website, as: :url
```

#### Addons
- [Input Groups](#input-groups)

## Addons
### Input Groups
> 👉️ Check the [Inputs](#inputs) section for inputs work with this addon.

We've added support for [Bootstrap/input-group]. Use the `:append` and `:prepend` options to add html before and after the input. When you pass in either of the options it will wrap the input inside the `.input-group` element.
```ruby
f.input :name, as: :string,
  append: content_tag(:span, "append text", class: "input-group-text"),
  prepend: content_tag(:span, "prepend text", class: "input-group-text")
```

### Inline Radio & Check Options
> 👉️ Check the [Inputs](#inputs) section for inputs work with this addon.

You can pass in the `inline: true` option if you want to render the options inline.
```ruby
f.input :interests, as: :check_boxes, collection: %w[movies sports], inline: true
f.input :interests, as: :radio, collection: %w[movies sports], inline: true
```

## Nested Resources
We've replaced jQuery sortable with [SortableJS], but nested forms work exactly the same as [ActiveAdmin]. You can find the docs [here](https://activeadmin.info/5-forms.html#nested-resources).

### Example
```ruby
ActiveAdmin.register Post do
  permit_params :title, taggings_attributes: [:id, :tag]

  form do |f|
    f.inputs 'Details' do
      f.input :title
    end

    f.inputs do
      f.has_many :taggings, sortable: :position, sortable_start: 1 do |t|
        t.input :tag
      end
    end

    f.actions
  end
end
```

### HasMany & Arbre
The has_many fields do not work support Arbre elements since it doesn't have access to them. See https://github.com/activeadmin/activeadmin/issues/4043.
To add columns to your nested form:
```ruby
f.has_many :user_addresses, allow_destroy: true, sortable: :position, sortable_start: 1 do |k|
  k.inputs(class: "row") do
    k.input :fullname, wrapper_html: {class: "col-lg-6"}
  end +
    k.inputs(class: "row") do
      k.input :address_line1, wrapper_html: {class: "col-lg-6"}
      k.input :address_line2, wrapper_html: {class: "col-lg-6"}
    end
end
```

To add Arbre elements to your nested form:
```ruby
f.has_many :user_addresses, allow_destroy: true, sortable: :position, sortable_start: 1 do |k|
  k.inputs(class: "row") do
    k.input :fullname, wrapper_html: {class: "col-lg-6"}
  end +
    Arbre::Context.new do
      para "some hint texts"
    end.to_s +
    k.inputs(class: "row") do
      k.input :address_line1, wrapper_html: {class: "col-lg-6"}
      k.input :address_line2, wrapper_html: {class: "col-lg-6"}
    end
end
```

[ActiveAdmin]: https://activeadmin.info/5-forms.html
[Bootstrap]: https://getbootstrap.com/docs/5.0/getting-started/introduction/
[Bootstrap/checks-radios#checks]: https://getbootstrap.com/docs/5.0/forms/checks-radios#checks
[Bootstrap/checks-radios#radios]: https://getbootstrap.com/docs/5.0/forms/checks-radios#radios
[Bootstrap/checks-radios#switches]: https://getbootstrap.com/docs/5.0/forms/checks-radios#switches
[Bootstrap/form-control]: https://getbootstrap.com/docs/5.0/forms/form-control/
[Bootstrap/form-control#color]: https://getbootstrap.com/docs/5.0/forms/form-control#color
[Bootstrap/form-control#file-input]: https://getbootstrap.com/docs/5.0/forms/form-control#file-input
[Bootstrap/input-group]: https://getbootstrap.com/docs/5.0/forms/input-group
[Bootstrap/range]: https://getbootstrap.com/docs/5.0/forms/range/
[Bootstrap/select]: https://getbootstrap.com/docs/5.0/forms/select/
[CountrySelect]: https://github.com/stefanpenner/country_select
[Flatpickr]: https://flatpickr.js.org/
[Formtastic]: https://github.com/formtastic/formtastic
[Formtastic/BooleanInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/BooleanInput
[Formtastic/CheckBoxesInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/CheckBoxesInput
[Formtastic/CountryInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/CountryInput
[Formtastic/DatalistInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/DatalistInput
[Formtastic/DateSelectInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/DateSelectInput
[Formtastic/DateTimeSelectInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/DateTimeSelectInput
[Formtastic/EmailInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/EmailInput
[Formtastic/FileInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/FileInput
[Formtastic/HiddenInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/HiddenInput
[Formtastic/NumberInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/NumberInput
[Formtastic/PasswordInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/PasswordInput
[Formtastic/PhoneInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/PhoneInput
[Formtastic/RadioInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/RadioInput
[Formtastic/RangeInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/RangeInput
[Formtastic/SearchInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/SearchInput
[Formtastic/SelectInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/SelectInput
[Formtastic/StringInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/StringInput
[Formtastic/TextInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/TextInput
[Formtastic/TimeSelectInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/TimeSelectInput
[Formtastic/TimeZoneInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/TimeZoneInput
[Formtastic/UrlInput]: https://rdoc.info/github/formtastic/formtastic/Formtastic/Inputs/UrlInput
[Rails/ActionText]: https://edgeguides.rubyonrails.org/action_text_overview.html
[SortableJS]: https://sortablejs.github.io/Sortable/
[TomSelect]: https://tom-select.js.org/
[Trix]: https://trix-editor.org/

