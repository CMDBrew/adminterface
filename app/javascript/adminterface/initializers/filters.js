/* global adminterface */
import Filters from '../lib/filters'

document.addEventListener('DOMContentLoaded', () => {
  const clearFilterBtn = document.querySelector('.clear_filters_btn')
  const filterForm = document.querySelector('.filter_form')
  const selectAndSearch = [].slice.call(document.querySelectorAll('.filter_form_field.select_and_search select'))

  if (clearFilterBtn) {
    clearFilterBtn.addEventListener('click', Filters._clearForm)
    adminterface.addObserver(clearFilterBtn, { events: { click: Filters._clearForm } }, 'filters.clear')
  }

  if (filterForm) {
    filterForm.addEventListener('submit', Filters._disableEmptyInputFields)
    adminterface.addObserver(filterForm, { events: { submit: Filters._disableEmptyInputFields } }, 'filters.submit')
  }

  selectAndSearch.forEach((el) => {
    el.addEventListener('change', Filters._setSearchType)
    adminterface.addObserver(el, { events: { change: Filters._setSearchType } }, 'filters.selectAndSearch')
  })
})
