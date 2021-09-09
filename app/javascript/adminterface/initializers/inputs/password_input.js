/* global adminterface */

import { PasswordVisibilityToggler } from '../../lib/inputs/password_input'

const PasswordVisibilityTogglerInit = function (element) {
  const passwordInputTriggerList = [].slice.call(element.querySelectorAll('[data-aa-password-visibility-toggler]'))
  const passwordInputInstances = passwordInputTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaPasswordVisibilityToggler || {})

    return new PasswordVisibilityToggler(el, options)
  })

  adminterface.passwordInput.visibilityToggler = [...adminterface.passwordInput.visibilityToggler, ...passwordInputInstances]
}

document.addEventListener('DOMContentLoaded', () => {
  adminterface.passwordInput = {
    visibilityToggler: []
  }

  PasswordVisibilityTogglerInit(document)
})

export default PasswordVisibilityTogglerInit
