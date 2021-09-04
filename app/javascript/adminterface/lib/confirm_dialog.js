/* global Event, DOMParser */

import { Modal } from 'bootstrap'
import { serializeObject } from './utils'
import FlatpickerInit from '../initializers/flatpickr'
import TomSelect from '../initializers/tom_select'
import Input from './input'
import PasswordVisibilityTogglerInit from '../initializers/inputs/password_input'

class ConfirmDialog {
  constructor (message, inputs, options, callback) {
    const defaults = {
      buttons: {
        ok: {
          text: 'Confirm',
          class: 'btn btn-primary'
        },
        cancel: {
          text: 'Cancel',
          class: 'btn btn-link'
        }
      }
    }

    this.message = message
    this.inputs = inputs
    this.callback = callback
    this.events = {
      beforeOpen: new Event('confirm_dialog:before_open'),
      afterOpen: new Event('confirm_dialog:after_open')
    }

    this.options = { ...defaults, ...options }
    this._bind()
  }

  _template () {
    const buttons = this.options.buttons || {}
    const message = this.message ? `<p id="dialog-message">${this.message}</p>` : ''

    return `
      <div id="modal-dialog-confirm" class='modal fade' tabindex='-1'>
        <div class='modal-dialog modal-dialog-centered modal-dialog-scrollable'>
          <div class='modal-content'>
            <div class='modal-body'>
              ${message}
              ${this._form()}
            </div>
            <div class='modal-footer'>
              <button type='button' class='${(buttons.cancel || {}).class}' data-bs-dismiss='modal'>${(buttons.cancel || {}).text}</button>
              <button id="modal-dialog-confirm-button" type='button' class='${(buttons.ok || {}).class}'>${(buttons.ok || {}).text}</button>
            </div>
          </div>
        </div>
      </div>`
  }

  _form () {
    let html = `<form id="modal-dialog-confirm-form" title="${this.message}">`
    for (const name in this.inputs) {
      const options = this.inputs[name]
      html += (new Input(name, options)).render()
    }

    html += '</form>'
    return html
  }

  _initPlugins (el) {
    FlatpickerInit(el)
    TomSelect(el)
    PasswordVisibilityTogglerInit(el)
  }

  _create () {
    const dialogNode = new DOMParser().parseFromString(this._template(), 'text/html').body.childNodes[0]
    return document.body.appendChild(dialogNode)
  }

  _bind () {
    const _self = this
    const dialogEl = this._create()
    const dialogForm = dialogEl.querySelector('#modal-dialog-confirm-form') || {}
    const cancelButton = dialogEl.querySelector('#modal-dialog-confirm-button') || {}
    const beforeOpenEvent = this.events.beforeOpen
    const afterOpenEvent = this.events.afterOpen
    const serializeForm = serializeObject
    const dialogConfirm = new Modal(dialogEl, {
      keyboard: true,
      backdrop: 'static'
    })

    cancelButton.addEventListener('click', function (e) {
      _self.callback(serializeForm(dialogForm))
      dialogConfirm.hide()
    })

    dialogEl.addEventListener('shown.bs.modal', function (_e) {
      _self._initPlugins(dialogEl)
    })

    dialogEl.addEventListener('hidden.bs.modal', function (_e) {
      dialogEl.remove()
    })

    beforeOpenEvent.detail = { dialogForm }
    afterOpenEvent.detail = { dialogForm }
    document.body.dispatchEvent(beforeOpenEvent)
    dialogConfirm.show()
    document.body.dispatchEvent(afterOpenEvent)
  }
}

export default ConfirmDialog
