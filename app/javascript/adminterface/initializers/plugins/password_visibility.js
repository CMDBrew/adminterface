import PasswordVisibility from '../../lib/plugins/password_visibility'
import initBootstrap from '../bootstrap'

const initPasswordVisibility = function (element) {
  const visibilityTriggerList = [].slice.call(element.querySelectorAll('[data-aa-password-visibility]'))
  visibilityTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaPasswordVisibility || {})
    const instance = new PasswordVisibility(el, options)

    initBootstrap(instance.eventTarget)
    return instance
  })
}

document.addEventListener('DOMContentLoaded', () => {
  initPasswordVisibility(document)
})

document.addEventListener('confirm_dialog:before_open', (el) => {
  initPasswordVisibility(el.detail.dialogForm)
})

export default initPasswordVisibility
