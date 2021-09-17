/* global adminterface */

import TomSelect from 'tom-select'

const onDOMReady = function (element) {
  const tomSelectTriggerList = [].slice.call(element.querySelectorAll('[data-aa-tom-select]'))
  const tomSelectInstances = tomSelectTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaTomSelect || {})

    return new TomSelect(el, options)
  })

  adminterface.tomSelect = [...adminterface.tomSelect, ...tomSelectInstances]
}

document.addEventListener('DOMContentLoaded', () => {
  onDOMReady(document)

  document.body.addEventListener('confirm_dialog:before_open', (el) => {
    onDOMReady(el.detail.dialogForm)
  })
})
