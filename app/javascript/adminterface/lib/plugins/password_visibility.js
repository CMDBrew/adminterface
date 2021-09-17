/* global adminterface */

class PasswordVisibility {
  constructor (element, options) {
    const defaults = {
      activeClass: 'show',
      trigger: '.password-visibility-toggler'
    }

    this.element = element
    this.options = { ...defaults, ...options }

    this._bind()
  }

  _bind () {
    const group = this.element.closest('.password.input')
    const trigger = group.querySelector(this.options.trigger)
    const input = group.querySelector('input')
    const activeClass = this.options.activeClass

    trigger.addEventListener('click', function (e) {
      e.preventDefault()

      if (trigger.classList.contains(activeClass)) {
        trigger.classList.remove(activeClass)
        input.type = 'password'
      } else {
        trigger.classList.add(activeClass)
        input.type = 'text'
      }
    })

    adminterface.inputs.password.visibility = [...adminterface.inputs.password.visibility, this]
  }
}

export default PasswordVisibility
