import BaseInput from './base_input'
import { getObjectValue } from '../utils'

class PasswordVisibilityToggler {
  constructor (element, options) {
    const defaults = {
      activeClass: 'show'
    }

    this.element = element
    this.options = { ...defaults, ...options }

    this._bind()
  }

  _bind () {
    const $element = this.element
    const $group = this.element.closest('.password.input')
    const $input = $group.querySelector('input')
    const activeClass = this.options.activeClass

    $element.addEventListener('click', function (e) {
      e.preventDefault()

      if ($element.classList.contains(activeClass)) {
        $element.classList.remove(activeClass)
        $input.type = 'password'
      } else {
        $element.classList.add(activeClass)
        $input.type = 'text'
      }
    })
  }
}

class PasswordInput extends BaseInput {
  constructor (name, options) {
    const meta = (document.querySelector('#meta-tags-for-js meta[name="translations"]') || {})
    const I18n = JSON.parse(meta.content)

    super(name, options)
    this.visibility = this.options.visibility
    this.translations = (getObjectValue(I18n, 'inputs.password') || {})
  }

  _defaultInputHTMLOptions () {
    const options = {
      type: 'password'
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }

  _labelHTML () {
    if (this.visibility) {
      return `
        <div class="label-group">
          ${super._labelHTML()}
          <div class="password-visibility-toggler" data-aa-password-visibility-toggler=true>
            <span data-mode="show">${getObjectValue(this.translations, 'visibility.show')}</span>
            <span data-mode="hide">${getObjectValue(this.translations, 'visibility.hide')}</span>
          </div>
        </div>
      `
    } else {
      return super._labelHTML()
    }
  }
}

export { PasswordInput, PasswordVisibilityToggler }
