/* global adminterface */

import flatpickr from 'flatpickr'

const FlatpickerInit = function (element) {
  const flatpickrTriggerList = [].slice.call(element.querySelectorAll('[data-aa-datepicker]'))

  const flatpickrInstances = flatpickrTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaDatepicker || {})

    const defaults = {
      enableTime: true,
      altFormat: 'Y-m-d, h:i K',
      altInput: true,
      dateFormat: 'Y-m-d H:i:00',
      time_24hr: false
    }

    return flatpickr(el, { ...defaults, ...options })
  })

  adminterface.flatpickr = [...adminterface.flatpickr, ...flatpickrInstances]
}

document.addEventListener('DOMContentLoaded', () => FlatpickerInit(document))

export default FlatpickerInit
