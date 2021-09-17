import BaseInput from './base_input'

class DateTimePickerInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const options = { type: 'text' }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default DateTimePickerInput
