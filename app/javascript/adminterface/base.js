import 'bootstrap'
import config from './config'
import './initializers'

window.adminterface = config

export { default as InputCounter } from './lib/plugins/input_counter'
export { default as ConfirmDialog } from './lib/confirm_dialog'
export { default as DetachedDropdown } from './lib/detached_dropdown'
export { default as initFlatpickr } from './initializers/plugins/flatpickr'
export { default as initBootstrap } from './initializers/bootstrap'
export { default as initTomSelect } from './initializers/plugins/tom_select'
export { default as initPasswordVisibility } from './initializers/plugins/password_visibility'
export * from './lib/input'
