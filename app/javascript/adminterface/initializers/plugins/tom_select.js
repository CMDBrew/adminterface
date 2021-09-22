/* global adminterface */
import TomSelect from 'tom-select'

const initTomSelect = function (element) {
  const tomSelectTriggerList = [].slice.call(element.querySelectorAll('[data-aa-tom-select]'))

  tomSelectTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaTomSelect || {})
    const instance = new TomSelect(el, options)

    adminterface.addObserver(el, instance, instance.constructor.name)
    return instance
  })
}

document.addEventListener('DOMContentLoaded', () => {
  initTomSelect(document)
})

document.addEventListener('confirm_dialog:before_open', (el) => {
  initTomSelect(el.detail.dialogForm)
})

export default initTomSelect
