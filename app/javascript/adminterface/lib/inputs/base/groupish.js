class Groupish {
  constructor (options) {
    this.type = options.as
    this.options = options
    this.prepend = options.prepend
    this.append = options.append
  }

  _groupableTypes () {
    return [
      'string',
      'number',
      'url',
      'phone',
      'password',
      'color',
      'datalist',
      'select',
      'country',
      'time_zone',
      'date_picker',
      'datepicker',
      'datetime_picker'
    ]
  }

  _isGroupable () {
    return this._groupableTypes().includes(this.type)
  }

  _groupWrapping (html) {
    const prependHTML = this.prepend || ''
    const appendHTML = this.append || ''

    if (this.prepend || this.append) {
      return `
        <div class="input-group">
          ${prependHTML}
          ${html}
          ${appendHTML}
        </div>
      `
    } else {
      return html
    }
  }
}

export default Groupish
