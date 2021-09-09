/* global adminterface */

import InputCounter from '../lib/input_counter'

const InputCounterInit = function (element) {
  const inputCounterTriggerList = [].slice.call(element.querySelectorAll('[data-aa-input-counter]'))

  const inputCounterInstances = inputCounterTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaInputCounter || {})

    return new InputCounter(el, options)
  })

  adminterface.inputCounter = [...adminterface.inputCounter, ...inputCounterInstances]
}

document.addEventListener('DOMContentLoaded', () => {
  adminterface.inputCounter = []
  InputCounterInit(document)
})

export default InputCounterInit
