/* global adminterface */

import * as Bootstrap from 'bootstrap'

const BootstrapInit = function (element) {
  const popoverTriggerList = [].slice.call(element.querySelectorAll('[data-bs-toggle="popover"]'))
  const tooltipTriggerList = [].slice.call(element.querySelectorAll('[data-bs-toggle="tooltip"]'))
  const popoverInstances = popoverTriggerList.map((el) => new Bootstrap.Popover(el))
  const tooltipInstances = tooltipTriggerList.map((el) => new Bootstrap.Tooltip(el))

  adminterface.popover = [...adminterface.popover, ...popoverInstances]
  adminterface.tooltip = [...adminterface.tooltip, ...tooltipInstances]
}

document.addEventListener('DOMContentLoaded', () => {
  adminterface.popover = []
  adminterface.tooltip = []
  BootstrapInit(document)
})

export default BootstrapInit
