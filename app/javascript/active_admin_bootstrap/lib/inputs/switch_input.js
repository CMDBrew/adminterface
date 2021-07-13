import BooleanInput from './boolean_input'

class SwitchInput extends BooleanInput {
  _inputGroup (html) {
    return `<div class="form-check form-switch">${html}</div>`
  }
}

export default SwitchInput
