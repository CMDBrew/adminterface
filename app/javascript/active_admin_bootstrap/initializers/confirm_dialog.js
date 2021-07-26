import Rails from '@rails/ujs'
import ModalDialog from '../lib/modal_dialog'

let __SkipConfirmation = false

Rails.confirm = function (message, element) {
  const options = JSON.parse(element.dataset.aaConfirmDialog || '{}')
  const inputs = JSON.parse(element.dataset.inputs || '{}')

  if (__SkipConfirmation) return true

  function onConfirm () {
    __SkipConfirmation = true
    element.click()
    __SkipConfirmation = false
  }

  window.confirmDialog = new ModalDialog(message, inputs, options, onConfirm)

  return false
}
