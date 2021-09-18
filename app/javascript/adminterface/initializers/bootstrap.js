import { Popover, Tooltip } from 'bootstrap'
import { addToDebugger } from '../lib/utils'

const initBootstrap = function (element) {
  const popoverTriggerList = [].slice.call(element.querySelectorAll('[data-bs-toggle="popover"]'))
  const tooltipTriggerList = [].slice.call(element.querySelectorAll('[data-bs-toggle="tooltip"]'))

  popoverTriggerList.map((el) => {
    const instance = new Popover(el)
    addToDebugger(instance, 'popover', [])
    return instance
  })

  tooltipTriggerList.map((el) => {
    const instance = new Tooltip(el)
    addToDebugger(instance, 'tooltip', [])
    return instance
  })
}

document.addEventListener('DOMContentLoaded', () => {
  initBootstrap(document)
})

document.addEventListener('confirm_dialog:before_open', (el) => {
  initBootstrap(el.detail.dialogForm)
})

export default initBootstrap
