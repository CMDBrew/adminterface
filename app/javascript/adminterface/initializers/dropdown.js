import Dropdown from '../lib/dropdown'

const DropdownInit = function (element) {
  const dropdownTriggerList = [].slice.call(element.querySelectorAll('.dropdown'))
  dropdownTriggerList.map((el) => new Dropdown(el, {}))
}

document.addEventListener('DOMContentLoaded', () => DropdownInit(document.getElementById('active_admin_content')))

export default DropdownInit
