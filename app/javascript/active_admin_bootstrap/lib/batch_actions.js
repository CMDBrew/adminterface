/* global Event */

import ModalDialog from '@activeadmin/activeadmin/src/lib/modal-dialog'
import CheckboxToggler from '../lib/checkbox_toggler'
import TableCheckboxToggler from '../lib/table_checkbox_toggler'

class BatchActions {
  constructor (element) {
    this.element = element
    this.options = {
      batchActionSelector: '.batch_actions_selector',
      collection: '.paginated_collection',
      toggler: '#collection_selection_toggle_all'
    }

    this._bind()
  }

  _bindLinks () {
    const confirmEvent = new Event('confirm:complete')
    const $elements = this.element.querySelectorAll(`${this.options.batchActionSelector} li a`)

    $elements.forEach((el) => {
      el.addEventListener('click', (e) => {
        const el = e.target
        let message

        e.stopPropagation()
        e.preventDefault()

        if ((message = el.dataset.confirm)) {
          ModalDialog(message, JSON.parse(el.dataset.inputs), inputs => {
            el.dispatchEvent(confirmEvent, inputs)
          })
        }
      })
    })
  }

  _bindConfirm () {
    const $elements = this.element.querySelectorAll(`${this.options.batchActionSelector} li a`)

    $elements.forEach((el) => {
      el.addEventListener('confirm:complete', (e, inputs) => {
        let value
        const $batchActionInputs = document.getElementById('batch_action_inputs')

        e.stopPropagation()
        e.preventDefault()

        if ((value = JSON.stringify(inputs))) {
          $batchActionInputs.removeAttribute('disabled')
          $batchActionInputs.value = value
        } else {
          $batchActionInputs.setAttribute('disabled', 'disabled')
        }

        document.getElementById('batch_action').value = e.target.dataset.action
        document.getElementById('collection_selection').submit()
      })
    })
  }

  _bindSelector () {
    const $indexTable = this.element.querySelector(`${this.options.collection} table.index_table`)
    const $batchActionSelector = this.element.querySelector(this.options.batchActionSelector)
    const $toggleAll = this.element.querySelector(this.options.toggler)
    const $checkboxes = this.element.querySelectorAll(`${this.options.collection} input[type="checkbox"]`)
    const $toggler = this.element.querySelector(`${this.options.batchActionSelector} .dropdown-toggle`)

    if ($batchActionSelector && $toggleAll) {
      if ($indexTable) {
        this.tableCheckboxToggler = new TableCheckboxToggler(`${this.options.collection} table.index_table`)
      } else {
        this.checkboxToggler = new CheckboxToggler(this.options.collection)
      }
    }

    $checkboxes.forEach((el) => {
      el.addEventListener('change', (_e) => {
        if (this.element.querySelectorAll(`${this.options.collection} input[type="checkbox"]:checked`).length) {
          $toggler.classList.remove('disabled')
        } else {
          $toggler.classList.add('disabled')
        }
      })
    })
  }

  _bind () {
    this._bindLinks()
    this._bindConfirm()
    this._bindSelector()
  }
}

export default BatchActions
