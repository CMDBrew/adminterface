import { toHTMLAttrString, toSnakeCase } from '../utils'
import Pluginish from './base/pluginish'

class BaseInput {
  constructor (name, options) {
    this.name = name
    this.options = options
    this.wrapper_html_options = this.options.wrapper_html || {}
    this.label_html_options = this.options.label_html || {}
    this.input_html_options = this.options.input_html || {}
    this.label = options.label || name.charAt(0).toUpperCase() + name.slice(1)
    this.type = toSnakeCase(this.constructor.name.replace(/(Input$)/, ''))
    this.pluginish = new Pluginish(this.type, this.options)
  }

  _defaultWrapperHTMLOptions () {
    return {
      class: `mb-3 input ${this.type}`
    }
  }

  _wrapperHTMLOptions () {
    return { ...this._defaultWrapperHTMLOptions(), ...this.wrapper_html_options }
  }

  _defaultLabelHTMLOptions () {
    return {
      class: 'form-label',
      for: `batch-form-${this.name}`
    }
  }

  _labelHTMLOptions () {
    return { ...this._defaultLabelHTMLOptions(), ...this.label_html_options }
  }

  _defaultInputHTMLOptions () {
    const options = {
      class: `form-control ${this.options.as}`,
      name: this.name,
      id: `batch-form-${this.name}`
    }

    return { ...options, ...this.pluginish.attributes() }
  }

  _inputHTMLOptions () {
    return { ...this._defaultInputHTMLOptions(), ...this.input_html_options }
  }

  _labelHTML () {
    return `<label ${toHTMLAttrString(this._labelHTMLOptions())}>${this.label}</label>`
  }

  _inputHTML () {
    return `<input ${toHTMLAttrString(this._inputHTMLOptions())}>`
  }

  _inputWrapping (html) {
    return `
      <div ${toHTMLAttrString(this._wrapperHTMLOptions())}>${html}</div>
    `
  }

  render () {
    return this._inputWrapping(`
      ${this._labelHTML()}
      ${this._inputHTML()}
    `)
  }
}

export default BaseInput
