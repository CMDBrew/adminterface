import BaseInput from './base_input'

class HiddenInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const options = {
      type: 'hidden'
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }

  _defaultWrapperHTMLOptions () {
    const options = {
      class: 'd-none'
    }

    return { ...super._defaultWrapperHTMLOptions, ...options }
  }
}

export default HiddenInput
