import InputCounter from '../../lib/plugins/input_counter'

const onDOMReady = function (element) {
  const inputCounterTriggerList = [].slice.call(element.querySelectorAll('[data-aa-input-counter]'))

  inputCounterTriggerList.map((el) => {
    const options = JSON.parse(el.dataset.aaInputCounter || {})

    return new InputCounter(el, options)
  })
}

document.addEventListener('DOMContentLoaded', () => {
  onDOMReady(document)

  document.body.addEventListener('confirm_dialog:before_open', (el) => {
    onDOMReady(el.detail.dialogForm)
  })
})
