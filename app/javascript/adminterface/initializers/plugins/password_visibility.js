import PasswordVisibility from '../../lib/plugins/password_visibility'

const onDOMReady = function (element) {
  const visibilityTriggerList = [].slice.call(element.querySelectorAll('[data-aa-password-visibility]'))
  visibilityTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaPasswordVisibility || {})

    return new PasswordVisibility(el, options)
  })
}

document.addEventListener('DOMContentLoaded', () => {
  onDOMReady(document)

  document.body.addEventListener('confirm_dialog:before_open', (el) => {
    onDOMReady(el.detail.dialogForm)
  })
})
