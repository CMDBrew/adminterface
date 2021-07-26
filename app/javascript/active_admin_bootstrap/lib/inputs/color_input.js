import BaseInput from './base_input'

class ColorInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const options = {
      class: `form-control form-control-color ${this.options.as}`,
      type: 'color'
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default ColorInput
