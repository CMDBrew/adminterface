import PerPage from '../lib/per_page'

document.addEventListener('DOMContentLoaded', () => {
  const $selector = document.querySelector('.pagination_per_page select')

  if ($selector) $selector.addEventListener('change', PerPage._update)
})
