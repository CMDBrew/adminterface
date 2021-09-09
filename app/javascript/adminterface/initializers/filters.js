/* global adminterface */

import Filters from '../lib/filters'

document.addEventListener('DOMContentLoaded', () => {
  adminterface.filters = {}

  const clearFilterBtn = document.querySelector('.clear_filters_btn')
  const filterForm = document.querySelector('.filter_form')
  const selectAndSearch = [].slice.call(document.querySelectorAll('.filter_form_field.select_and_search select'))

  if (clearFilterBtn) {
    clearFilterBtn.addEventListener('click', Filters._clearForm)

    adminterface.filters.clear = { target: clearFilterBtn, events: { click: 'Filters._clearForm' } }
  }

  if (filterForm) {
    filterForm.addEventListener('submit', Filters._disableEmptyInputFields)

    adminterface.filters.submit = { target: filterForm, events: { click: 'Filters._disableEmptyInputFields' } }
  }

  selectAndSearch.forEach((el) => {
    el.addEventListener('change', Filters._setSearchType)

    adminterface.filters.selectAndSearch = { target: el, events: { change: 'Filters._setSearchType' } }
  })
})
