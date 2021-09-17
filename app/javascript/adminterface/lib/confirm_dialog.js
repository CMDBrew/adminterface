/* global Event, DOMParser, adminterface */

import { Modal } from 'bootstrap'
import { serializeObject, deepMergeObject, getObjectValue } from './utils'
import { Input } from './input'

class ConfirmDialog {
  constructor (message, inputs, options, callback) {
    const cssClasses = getObjectValue(adminterface, 'meta.cssClasses.confirm_dialog')
    const translations = getObjectValue(adminterface, 'meta.translations.confirm_dialog')
    const defaults = {
      buttons: {
        confirm: {
          text: translations.confirm,
          class: cssClasses.confirm
        },
        cancel: {
          text: translations.cancel,
          class: cssClasses.cancel
        }
      }
    }

    this.message = message
    this.inputs = inputs
    this.callback = callback
    this.events = {
      beforeOpen: new Event('confirm_dialog:before_open'),
      afterOpen: new Event('confirm_dialog:after_open'),
      confirm: new Event('confirm_dialog:confirm'),
      cancel: new Event('confirm_dialog:cancel')
    }

    this.options = deepMergeObject(defaults, options)
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
              <button id="modal-dialog-confirm-button" type='button' class='${(buttons.confirm || {}).class}'>${(buttons.confirm || {}).text}</button>
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

  _create () {
    const dialogNode = new DOMParser().parseFromString(this._template(), 'text/html').body.childNodes[0]
    return document.body.appendChild(dialogNode)
  }

  _bind () {
    const _self = this
    const dialogEl = this._create()
    const dialogForm = dialogEl.querySelector('#modal-dialog-confirm-form') || {}
    const confirmButton = dialogEl.querySelector('#modal-dialog-confirm-button') || {}
    const beforeOpenEvent = this.events.beforeOpen
    const afterOpenEvent = this.events.afterOpen
    const confirmEvent = this.events.confirm
    const cancelEvent = this.events.cancel
    const serializeForm = serializeObject
    const dialogConfirm = new Modal(dialogEl, {
      keyboard: true,
      backdrop: 'static'
    })

    confirmButton.addEventListener('click', function (_e) {
      _self.callback(serializeForm(dialogForm))
      dialogConfirm.hide()
      confirmEvent.detail = { dialogForm }
      document.dispatchEvent(confirmEvent)
    })

    dialogEl.addEventListener('hidden.bs.modal', function (_e) {
      dialogEl.remove()
      cancelEvent.detail = { dialogForm }
      document.dispatchEvent(cancelEvent)
    })

    beforeOpenEvent.detail = { dialogForm }
    afterOpenEvent.detail = { dialogForm }
    document.dispatchEvent(beforeOpenEvent)
    dialogConfirm.show()
    document.dispatchEvent(afterOpenEvent)

    adminterface.confirmDialog = this
  }
}

export default ConfirmDialog
