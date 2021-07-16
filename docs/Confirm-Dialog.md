# Confirm Dialog
- [Confirm Dialog](#confirm-dialog)
  - [Override the Defaults](#override-the-defaults)
  - [Translatiojns](#translatiojns)

## Override the Defaults
Default values are listed below:

```ruby
buttons: {
  ok: {
    text: 'Confirm',
    class: 'btn btn-primary'
  },
  cancel: {
    text: 'Cancel',
    class: 'btn btn-link'
  }
}
```

You can override the defaults by passing in the `data-confirm-dialog` attr inside your html.
```ruby
link_to(
  "Confirm", "fake/path",
  data: {
    confirm: "My confirm message",
    "aa-confirm-dialog": {
      buttons: {
        ok: {text: "Okay!"}
      }
    }
  }
)
```

## Translatiojns
To change the default I18n translations you can create an `active_admin.en.yml` file and update the `active_admin.batch_actions.confirm_dialog` key like below:

```yaml
---
en:
  active_admin:
    confirm_dialog:
      cancel: Cancel
      ok: Okay!
```
