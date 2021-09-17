/* global adminterface */
import flatpickr from 'flatpickr'

const onDOMReady = (element) => {
  const datePickerTriggerList = [].slice.call(element.querySelectorAll('[data-aa-flatpickr]'))

  const datePickerInstances = datePickerTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaFlatpickr || {})

    return flatpickr(el, options)
  })

  adminterface.flatpickr = [...adminterface.flatpickr, ...datePickerInstances]
}

document.addEventListener('DOMContentLoaded', () => {
  onDOMReady(document)

  document.body.addEventListener('confirm_dialog:before_open', (el) => {
    onDOMReady(el.detail.dialogForm)
  })
})
