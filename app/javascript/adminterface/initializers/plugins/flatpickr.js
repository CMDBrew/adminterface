import flatpickr from 'flatpickr'
import { addToDebugger } from '../../lib/utils'

const initFlatpickr = (element) => {
  const flatpickrTriggerList = [].slice.call(element.querySelectorAll('[data-aa-flatpickr]'))

  flatpickrTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaFlatpickr || {})
    const instance = flatpickr(el, options)

    addToDebugger(instance, 'flatpickr', [])
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
