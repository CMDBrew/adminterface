import TomSelect from 'tom-select'

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('[data-aa-tom-select]').forEach((element) => {
    const options = JSON.parse(element.dataset.aaTomSelect || {})

    const defaults = {
      plugins: ['remove_button', 'restore_on_backspace'],
      persist: false,
      createOnBlur: true,
      create: true
    }

    /* eslint-disable no-new */
    new TomSelect(element, { ...defaults, ...options })
    /* eslint-enable no-new */
  })
})
