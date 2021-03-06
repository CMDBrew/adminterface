import Rails from '@rails/ujs'
import ConfirmDialog from '../lib/confirm_dialog'

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

  /* eslint-disable no-new */
  new ConfirmDialog(message, inputs, options, onConfirm)
  /* eslint-enable no-new */

  return false
}
