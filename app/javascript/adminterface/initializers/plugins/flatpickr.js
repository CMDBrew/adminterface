/* global adminterface */
import flatpickr from 'flatpickr'

const initFlatpickr = (element) => {
  const datePickerTriggerList = [].slice.call(element.querySelectorAll('[data-aa-flatpickr]'))

  const datePickerInstances = datePickerTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaFlatpickr || {})

    return flatpickr(el, options)
  })

  adminterface.flatpickr = [...adminterface.flatpickr, ...datePickerInstances]
}

document.addEventListener('DOMContentLoaded', () => {
  initFlatpickr(document)

  document.body.addEventListener('confirm_dialog:before_open', (el) => {
    initFlatpickr(el.detail.dialogForm)
  })
})

export default initFlatpickr
