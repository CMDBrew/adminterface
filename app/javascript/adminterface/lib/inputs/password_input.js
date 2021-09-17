import BaseInput from './base_input'

class PasswordInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const options = {
      type: 'password'
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default PasswordInput
