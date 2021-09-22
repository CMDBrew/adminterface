/* global adminterface */
import { camalize, getObjectValue, setObjectValue } from './lib/utils'
import { inputMapping } from './lib/input'
import { v4 as uuidv4 } from 'uuid'

const info = {
  title: 'ADMINTERFACE',
  docURL: 'https://adminterface.io'
}

const admonitionStyles = {
  heading: {
    head: 'font-weight: bold; color: #3C324C; background: #9e82c8;',
    body: 'color: white; background: #3C324C;'
  },
  success: {
    head: 'font-weight: bold; color: #003100; background: #58B67E',
    body: 'color: white; background: #003100'
  },
  danger: {
    head: 'font-weight: bold; color: #4B1113; background: #E13238',
    body: 'color: white; background: #4B1113'
  }
}

const admonition = (text, type) => {
  console.log(text, admonitionStyles[type].head, admonitionStyles[type].body, '')
}

const parseMeta = (name) => {
  const meta = (document.querySelector(`#meta-tags-for-js meta[name="${name}"]`))

  try {
    return JSON.parse(meta.content)
  } catch (_err) {
    return {}
  }
}

window.adminterface = {
  _debug: false,
  _observers: [],
  _trackers: () => {
    return [].slice.call(document.querySelectorAll('[data-observer-id]'))
  },
  meta: {
    inputs: inputMapping
  },
  get observers () {
    const results = {}

    this._getPristineObservers().forEach(item => {
      const currentData = getObjectValue(results, item.path) || []
      const data = { observerId: item.observerId, data: item.data }
      const newData = [...currentData, data]
      setObjectValue(results, item.path, newData)
    })

    return results
  },
  get version () {
    if (this._version) return this._version

    const metaVersion = document.querySelector('meta[name="version"]')
    this._version = (metaVersion || {}).content
    return this._version
  },
  get debug () {
    return this._debug
  },
  set debug (value) {
    this._debug = !!value

    if (this._debug) {
      admonition(`%c ${info.title} %c DEBUGGER ON %c`, 'heading')
      admonition("%c WARNING %c PLEASE ENSURE YOU DISABLE THE DEBUGGER IN PRODUCTION AS IT MIGHT IMPACT YOUR APP'S PERFORMANCE! %c", 'danger')
      console.log('Adminterface will now track its JavaScript instances in the "adminterface.observers" object.')
    } else {
      admonition(`%c ${info.title} %c DEBUGGER OFF %c`, 'heading')
    }

    this.help()
  },
  help: function () {
    console.log(`%cVERSION: %c${this.version}`, 'font-weight: bold;', '')
    console.log(`%cDOCS: %c${info.docURL}`, 'font-weight: bold;', '')
    console.log('%cCOMMANDS:', 'font-weight: bold;')
    admonition('∟ %c %c adminterface.debug = true %c Turn on the debugger. ', 'success')
    admonition('∟ %c %c adminterface.debug = false %c Turn off the debugger. ', 'success')
    admonition('∟ %c %c adminterface.observers %c View Adminterface\'s JavaScript instances. ', 'success')
    admonition('∟ %c %c adminterface.meta %c View configurations and data passed from the backend. ', 'success')
    admonition('∟ %c %c adminterface.help() %c List available commands and properties. ', 'success')
    admonition('∟ %c %c adminterface.clear() %c Clear the observer object. ', 'success')
  },
  clear: function () {
    const trackers = this._trackers()
    this._observers = []
    trackers.forEach(item => item.removeAttribute('data-observer-id'))
    console.log('observer cleared')
    return true
  },
  addObserver: function (target, data, path) {
    if (!this.debug) return

    const uuid = uuidv4()
    const observer = { observerId: uuid, path: path, data: data }
    this._getPristineObservers()

    if (target) target.setAttribute('data-observer-id', uuid)

    this._observers = [...this._observers, observer]
    return uuid
  },
  _getPristineObservers: function () {
    const observers = this._observers || []
    const uuids = this._trackers().map(el => el.dataset.observerUuid)
    this._observers = observers.filter(item => uuids.includes(item.uuid))
    return this._observers
  },
  _addMeta: function (name) {
    const content = parseMeta(name)
    this.meta = { ...this.meta, ...{ [camalize(name)]: content } }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const metaTags = ['components', 'translations', 'css_classes', 'countries', 'time_zones']
  metaTags.forEach((name) => adminterface._addMeta(name))
})
