import HeaderToggler from '../lib/header_toggler'

document.addEventListener('DOMContentLoaded', () => {
  const togglerTriggerList = [].slice.call(document.querySelectorAll('[data-aa-header-toggler]'))
  togglerTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaHeaderToggler || {})

    return new HeaderToggler(el, options)
  })
})
