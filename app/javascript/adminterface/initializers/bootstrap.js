/* global adminterface */

import { Popover, Tooltip } from 'bootstrap'

const BootstrapInit = function (element) {
  const popoverTriggerList = [].slice.call(element.querySelectorAll('[data-bs-toggle="popover"]'))
  const tooltipTriggerList = [].slice.call(element.querySelectorAll('[data-bs-toggle="tooltip"]'))
  const popoverInstances = popoverTriggerList.map((el) => new Popover(el))
  const tooltipInstances = tooltipTriggerList.map((el) => new Tooltip(el))

  adminterface.popover = [...adminterface.popover, ...popoverInstances]
  adminterface.tooltip = [...adminterface.tooltip, ...tooltipInstances]
}

document.addEventListener('DOMContentLoaded', () => BootstrapInit(document))

export default BootstrapInit
