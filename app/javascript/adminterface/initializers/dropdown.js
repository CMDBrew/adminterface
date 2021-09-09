/* global adminterface */

import Dropdown from '../lib/dropdown'

const DropdownInit = function (element) {
  const dropdownTriggerList = [].slice.call(element.querySelectorAll('.dropdown'))
  const dropdownInstances = dropdownTriggerList.map((el) => new Dropdown(el, {}))

  adminterface.dropdown = [...adminterface.dropdown, ...dropdownInstances]
}

document.addEventListener('DOMContentLoaded', () => {
  adminterface.dropdown = []
  DropdownInit(document.getElementById('active_admin_content'))
})

export default DropdownInit
