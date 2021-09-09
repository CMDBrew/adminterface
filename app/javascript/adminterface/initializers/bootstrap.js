import * as Bootstrap from 'bootstrap'

const BootstrapInit = function (element) {
  const popoverTriggerList = [].slice.call(element.querySelectorAll('[data-bs-toggle="popover"]'))
  const tooltipTriggerList = [].slice.call(element.querySelectorAll('[data-bs-toggle="tooltip"]'))

  popoverTriggerList.map((popoverTriggerEl) => new Bootstrap.Popover(popoverTriggerEl))
  tooltipTriggerList.map((tooltipTriggerEl) => new Bootstrap.Tooltip(tooltipTriggerEl))
}

document.addEventListener('DOMContentLoaded', () => BootstrapInit(document))

export default BootstrapInit
