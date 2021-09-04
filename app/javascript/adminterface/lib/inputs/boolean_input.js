import BaseInput from './base_input'

class BooleanInput extends BaseInput {
  _defaultLabelHTMLOptions () {
    const options = {
      class: 'form-check-label'
    }

    return { ...super._defaultLabelHTMLOptions(), ...options }
  }

  _defaultInputHTMLOptions () {
    const options = {
      class: `form-check-input ${this.options.as}`,
      type: 'checkbox'
    }

    return { ...super._defaultInputHTMLOptions(), ...options }
  }

  _inputGroup (html) {
    return `<div class="form-check">${html}</div>`
  }

  _inputWrapping (html) {
    return super._inputWrapping(this._inputGroup(html))
  }
}

export default BooleanInput
