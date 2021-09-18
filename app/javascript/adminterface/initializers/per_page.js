import PerPage from '../lib/per_page'
import { addToDebugger } from '../lib/utils'

document.addEventListener('DOMContentLoaded', () => {
  const target = document.querySelector('.pagination_per_page select')

  if (target) {
    target.addEventListener('change', PerPage._update)

    addToDebugger({ target, events: { change: PerPage._update } }, 'perPage', {})
  }
})
