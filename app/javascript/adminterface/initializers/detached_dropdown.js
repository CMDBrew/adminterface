import DetachedDropdown from '../lib/detached_dropdown'

const initDetachedDropdown = function (element) {
  const dropdownTriggerList = [].slice.call(element.querySelectorAll('.dropdown'))
  dropdownTriggerList.map((el) => new DetachedDropdown(el, {}))
}

document.addEventListener('DOMContentLoaded', () => {
  initDetachedDropdown(document.getElementById('active_admin_content'))
})

document.addEventListener('confirm_dialog:before_open', (el) => {
  initDetachedDropdown(el.detail.dialogForm)
})

export default initDetachedDropdown
