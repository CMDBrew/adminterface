/* global adminterface */

import { cookieSet, cookieGet } from './utils'

class HeaderToggler {
  constructor (element, options) {
    const defaults = {
      container: 'body',
      activeClass: 'header-active',
      cookieName: 'header-state',
      cookieExpireSec: 30 * 24 * 60 * 60
    }

    this.element = element
    this.options = { ...defaults, ...options }

    this._bind()
  }

  _add () {
    const $container = document.querySelector(this.options.container)
    $container.classList.add(this.options.activeClass)
    cookieSet(this.options.cookieName, this.options.activeClass, this.options.cookieExpireSec)
  }

  _remove () {
    const $container = document.querySelector(this.options.container)
    $container.classList.remove(this.options.activeClass)
    cookieSet(this.options.cookieName, null, 0)
  }

  _bind () {
    const cookie = cookieGet(this.options.cookieName)
    const $breakpointHelper = document.querySelector('.breakpoint-up-helper')
    const $container = document.querySelector(this.options.container)
    const _self = this

    if (cookie === this.options.activeClass && window.getComputedStyle($breakpointHelper).visibility === 'visible') {
      this._add()
    }

    this.element.addEventListener('click', function (e) {
      e.preventDefault()
      if ($container.classList.contains(_self.options.activeClass)) {
        _self._remove()
      } else {
        _self._add()
      }
    })

    adminterface.headerToggler = [...adminterface.headerToggler, this]
  }
}

export default HeaderToggler
