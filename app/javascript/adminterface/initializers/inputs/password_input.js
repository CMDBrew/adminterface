import { PasswordVisibilityToggler } from '../../lib/inputs/password_input'

const onDOMReady = function (element) {
  const visibilityTriggerList = [].slice.call(element.querySelectorAll('[data-aa-password-visibility]'))
  visibilityTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaPasswordVisibility || {})

    return new PasswordVisibilityToggler(el, options)
  })
}

document.addEventListener('DOMContentLoaded', () => {
  onDOMReady(document)

  document.body.addEventListener('confirm_dialog:before_open', (el) => {
    onDOMReady(el.detail.dialogForm)
  })
})
