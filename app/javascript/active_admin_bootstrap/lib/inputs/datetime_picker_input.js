import BaseInput from './base_input'

class DateTimePickerInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const meta = (document.querySelector('#meta-tags-for-js meta[name="inputs"]') || {})
    const content = JSON.parse(meta.content)
    const options = {
      type: 'text',
      'data-aa-datepicker': this.options.flatpickr || content.datetime_picker
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default DateTimePickerInput
