/* global Event, adminterface */
import ConfirmDialog from './confirm_dialog'
import CheckboxToggler from './checkbox_toggler'
import TableCheckboxToggler from './table_checkbox_toggler'

class BatchActions {
  constructor (element) {
    this.element = element
    this.modal = null
    this.events = {
      confirm: new Event('confirm:complete')
    }
    this.options = {
      batchActionSelector: '.batch_actions_selector',
      collection: '.paginated_collection',
      toggler: '#collection_selection_toggle_all'
    }

    this._bind()
  }

  _bindLinks () {
    const $elements = this.element.querySelectorAll(`${this.options.batchActionSelector} li a`)
    const _self = this

    $elements.forEach((el) => {
      el.addEventListener('click', (e) => {
        const el = e.target
        const dialogOptions = JSON.parse(el.dataset.aaConfirmDialog || '{}')
        let message

        e.stopPropagation()
        e.preventDefault()

        if ((message = el.dataset.confirm)) {
          this.modal = new ConfirmDialog(message, JSON.parse(el.dataset.inputs), dialogOptions, function (inputs) {
            const event = _self.events.confirm
            event.detail = { inputs }
            el.dispatchEvent(event)
          })
        }
      })
    })
  }

  _bindConfirm () {
    const $elements = this.element.querySelectorAll(`${this.options.batchActionSelector} li a`)

    $elements.forEach((el) => {
      el.addEventListener(this.events.confirm.type, function (e) {
        let value
        const $batchActionInputs = document.getElementById('batch_action_inputs')
        const inputs = (e.detail || {}).inputs

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

    adminterface.addObserver(this.element, this, this.constructor.name)
  }
}

export default BatchActions
