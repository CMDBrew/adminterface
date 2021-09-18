import { addToDebugger } from './utils'

class DetachedDropdown {
  constructor (element, options) {
    const defaults = {
      menu: '.dropdown-menu'
    }

    this.element = element
    this.options = { ...defaults, ...options }

    this._bind()
  }

  _append (target, node) {
    target.append(node.parentElement.removeChild(node))
  }

  _bind () {
    const $menu = this.element.querySelector(this.options.menu)
    const _self = this

    this.element.addEventListener('show.bs.dropdown', function (_e) {
      _self._append(document.body, $menu)
    })

    this.element.addEventListener('hidden.bs.dropdown', function (_e) {
      _self._append(_self.element, $menu)
    })

    addToDebugger(this, 'detachedDropdown', [])
  }
}

export default DetachedDropdown
