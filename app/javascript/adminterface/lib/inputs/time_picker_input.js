import BaseInput from './base_input'

class TimePickerInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const options = {
      type: 'time'
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default TimePickerInput
