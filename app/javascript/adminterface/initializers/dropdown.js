import Dropdown from '../lib/dropdown'

const DropdownInit = function (element) {
  window.Dropdowns = []

  element.querySelectorAll('.dropdown').forEach((el) => {
    /* eslint-disable no-new */
    new Dropdown(el, {})
    /* eslint-disable no-new */
  })
}

document.addEventListener('DOMContentLoaded', () => DropdownInit(document.getElementById('active_admin_content')))

export default DropdownInit
