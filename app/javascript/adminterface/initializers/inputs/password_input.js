import { PasswordVisibilityToggler } from '../../lib/inputs/password_input'

const PasswordVisibilityTogglerInit = function (element) {
  const visibilityTriggerList = [].slice.call(element.querySelectorAll('[data-aa-password-visibility-toggler]'))
  visibilityTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaPasswordVisibilityToggler || {})

    return new PasswordVisibilityToggler(el, options)
  })
}

document.addEventListener('DOMContentLoaded', () => PasswordVisibilityTogglerInit(document))

export default PasswordVisibilityTogglerInit
