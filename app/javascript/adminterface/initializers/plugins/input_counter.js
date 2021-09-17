import InputCounter from '../../lib/plugins/input_counter'

const initInputCounter = function (element) {
  const inputCounterTriggerList = [].slice.call(element.querySelectorAll('[data-aa-input-counter]'))

  inputCounterTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaInputCounter || {})

    return new InputCounter(el, options)
  })
}

document.addEventListener('DOMContentLoaded', () => {
  initInputCounter(document)

  document.body.addEventListener('confirm_dialog:before_open', (el) => {
    initInputCounter(el.detail.dialogForm)
  })
})

export default initInputCounter
