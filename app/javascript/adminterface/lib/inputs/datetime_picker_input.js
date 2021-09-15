import BaseInput from './base_input'

class DateTimePickerInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const metaForComponents = (document.querySelector('#meta-tags-for-js meta[name="components"]') || {})
    const components = JSON.parse(metaForComponents.content)
    const options = {
      type: 'text',
      'data-aa-datepicker': this.options.flatpickr || (components.inputs || {}).datetime_picker
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default DateTimePickerInput
