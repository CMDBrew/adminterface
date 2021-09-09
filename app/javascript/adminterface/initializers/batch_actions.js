/* global adminterface */

import BatchActions from '../lib/batch_actions'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('main')

  if (el) adminterface.batchActions = new BatchActions(el)
})
