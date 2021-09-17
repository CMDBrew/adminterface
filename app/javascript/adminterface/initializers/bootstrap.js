/* global adminterface */

import { Popover, Tooltip } from 'bootstrap'

const onDOMReady = function (element) {
  const popoverTriggerList = [].slice.call(element.querySelectorAll('[data-bs-toggle="popover"]'))
  const tooltipTriggerList = [].slice.call(element.querySelectorAll('[data-bs-toggle="tooltip"]'))
  const popoverInstances = popoverTriggerList.map((el) => new Popover(el))
  const tooltipInstances = tooltipTriggerList.map((el) => new Tooltip(el))

  adminterface.popover = [...adminterface.popover, ...popoverInstances]
  adminterface.tooltip = [...adminterface.tooltip, ...tooltipInstances]
}

document.addEventListener('DOMContentLoaded', () => {
  onDOMReady(document)

  document.body.addEventListener('confirm_dialog:before_open', (el) => {
    onDOMReady(el.detail.dialogForm)
  })
})
