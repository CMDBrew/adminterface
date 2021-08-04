import InputCounter from '../lib/input_counter'

const InputCounterInit = function (element) {
  window.inputCounters = []

  element.querySelectorAll('[data-aa-input-counter]').forEach((el) => {
    const options = JSON.parse(el.dataset.aaInputCounter || {})
    window.inputCounters.push(new InputCounter(el, options))
  })
}

document.addEventListener('DOMContentLoaded', () => InputCounterInit(document))

export default InputCounterInit
