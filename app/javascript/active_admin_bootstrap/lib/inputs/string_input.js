import BaseInput from './base_input'

class StringInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const options = {
      type: (this.options.as === 'phone' ? 'tel' : this.options.as)
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default StringInput
