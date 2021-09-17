import DetachedDropdown from '../lib/detached_dropdown'

const onDOMReady = function (element) {
  const dropdownTriggerList = [].slice.call(element.querySelectorAll('.dropdown'))
  dropdownTriggerList.map((el) => new DetachedDropdown(el, {}))
}

document.addEventListener('DOMContentLoaded', () => {
  onDOMReady(document.getElementById('active_admin_content'))

  document.body.addEventListener('confirm_dialog:before_open', (el) => {
    onDOMReady(el.detail.dialogForm)
  })
})
