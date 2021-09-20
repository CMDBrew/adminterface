import Filters from '../lib/filters'
import { addToDebugger } from '../lib/utils'

document.addEventListener('DOMContentLoaded', () => {
  const clearFilterBtn = document.querySelector('.clear_filters_btn')
  const filterForm = document.querySelector('.filter_form')
  const selectAndSearch = [].slice.call(document.querySelectorAll('.filter_form_field.select_and_search select'))

  if (clearFilterBtn) {
    clearFilterBtn.addEventListener('click', Filters._clearForm)
    addToDebugger({ target: clearFilterBtn, events: { click: Filters._clearForm } }, 'filters.clear', {})
  }

  if (filterForm) {
    filterForm.addEventListener('submit', Filters._disableEmptyInputFields)
    addToDebugger({ target: filterForm, events: { submit: Filters._disableEmptyInputFields } }, 'filters.submit', {})
  }

  selectAndSearch.forEach((el) => {
    el.addEventListener('change', Filters._setSearchType)
    addToDebugger({ target: el, events: { change: Filters._setSearchType } }, 'filters.selectAndSearch', {})
  })
})
