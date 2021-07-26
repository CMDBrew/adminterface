import BaseInput from './base_input'
import { toHTMLAttrString } from '../utils'

class ChoicesInput extends BaseInput {
  _defaultLegendHTMLOptions () {
    return {
      class: 'form-label'
    }
  }

  _legendHTMLOptions () {
    return { ...this._defaultLegendHTMLOptions(), ...this.legend_html_options }
  }

  _defaultLabelHTMLOptions () {
    const options = {
      class: 'form-check-label'
    }

    return { ...super._defaultLabelHTMLOptions(), ...options }
  }

  _defaultInputHTMLOptions () {
    const options = {
      class: `form-check-input ${this.options.as}`
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }

  _inputHTMLOptions (value) {
    return { ...super._inputHTMLOptions(), ...{ value: value, id: `batch-form-${this.name}-${value}` } }
  }

  _labelHTMLOptions (value) {
    return { ...super._labelHTMLOptions(), ...{ for: `batch-form-${this.name}-${value}` } }
  }

  _wrapWith (html) {
    return `
      <div class="form-check">${html}</div>
    `
  }

  _choices (collection) {
    return ((() => {
      const result = []

      collection.forEach(v => {
        let option
        if (Array.isArray(v)) {
          option =
            this._wrapWith(`
              ${this._inputHTML(v[1])}
              ${this._labelHTML(v[0])}
            `)
        } else {
          option =
            this._wrapWith(`
              ${this._inputHTML(v)}
              ${this._labelHTML(v)}
            `)
        }
        result.push(option)
      })

      return result
    })()).join('')
  }

  _inputHTML (value) {
    return `<input ${toHTMLAttrString(this._inputHTMLOptions(value))}>`
  }

  _labelHTML (value) {
    return `<label ${toHTMLAttrString(this._labelHTMLOptions(value))}>${value}</label>`
  }

  _legendHTML () {
    return `<label ${toHTMLAttrString(this._legendHTMLOptions())}>${this.label}</label>`
  }

  _choicesHTML () {
    const collection = this.options.collection || []
    return collection.length ? this._choices(collection) : ''
  }

  render () {
    return this._inputWrapping(`
      ${this._legendHTML()}
      <div class="choices">${this._choicesHTML()}</div>
    `)
  }
}

export default ChoicesInput
