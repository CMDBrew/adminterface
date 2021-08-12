---
sidebar_position: 3
---

# Batch Actions
We've kept the existing functionalities with some minor adjustments (marked with ✨). Please see [ActiveAdmin] for basic configurations.

## Batch Action Forms
:::danger

We've changed how you specify the input types for the "Batch Action forms" to be consistent with Formtastic forms. See more information about form configurations in [Customizing the Form].

:::

### Form
You will now need to specify the input options as a `hash`. See [Customizing the Form].
Please note the following input types are currently not supported:
- `:file`
- `:rich_text`

```ruby
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
