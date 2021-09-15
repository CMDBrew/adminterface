import BaseInput from './base_input'
import { toHTMLAttrString } from '../utils'

class SelectInput extends BaseInput {
  constructor (name, options) {
    super(name, options)
    this.multiple = this.options.multiple || false
    this.tom_select = this.options.tom_select || false
    this.include_blank = this.options.include_blank || false
  }

  _divider () {
    return '-'
  }

  _defaultInputHTMLOptions () {
    const metaForComponents = (document.querySelector('#meta-tags-for-js meta[name="components"]') || {})
    const components = JSON.parse(metaForComponents.content)
    const options = {
      class: `form-select ${this.options.as}`
    }

    if (this.multiple) { options.multiple = true }
    if (this.tom_select) {
      if (typeof (this.tom_select) === 'object') {
        options['data-aa-tom-select'] = this.tom_select
      } else {
        options['data-aa-tom-select'] = (components.inputs || {}).tom_select
      }
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }

  _blankOption () {
    let label = ''

    if (typeof (this.include_blank) === 'string') {
      label = this.options.include_blank
    }

    return `<option value>${label}</option>`
  }

  _optionsForSelect (collection) {
    return ((() => {
      const result = []
      const _self = this

      if (this.include_blank) result.push(this._blankOption())

      collection.forEach(v => {
        let option
        if (Array.isArray(v)) {
          option = `<option value="${v[1]}">${v[0]}</option>`
        } else if (v === _self._divider()) {
          option = '<option value="" disabled>-------------</option>'
        } else {
          option = `<option value="${v}">${v}</option>`
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
