import BaseInput from './base_input'

class DatePickerInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const options = {
      type: 'text',
      'data-aa-datepicker': {
        enableTime: false,
        altFormat: 'Y-m-d'
      }
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default DatePickerInput
