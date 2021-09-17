/* global adminterface */
import flatpickr from 'flatpickr'

const initFlatpickr = (element) => {
  const flatpickrTriggerList = [].slice.call(element.querySelectorAll('[data-aa-flatpickr]'))

  const flatpickrInstances = flatpickrTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaFlatpickr || {})

    return flatpickr(el, options)
  })

  adminterface.flatpickr = [...adminterface.flatpickr, ...flatpickrInstances]
}

document.addEventListener('DOMContentLoaded', () => {
  initFlatpickr(document)
})

document.addEventListener('confirm_dialog:before_open', (el) => {
  initFlatpickr(el.detail.dialogForm)
})

export default initFlatpickr
