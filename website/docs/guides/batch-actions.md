---
sidebar_position: 3
---

# Batch Actions
We've kept the existing functionalities with some minor adjustments. Please see [ActiveAdmin] for basic configurations.

## Batch Action Forms
### Inputs

:::danger

We've updated the naming for input types to be consistent with Formtastic forms. Also, please note the following input types are currently not supported:
- `:file`
- `:rich_text`

:::

| ActiveAdmin | Formtastic (ActiveAdminBootstrap) |
| ----------- | --------------------------------- |
| `:text`     | `:string`                         |
| `:textarea` | `:text`                           |
| `:checkbox` | `:boolean`                        |

Here is an actual example
```ruby
# app/admin/users.rb

# ActiveAdmin
batch_action :flag, form: {
  reason: :text,
  notes:  :textarea,
  hide:   :checkbox,
} do |ids, inputs|
  # ...
end

# ActiveAdminBootstrap
batch_action :flag, form: {
  reason: :string,
  notes:  :text,
  hide:   :boolean,
} do |ids, inputs|
  # ...
end
```

The form now accepts options as a Hash. See [Customizing the Form]. See more information about form configurations in [Customizing the Form].

```ruby
# app/admin/users.rb
ActiveAdmin.register User do
  batch_action :flag, form: {
    name: {as: :string},
    secret: {as: :hidden, input_html: {value: "secret"}},
    updated_at: {as: :date_picker}
  } do |ids, inputs|
    # inputs is a hash of all the form fields you requested
    redirect_to collection_path, notice: [ids, inputs].to_s
  end
end
```

### Confirm Dialog
You can change the styles of the confirm dialog by passing in `confirm_dialog:` option. See [Confirm Dialog] for more details.

```ruby
# app/admin/users.rb
ActiveAdmin.register User do
  batch_action :flag, confirm_dialog: {
    buttons: {
      ok: {class: "btn btn-danger", text: "Confirm!!!"}
    }
  } do |ids, inputs|
    # inputs is a hash of all the form fields you requested
    redirect_to collection_path, notice: [ids, inputs].to_s
  end
end
```

To change the default I18n translations you can create an `active_admin.en.yml` file and update the `active_admin.batch_actions.confirm_dialog` key like below:
```yaml
# config/locales/active_admin.en.yml
---
en:
  active_admin:
    batch_actions:
      confirm_dialog:
        cancel: Cancel
        ok: Okay!
```

[ActiveAdmin]: https://activeadmin.info/9-batch-actions.html
[Customizing the Form]: ./customizing-the-form.md
[Confirm Dialog]: ./confirm-dialog.md
