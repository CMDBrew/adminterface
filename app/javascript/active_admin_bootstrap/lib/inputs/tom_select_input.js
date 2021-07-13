import SelectInput from './select_input'

class TomSelectInput extends SelectInput {
  _defaultInputHTMLOptions () {
    const options = {
      'data-aa-tom-select': {}
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default TomSelectInput
