import { queryStringToParams, hasTurbolinks, turbolinksVisit, toQueryString, serializeArray } from './utils'

class Filters {
  static _clearForm (event) {
    const regex = /^(q\[|q%5B|q%5b|page|utf8|commit)/
    const params = queryStringToParams().filter(({ name }) => !name.match(regex))

    event.preventDefault()

    if (hasTurbolinks()) {
      turbolinksVisit(params)
    } else {
      window.location.search = toQueryString(params)
    }
  }

  static _disableEmptyInputFields (event) {
    const elements = [...this.querySelectorAll('input, textarea, select, button')].filter((input) => input.value === '')
    const params = serializeArray(this)
    elements.forEach((el) => { el.disabled = true })

    if (hasTurbolinks()) {
      event.preventDefault()
      turbolinksVisit(params)
    }
  }

  static _setSearchType () {
    const $element = this.closest('.filter_form_field').querySelector('input')
    $element.name = `q[${this.value}]`
  }
}

export default Filters
