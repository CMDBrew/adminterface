import BatchActions from '../lib/batch_actions'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('main')

  /* eslint-disable no-new */
  if (el) new BatchActions(el)
  /* eslint-enable no-new */
})
