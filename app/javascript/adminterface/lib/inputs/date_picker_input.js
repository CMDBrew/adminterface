import BaseInput from './base_input'

class DatePickerInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const meta = (document.querySelector('#meta-tags-for-js meta[name="inputs"]') || {})
    const content = JSON.parse(meta.content)
    const options = {
      type: 'text',
      'data-aa-datepicker': this.options.flatpickr || content.date_picker
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default DatePickerInput
