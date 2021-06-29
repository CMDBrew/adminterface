import flatpickr from 'flatpickr'

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('[data-aa-datepicker]').forEach((element) => {
    const options = JSON.parse(element.dataset.aaDatepicker || {})

    const defaults = {
      enableTime: true,
      altFormat: 'Y-m-d, h:i K',
      altInput: true,
      dateFormat: 'Y-m-d H:i:00',
      time_24hr: false
    }
    flatpickr(element, { ...defaults, ...options })
  })
})
