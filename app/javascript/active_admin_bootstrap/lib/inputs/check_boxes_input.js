import ChoicesInput from './choices_input'

class CheckBoxesInput extends ChoicesInput {
  _defaultInputHTMLOptions () {
    const options = {
      name: `${this.name}[]`,
      type: 'checkbox'
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }
}

export default CheckBoxesInput
