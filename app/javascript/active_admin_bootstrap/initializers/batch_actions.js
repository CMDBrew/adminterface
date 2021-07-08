import BatchActions from '../lib/batch_actions'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('main')

  window.BatchActions = new BatchActions(el)
})
