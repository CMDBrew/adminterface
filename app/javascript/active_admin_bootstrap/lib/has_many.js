/* global Event */

import Sortable from 'sortablejs'

class HasMany {
  constructor (element) {
    this.element = element
    this.events = {
      removeBefore: new Event('has_many_remove:before'),
      removeAfter: new Event('has_many_remove:after'),
      addBefore: new Event('has_many_add:before'),
      addAfter: new Event('has_many_add:after')
    }
    this.options = {
      list: '.has-many-list',
      item: 'fieldset.has_many_fields',
      addLink: 'a.button.has_many_add',
      removeLink: 'a.button.has_many_remove',
      destroyInput: 'input[name$="[_destroy]"]'
    }

    this._bind()
  }

  _initSortable () {
    this.sortable = new Sortable(document.querySelector(this.options.list), {
      handle: '.handle',
      animation: 150,
      ghostClass: 'sortable-placeholder',
      dragClass: 'sortable-drag',
      onUpdate: () => { this._recomputePosition() }
    })
  }

  _recomputePosition () {
    const inputName = this.element.dataset.sortable
    const $items = this.element.querySelectorAll(this.options.item)
    let position = parseInt(this.element.dataset.sortableStart || 0, 10)

    $items.forEach((el) => {
      const destroyInput = el.querySelector(this.options.destroyInput) || {}
      const sortableInput = el.querySelector(`input[name$='[${inputName}]']`) || {}

      if (sortableInput) {
        sortableInput.value = destroyInput.checked ? '' : position++
      }
    })
  }

  _bindDestroyEvent (el) {
    el.addEventListener('change', (e) => this._recomputePosition())
  }

  _bindAddEvent (el) {
    el.addEventListener('click', (e) => {
      let beforeAdd
      const el = e.target
      const parent = this.element

      e.preventDefault()
      parent.dispatchEvent(beforeAdd = this.events.addBefore, [parent])

      if (!beforeAdd.defaultPrevented) {
        let index = parent.dataset.hasManyIndex || parent.querySelectorAll(this.options.item).length - 1
        parent.setAttribute('data-has-many-index', ++index)

        const regex = new RegExp(el.dataset.placeholder, 'g')
        const html = el.dataset.html.replaceAll(regex, index)
        const newNode = document.createElement('div')
        newNode.innerHTML = html

        const fieldset = newNode.firstElementChild
        const $list = this.element.querySelector(this.options.list)

        $list.appendChild(fieldset)
        this._bindEvents(fieldset)
        this._recomputePosition()

        return parent.dispatchEvent(this.events.addAfter, [fieldset, parent])
      }
    })
  }

  _bindRemoveEvent (el) {
    el.addEventListener('click', (e) => {
      const el = e.target
      const parent = this.element
      const fieldset = el.closest(this.options.item)

      e.preventDefault()
      this._recomputePosition()

      parent.dispatchEvent(this.events.removeBefore, [fieldset, parent])
      fieldset.remove()
      return parent.dispatchEvent(this.events.removeAfter, [fieldset, parent])
    })
  }

  _bindEvents (el) {
    const $addLinks = el.querySelectorAll(this.options.addLink)
    const $removeLinks = el.querySelectorAll(this.options.removeLink)
    const $destroyInputs = el.querySelectorAll(this.options.destroyInput)

    $addLinks.forEach((el) => this._bindAddEvent(el))
    $removeLinks.forEach((el) => this._bindRemoveEvent(el))
    $destroyInputs.forEach((el) => this._bindDestroyEvent(el))
  }

  _bind () {
    this._bindEvents(this.element)
    this._initSortable()
  }
}

export default HasMany
