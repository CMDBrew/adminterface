import ChoicesInput from './choices_input'

class RadioInput extends ChoicesInput {
  _defaultInputHTMLOptions () {
    const options = {
      type: 'radio'
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default RadioInput
