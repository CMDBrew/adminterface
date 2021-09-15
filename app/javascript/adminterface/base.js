import 'bootstrap'
import './initializers'
import InputCounter from './lib/input_counter'
import ConfirmDialog from './lib/confirm_dialog'
import DetachedDropdown from './lib/detached_dropdown'

window.adminterface = {
  batchActions: null,
  confirmDialog: null,
  dropdown: [],
  filters: {},
  flatpickr: [],
  hasMany: [],
  headerToggler: [],
  inputCounter: [],
  inputs: {
    password: {
      visibility: []
    }
  },
  perPage: {},
  popover: [],
  tomSelect: [],
  tooltip: []
}

export { ConfirmDialog, InputCounter, DetachedDropdown }
