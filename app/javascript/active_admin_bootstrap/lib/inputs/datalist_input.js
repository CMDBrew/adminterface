import BaseInput from './base_input'

class DatalistInput extends BaseInput {
  _defaultInputHTMLOptions () {
    const options = {
      type: 'text',
      list: `batch-form-${this.name}-datalist`
    }

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
    return `${super._inputHTML()}<datalist id="batch-form-${this.name}-datalist">${this._optionsHTML()}</datalist>`
  }
}

export default DatalistInput
