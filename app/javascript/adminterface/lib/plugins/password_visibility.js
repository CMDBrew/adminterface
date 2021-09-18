/* global DOMParser, adminterface */
import { getObjectValue, toHTMLCssString, addToDebugger } from '../utils'

class PasswordVisibility {
  constructor (element, options) {
    const translations = adminterface.meta.translations
    const defaults = {
      activeClass: 'show',
      wrapperClass: '.input-group'
    }

    this.element = element
    this.options = { ...defaults, ...options }
    this.translations = (getObjectValue(translations, 'inputs.password') || {})

    this._bind()
  }

  _template () {
    return `
      <div class="input-group-text password-visibility-toggler">
        <i data-mode="show" data-bs-toggle="tooltip" title="${getObjectValue(this.translations, 'visibility.show')}"></i>
        <i data-mode="hide" data-bs-toggle="tooltip" title="${getObjectValue(this.translations, 'visibility.hide')}"></i>
      </div>
    `
  }

  _isWrapped () {
    return this.element.parentNode.classList.contains(toHTMLCssString(this.options.wrapperClass))
  }

  _insert () {
    const el = this.element
    const toggler = new DOMParser().parseFromString(this._template(), 'text/html').body.childNodes[0]

    if (!this._isWrapped()) {
      const wrapper = document.createElement('div')
      el.parentNode.insertBefore(wrapper, el)
      wrapper.classList.add(toHTMLCssString(this.options.wrapperClass))
      wrapper.appendChild(el)
    }

    el.parentNode.insertBefore(toggler, el.nextSibling)
  }

  _bind () {
    this._insert()
    const group = this.element.closest('.password.input')
    const trigger = group.querySelector('.password-visibility-toggler')
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

    this.eventTarget = group
    addToDebugger(this, this.constructor.name, [])
  }
}

export default PasswordVisibility
