/* global adminterface */

import PerPage from '../lib/per_page'

document.addEventListener('DOMContentLoaded', () => {
  const target = document.querySelector('.pagination_per_page select')

  if (target) {
    target.addEventListener('change', PerPage._update)

    adminterface.perPage = { target, events: { change: 'PerPage._update' } }
  }
})
