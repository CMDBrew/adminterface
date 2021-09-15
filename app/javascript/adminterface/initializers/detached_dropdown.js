import DetachedDropdown from '../lib/detached_dropdown'

const DetachedDropdownInit = function (element) {
  const dropdownTriggerList = [].slice.call(element.querySelectorAll('.dropdown'))
  dropdownTriggerList.map((el) => new DetachedDropdown(el, {}))
}

document.addEventListener('DOMContentLoaded', () => DetachedDropdownInit(document.getElementById('active_admin_content')))

export default DetachedDropdownInit
