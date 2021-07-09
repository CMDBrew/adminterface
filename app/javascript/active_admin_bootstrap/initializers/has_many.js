import HasMany from '../lib/has_many'

document.addEventListener('DOMContentLoaded', () => {
  const $hasManyContainers = document.querySelectorAll('.has_many_container')

  $hasManyContainers.forEach((el) => new HasMany(el))
})
