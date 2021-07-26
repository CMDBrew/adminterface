import BaseInput from './base_input'

class DateTimePickerInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const options = {
      type: 'text',
      'data-aa-datepicker': {
        enableTime: true,
        altFormat: 'Y-m-d, h:i K'
      }
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default DateTimePickerInput
