import InputCounter from '../lib/input_counter'

const InputCounterInit = function (element) {
  const inputCounterTriggerList = [].slice.call(element.querySelectorAll('[data-aa-input-counter]'))

  inputCounterTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaInputCounter || {})

    return new InputCounter(el, options)
  })
}

document.addEventListener('DOMContentLoaded', () => InputCounterInit(document))

export default InputCounterInit
