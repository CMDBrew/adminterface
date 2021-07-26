class CheckboxToggler {
  constructor (container, options) {
    this.options = options
    this.container = container
    this._init()
    this._bind()
  }

  _init () {
    if (!this.container) {
      throw new Error('Container element not found')
    } else {
      this.$container = document.querySelector(this.container)
    }

    if (!this.$container.querySelector('.toggle_all')) {
      throw new Error('"toggle all" checkbox not found')
    } else {
      this.$toggleAllCheckbox = this.$container.querySelector('.toggle_all')
    }

    this.$checkboxes = this.$container.querySelectorAll('input[type="checkbox"]:not(.toggle_all)')
  }

  _bind () {
    this.$checkboxes.forEach((el) => {
      el.addEventListener('change', (e) => {
        this._didChangeCheckbox(e.target)
      })
    })

    this.$toggleAllCheckbox.addEventListener('change', (_e) => {
      this._didChangeToggleAllCheckbox()
    })
  }

  _didChangeCheckbox (_checkbox) {
    const numChecked = [...this.$checkboxes].filter(el => el.checked).length
    const allChecked = numChecked === this.$checkboxes.length
    const someChecked = (numChecked > 0) && (numChecked < this.$checkboxes.length)

    this.$toggleAllCheckbox.checked = allChecked
    this.$toggleAllCheckbox.indeterminate = someChecked
  }

  _didChangeToggleAllCheckbox () {
    const setting = this.$toggleAllCheckbox.checked
    this.$checkboxes.forEach((el) => {
      el.checked = setting
    })
    return setting
  }
}

export default CheckboxToggler
