import {
  inputMapping,
  Input as InputClass
} from '../input'

import BaseInput from '../inputs/base_input'
import BooleanInput from '../inputs/boolean_input'
import CheckBoxesInput from '../inputs/check_boxes_input'
import ColorInput from '../inputs/color_input'
import CountryInput from '../inputs/country_input'
import DatalistInput from '../inputs/datalist_input'
import DatePickerInput from '../inputs/date_picker_input'
import DateTimePickerInput from '../inputs/datetime_picker_input'
import HiddenInput from '../inputs/hidden_input'
import RadioInput from '../inputs/radio_input'
import SelectInput from '../inputs/select_input'
import StringInput from '../inputs/string_input'
import SwitchInput from '../inputs/switch_input'
import TextInput from '../inputs/text_input'
import TimePickerInput from '../inputs/time_picker_input'
import TimeZoneInput from '../inputs/time_zone_input'
import PasswordInput from '../inputs/password_input'

describe('input', () => {
  const name = 'name'
  const options = {
    as: 'base_input'
  }
  const arrOptions = []
  const inputs = {
    base_input: BaseInput
  }

  beforeEach(() => {
    global.adminterface = {
      meta: {
        inputs
      },
      addObserver: jest.fn()
    }
  })

  test('constructor initiates correctly', () => {
    const Input = new InputClass(name, options)
    expect(Input.name).toStrictEqual(name)
    expect(Input.options).toStrictEqual(options)
    expect(Input.mapping).toStrictEqual(inputs)
  })

  test('_isExplicity returns true (options is object, "as" key defined)', () => {
    const Input = new InputClass(name, options)
    expect(Input._isExplicity()).toBeTruthy()
  })

  test('_isExplicity returns false (options is NOT object, "as" key undefined)', () => {
    const Input = new InputClass(name, arrOptions)
    expect(Input._isExplicity()).toBeFalsy()
  })

  test('_configs returns value (_isExplicity is true)', () => {
    const Input = new InputClass(name, options)

    const configsReturnValue = {
      as: Input.options.as,
      options: Input.options
    }

    expect(Input._configs()).toStrictEqual(configsReturnValue)
  })

  test('_configs returns value (_isExplicity is false, options is array)', () => {
    const Input = new InputClass(name, arrOptions)

    const configsReturnValue = {
      as: 'select',
      options: { collection: Input.options }
    }

    expect(Input._configs()).toStrictEqual(configsReturnValue)
  })

  test('_configs returns value (_isExplicity is false, options is NOT array)', () => {
    const strOptions = 'string'

    const Input = new InputClass(name, strOptions)

    const configsReturnValue = {
      as: Input.options,
      options: {}
    }

    expect(Input._configs()).toStrictEqual(configsReturnValue)
  })

  test('render throws error (InputClass undefined)', () => {
    const falseInputs = {
      as: false
    }

    global.adminterface = {
      meta: {
        inputs: falseInputs
      }
    }

    const Input = new InputClass(name, options)
    const configs = Input._configs()
    const errMsg = `Unsupported input type: {${Input.name}: ${configs.as}}`
    expect(() => Input.render()).toThrowError(new Error(errMsg))
  })

  test('render returns correct class instance render method value', () => {
    const Input = new InputClass(name, options)
    const configs = Input._configs()
    const configsOptions = configs.options
    const configsAs = configs.as
    const BaseInputInstance = new BaseInput(Input.name, { ...configsOptions, as: configsAs })
    expect(Input.render()).toStrictEqual(BaseInputInstance.render())
  })

  test('inputMapping returns correct object', () => {
    expect(inputMapping.boolean).toStrictEqual(BooleanInput)
    expect(inputMapping.check_boxes).toStrictEqual(CheckBoxesInput)
    expect(inputMapping.color).toStrictEqual(ColorInput)
    expect(inputMapping.country).toStrictEqual(CountryInput)
    expect(inputMapping.datalist).toStrictEqual(DatalistInput)
    expect(inputMapping.date_picker).toStrictEqual(DatePickerInput)
    expect(inputMapping.datetime_picker).toStrictEqual(DateTimePickerInput)
    expect(inputMapping.hidden).toStrictEqual(HiddenInput)
    expect(inputMapping.number).toStrictEqual(StringInput)
    expect(inputMapping.password).toStrictEqual(PasswordInput)
    expect(inputMapping.phone).toStrictEqual(StringInput)
    expect(inputMapping.radio).toStrictEqual(RadioInput)
    expect(inputMapping.select).toStrictEqual(SelectInput)
    expect(inputMapping.string).toStrictEqual(StringInput)
    expect(inputMapping.switch).toStrictEqual(SwitchInput)
    expect(inputMapping.text).toStrictEqual(TextInput)
    expect(inputMapping.time_picker).toStrictEqual(TimePickerInput)
    expect(inputMapping.time_zone).toStrictEqual(TimeZoneInput)
    expect(inputMapping.url).toStrictEqual(StringInput)
  })
})
