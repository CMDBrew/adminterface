/* global adminterface */

import TomSelect from 'tom-select'

const TomSelectInit = function (element) {
  const tomSelectTriggerList = [].slice.call(element.querySelectorAll('[data-aa-tom-select]'))
  const tomSelectInstances = tomSelectTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaTomSelect || {})

    const defaults = {
      plugins: ['remove_button'],
      persist: false,
      createOnBlur: false,
      create: false
    }

    return new TomSelect(element, { ...defaults, ...options })
  })

  adminterface.tomSelect = [...adminterface.tomSelect, ...tomSelectInstances]
}

document.addEventListener('DOMContentLoaded', () => {
  adminterface.tomSelect = []
  TomSelectInit(document)
})

export default TomSelectInit
