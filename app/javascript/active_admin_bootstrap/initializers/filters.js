import Filters from '../lib/filters'

document.addEventListener('DOMContentLoaded', () => {
  const $clearFilterBtn = document.querySelector('.clear_filters_btn')
  const $filterForm = document.querySelector('.filter_form')
  const $selectAndSearch = document.querySelectorAll('.filter_form_field.select_and_search select')

  $clearFilterBtn.addEventListener('click', Filters._clearForm)
  $filterForm.addEventListener('submit', Filters._disableEmptyInputFields)
  $selectAndSearch.forEach((select) => select.addEventListener('change', Filters._setSearchType))
})
