/* global adminterface */
import flatpickr from 'flatpickr'

const initFlatpickr = (element) => {
  const flatpickrTriggerList = [].slice.call(element.querySelectorAll('[data-aa-flatpickr]'))

  flatpickrTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaFlatpickr || '{}')
    const instance = flatpickr(el, options)

    adminterface.addObserver(el, instance, 'flatpickr')
    return instance
  })
}

document.addEventListener('DOMContentLoaded', () => {
  initFlatpickr(document)
})

document.addEventListener('confirm_dialog:before_open', (el) => {
  initFlatpickr(el.detail.dialogForm)
})

export default initFlatpickr
