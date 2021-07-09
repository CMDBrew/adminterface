import Filters from '../lib/filters'

document.addEventListener('DOMContentLoaded', () => {
  const $clearFilterBtn = document.querySelector('.clear_filters_btn')
  const $filterForm = document.querySelector('.filter_form')
  const $selectAndSearch = document.querySelectorAll('.filter_form_field.select_and_search select')

  if ($clearFilterBtn) $clearFilterBtn.addEventListener('click', Filters._clearForm)
  if ($filterForm) $filterForm.addEventListener('submit', Filters._disableEmptyInputFields)
  $selectAndSearch.forEach((select) => select.addEventListener('change', Filters._setSearchType))
})
