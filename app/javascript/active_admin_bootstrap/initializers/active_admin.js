import $ from 'jquery'
import 'jquery-ui/ui/widgets/dialog'
// import 'jquery-ui/ui/widgets/sortable'
import 'jquery-ui/ui/widget'
import 'jquery-ujs'

import '@activeadmin/activeadmin/src/ext/jquery'
import '@activeadmin/activeadmin/src/ext/jquery-ui'
// import '@activeadmin/activeadmin/src/initializers/batch-actions'
// import '@activeadmin/activeadmin/src/initializers/checkbox-toggler'
// import '@activeadmin/activeadmin/src/initializers/dropdown-menu'
// import '@activeadmin/activeadmin/src/initializers/filters'
// import '@activeadmin/activeadmin/src/initializers/has-many'
// import '@activeadmin/activeadmin/src/initializers/per-page'
// import '@activeadmin/activeadmin/src/initializers/table-checkbox-toggler'

import ModalDialog from '@activeadmin/activeadmin/src/lib/modal-dialog'

/* eslint-disable camelcase */
function modal_dialog (message, inputs, callback) {
  console.warn('ActiveAdmin.modal_dialog is deprecated in favor of ActiveAdmin.ModalDialog, please update usage.')
  return ModalDialog(message, inputs, callback)
}

export { ModalDialog, modal_dialog }
/* eslint-enable camelcase */

// Override JQuery defaults
$.extend($.ui.dialog.prototype.options, {
  modal: true,
  resizable: false,
  draggable: false
})
