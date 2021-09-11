import { Dropdown } from 'bootstrap'

document.addEventListener('DOMContentLoaded', () => {
  const shouldToggle =
    document.body.classList.contains('layout-navigation-sidebar') ||
      document.body.classList.contains('layout-navigation-aside')

  if (shouldToggle) {
    document.querySelectorAll('#header .dropdown-toggle.active').forEach((element) => {
      const dropdown = Dropdown.getOrCreateInstance(element)
      dropdown.show()
      element.blur()
    })
  }
})
