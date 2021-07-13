import BaseInput from './base_input'
import { toHTMLAttrString } from '../utils'

class SelectInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const multiple = this.options.multiple || false
    const options = {
      class: `form-select ${this.options.as}`
    }

    if (multiple) { options.multiple = true }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }

  _optionsForSelect (collection) {
    return ((() => {
      const result = []

      collection.forEach(v => {
        let option
        if (Array.isArray(v)) {
          option = `<option value=${v[1]}>${v[0]}</option>`
        } else {
          option = `<option>${v}</option>`
        }
        result.push(option)
      })

      return result
    })()).join('')
  }

  _optionsHTML () {
    const collection = this.options.collection || []
    return collection.length ? this._optionsForSelect(collection) : ''
  }

  _inputHTML () {
    return `<select ${toHTMLAttrString(this._inputHTMLOptions())}>${this._optionsHTML()}</select>`
  }
}

export default SelectInput
