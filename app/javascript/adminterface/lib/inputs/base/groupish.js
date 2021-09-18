class Groupish {
  constructor (options) {
    this.type = options.as
    this.options = options
    this.prepend = options.prepend
    this.append = options.append
    this.isGroupable = this._isGroupable()
    this.isGrouped = this._isGrouped()
  }

  groupWrapping (html) {
    const prependHTML = this.prepend || ''
    const appendHTML = this.append || ''

    if (this.isGrouped) {
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

  _isGrouped () {
    return !!this.prepend || !!this.append
  }

  _isGroupable () {
    return this._groupableTypes().includes(this.type)
  }
}

export default Groupish
