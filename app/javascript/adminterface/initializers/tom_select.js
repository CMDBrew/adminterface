import TomSelect from 'tom-select'

const TomSelectInit = function (element) {
  element.querySelectorAll('[data-aa-tom-select]').forEach((element) => {
    const options = JSON.parse(element.dataset.aaTomSelect || {})

    const defaults = {
      plugins: ['remove_button'],
      persist: false,
      createOnBlur: false,
      create: false
    }

    /* eslint-disable no-new */
    new TomSelect(element, { ...defaults, ...options })
    /* eslint-enable no-new */
  })
}

document.addEventListener('DOMContentLoaded', () => TomSelectInit(document))

export default TomSelectInit
