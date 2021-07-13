import BooleanInput from './inputs/boolean_input'
import CheckBoxesInput from './inputs/check_boxes_input'
import DatalistInput from './inputs/datalist_input'
import DatePickerInput from './inputs/date_picker_input'
import DateTimePickerInput from './inputs/datetime_picker_input'
import RadioInput from './inputs/radio_input'
import SelectInput from './inputs/select_input'
import StringInput from './inputs/string_input'
import SwitchInput from './inputs/switch_input'
import TextInput from './inputs/text_input'
import TimePickerInput from './inputs/time_picker_input'
import TomSelectInput from './inputs/tom_select_input'

class Input {
  constructor (name, options) {
    this.name = name
    this.options = options
  }

  render () {
    let InputClass
    const as = this.options.as

    if (/^(string|number|password|url|phone)$/.test(as)) {
      InputClass = StringInput
    } else if (as === 'text') {
      InputClass = TextInput
    } else if (as === 'datalist') {
      InputClass = DatalistInput
    } else if (as === 'switch') {
      InputClass = SwitchInput
    } else if (as === 'boolean') {
      InputClass = BooleanInput
    } else if (as === 'check_boxes') {
      InputClass = CheckBoxesInput
    } else if (as === 'radio') {
      InputClass = RadioInput
    } else if (as === 'select') {
      InputClass = SelectInput
    } else if (as === 'tom_select') {
      InputClass = TomSelectInput
    } else if (/^(date_picker|datepicker)$/.test(as)) {
      InputClass = DatePickerInput
    } else if (as === 'time_picker') {
      InputClass = TimePickerInput
    } else if (as === 'datetime_picker') {
      InputClass = DateTimePickerInput
    } else {
      throw new Error(`Unsupported input type: {${this.name}: ${as}}`)
    }

    return (new InputClass(this.name, this.options)).render()
  }
}

export default Input