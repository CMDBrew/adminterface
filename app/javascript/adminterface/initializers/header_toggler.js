import HeaderToggler from '../lib/header_toggler'

document.addEventListener('DOMContentLoaded', () => {
  const $togglers = document.querySelectorAll('[data-aa-header-toggler]')
  window.headerTogglers = []

  $togglers.forEach((el) => {
    const options = JSON.parse(el.dataset.aaHeaderToggler || {})
    window.headerTogglers.push(new HeaderToggler(el, options))
  })
})
