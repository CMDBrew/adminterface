import HasMany from '../lib/has_many'

document.addEventListener('DOMContentLoaded', () => {
  const hasManyTriggerList = [].slice.call(document.querySelectorAll('.has_many_container'))

  hasManyTriggerList.map((el) => new HasMany(el))
})
