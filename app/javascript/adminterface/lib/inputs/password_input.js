/* global adminterface */
import BaseInput from './base_input'
import { getObjectValue } from '../utils'

class PasswordVisibilityToggler {
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

class PasswordInput extends BaseInput {
  constructor (name, options) {
    const translations = adminterface.meta.translations

    super(name, options)
    this.translations = (getObjectValue(translations, 'inputs.password') || {})
  }

  _defaultInputHTMLOptions () {
    const options = {
      type: 'password'
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }

  _inputGroupWrapping (input) {
    return `
      <div class="input-group">
        ${input}
        ${this._visibilityToggler()}
      </div>
    `
  }

  _visibilityToggler () {
    return `
      <div class="input-group-text password-visibility-toggler">
        <i data-mode="show" data-bs-toggle="tooltip" title="${getObjectValue(this.translations, 'visibility.show')}"></i>
        <i data-mode="hide" data-bs-toggle="tooltip" title="${getObjectValue(this.translations, 'visibility.hide')}"></i>
      </div>
    `
  }

  _inputHTML () {
    if (this.pluginish.enabled('password-visibility')) {
      return this._inputGroupWrapping(super._inputHTML())
    } else {
      return super._inputHTML()
    }
  }
}

export { PasswordInput, PasswordVisibilityToggler }
