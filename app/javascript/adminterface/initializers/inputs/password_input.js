import { PasswordVisibilityToggler } from '../../lib/inputs/password_input'

const PasswordVisibilityTogglerInit = function (element) {
  element.querySelectorAll('[data-aa-password-visibility-toggler]').forEach((el) => {
    const options = JSON.parse(el.dataset.aaPasswordVisibilityToggler || {})

    /* eslint-disable no-new */
    new PasswordVisibilityToggler(el, options)
    /* eslint-enable no-new */
  })
}

document.addEventListener('DOMContentLoaded', () => PasswordVisibilityTogglerInit(document))

export default PasswordVisibilityTogglerInit
