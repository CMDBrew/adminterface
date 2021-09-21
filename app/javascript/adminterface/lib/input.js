/* global adminterface */
import BaseInput from './inputs/base_input'
import BooleanInput from './inputs/boolean_input'
import CheckBoxesInput from './inputs/check_boxes_input'
import ColorInput from './inputs/color_input'
import CountryInput from './inputs/country_input'
import DatalistInput from './inputs/datalist_input'
import DatePickerInput from './inputs/date_picker_input'
import DateTimePickerInput from './inputs/datetime_picker_input'
import HiddenInput from './inputs/hidden_input'
import RadioInput from './inputs/radio_input'
import SelectInput from './inputs/select_input'
import StringInput from './inputs/string_input'
import SwitchInput from './inputs/switch_input'
import TextInput from './inputs/text_input'
import TimePickerInput from './inputs/time_picker_input'
import TimeZoneInput from './inputs/time_zone_input'
import PasswordInput from './inputs/password_input'
import config from '../config'
import { addToDebugger } from './utils'

config.meta.inputs = {
  boolean: BooleanInput,
  check_boxes: CheckBoxesInput,
  color: ColorInput,
  country: CountryInput,
  datalist: DatalistInput,
  date_picker: DatePickerInput,
  datepicker: DatePickerInput,
  datetime_picker: DateTimePickerInput,
  hidden: HiddenInput,
  number: StringInput,
  password: PasswordInput,
  phone: StringInput,
  radio: RadioInput,
  select: SelectInput,
  string: StringInput,
  switch: SwitchInput,
  text: TextInput,
  time_picker: TimePickerInput,
  time_zone: TimeZoneInput,
  url: StringInput
}

class Input {
  constructor (name, options) {
    this.name = name
    this.options = options
    this.mapping = adminterface.meta.inputs
  }

  _configs () {
    if (this._isExplicity()) {
      return {
        as: this.options.as,
        options: this.options
      }
    } else if (Array.isArray(this.options)) {
      return {
        as: 'select',
        options: { collection: this.options }
      }
    } else {
      return {
        as: this.options,
        options: {}
      }
    }
  }

  _isExplicity () {
    return (typeof (this.options) === 'object') && this.options.as
  }

  render () {
    const configs = this._configs()
    const as = configs.as
    const options = configs.options
    const InputClass = this.mapping[as]

    if (!InputClass) {
      throw new Error(`Unsupported input type: {${this.name}: ${as}}`)
    }

    const input = new InputClass(this.name, { ...options, as: as })
    addToDebugger(input, `${this.constructor.name}.${input.constructor.name}`, [])

    return input.render()
  }
}

export {
  Input,
  BaseInput,
  BooleanInput,
  CheckBoxesInput,
  ColorInput,
  CountryInput,
  DatalistInput,
  DatePickerInput,
  DateTimePickerInput,
  HiddenInput,
  RadioInput,
  SelectInput,
  StringInput,
  SwitchInput,
  TextInput,
  TimePickerInput,
  TimeZoneInput,
  PasswordInput
}
