import CheckboxToggler from '../lib/checkbox_toggler'

class TableCheckboxToggler extends CheckboxToggler {
  _bind () {
    super._bind(...arguments)

    const $cells = this.$container.querySelectorAll('tbody td')

    $cells.forEach((el) => {
      el.addEventListener('click', (e) => {
        if (e.target.type !== 'checkbox') {
          this._didClickCell(e.target)
        }
      })
    })
  }

  _didChangeCheckbox (checkbox) {
    super._didChangeCheckbox(...arguments)

    if (checkbox.checked) {
      checkbox.closest('tr').classList.add('selected')
    } else {
      checkbox.closest('tr').classList.remove('selected')
    }
  }

  _didChangeToggleAllCheckbox () {
    const rows = this.$container.querySelectorAll('tbody tr')
    const checked = super._didChangeToggleAllCheckbox(...arguments)

    rows.forEach((row) => {
      if (checked) {
        row.classList.add('selected')
      } else {
        row.classList.remove('selected')
      }
    })
  }

  _didClickCell (cell) {
    cell.parentNode.querySelector('input[type="checkbox"]').click()
  }
}

export default TableCheckboxToggler
