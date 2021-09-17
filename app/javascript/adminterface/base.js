import 'bootstrap'
import config from './config'
import './initializers'

window.adminterface = config

export { default as InputCounter } from './lib/input_counter'
export { default as ConfirmDialog } from './lib/confirm_dialog'
export { default as DetachedDropdown } from './lib/detached_dropdown'
export * from './lib/input'
