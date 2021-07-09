import { queryStringToParams, hasTurbolinks, turbolinksVisit, toQueryString } from '@activeadmin/activeadmin/src/lib/utils'

class PerPage {
  static _update (event) {
    const params = queryStringToParams().filter(({ name }) => name !== 'per_page' && name !== 'page')

    params.push({ name: 'per_page', value: this.value })

    if (hasTurbolinks()) {
      event.preventDefault()
      turbolinksVisit(params)
    } else {
      window.location.search = toQueryString(params)
    }
  }
}

export default PerPage
