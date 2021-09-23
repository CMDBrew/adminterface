/* global adminterface */
import { toHTMLAttrString, toSnakeCase } from '../utils'
import Pluginish from './base/pluginish'
import Groupish from './base/groupish'

class BaseInput {
  constructor (name, options) {
    this.name = name
    this.options = options
    this.wrapper_html_options = this.options.wrapper_html || {}
    this.label_html_options = this.options.label_html || {}
    this.input_html_options = this.options.input_html || {}
    this.label = options.label || name.charAt(0).toUpperCase() + name.slice(1)
    this.type = toSnakeCase(this.constructor.name.replace(/(Input$)/, ''))
    this.pluginish = new Pluginish(this.options)
    this.groupish = new Groupish(this.options)
  }

  _defaultWrapperHTMLOptions () {
    const uuid = adminterface.addObserver(null, this, `Input.${this.constructor.name}`)
    const configs = { class: `mb-3 input ${this.type}` }

    if (uuid) configs['data-observer-id'] = uuid
    return configs
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

    return { ...options, ...this.pluginish.plugins }
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
    const input = this._inputHTML()
    let inputHTML

    if (this.groupish.isGroupable) {
      inputHTML = this.groupish.groupWrapping(input)
    } else {
      inputHTML = input
    }

    return this._inputWrapping(`
      ${this._labelHTML()}
      ${inputHTML}
    `)
  }
}

export default BaseInput
