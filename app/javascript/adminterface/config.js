/* global adminterface */
import { camalize } from './lib/utils'

const info = {
  title: 'ADMINTERFACE',
  docURL: 'https://cmdbrew.github.io/adminterface'
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

const config = {
  _debug: false,
  observer: {},
  meta: {},
  get debug () {
    return this._debug
  },
  set debug (value) {
    this._debug = !!value

    if (this._debug) {
      admonition(`%c ${info.title} %c DEBUGGER ON %c`, 'heading')
      admonition("%c WARNING %c PLEASE ENSURE YOU DISABLE THE DEBUGGER IN PRODUCTION AS IT MIGHT IMPACT YOUR APP'S PERFORMANCE! %c", 'danger')
      console.log('Adminterface will now track its JavaScript instances in the "adminterface.observer" object.')
    } else {
      admonition(`%c ${info.title} %c DEBUGGER OFF %c`, 'heading')
    }

    this.help()
  },
  help: () => {
    console.log(`%cVERSION: %c${adminterface.version}`, 'font-weight: bold;', '')
    console.log(`%cDOCS: %c${info.docURL}`, 'font-weight: bold;', '')
    console.log('%cCOMMANDS:', 'font-weight: bold;')
    admonition('∟ %c %c adminterface.debug = true %c Turn on the debugger. ', 'success')
    admonition('∟ %c %c adminterface.debug = false %c Turn off the debugger. ', 'success')
    admonition('∟ %c %c adminterface.observer %c View Adminterface\'s JavaScript instances. ', 'success')
    admonition('∟ %c %c adminterface.meta %c View configurations and data passed from the backend. ', 'success')
    admonition('∟ %c %c adminterface.help() %c List available commands and properties. ', 'success')
    admonition('∟ %c %c adminterface.clear() %c Clear the observer object. ', 'success')
  },
  clear: () => {
    adminterface.observer = {}
    console.log('observer cleared')
    return true
  }
}

const parseMeta = (name) => {
  const meta = (document.querySelector(`#meta-tags-for-js meta[name="${name}"]`))

  try {
    return JSON.parse(meta.content)
  } catch (_err) {
    return {}
  }
}

const addMeta = (name) => {
  const content = parseMeta(name)
  adminterface.meta = { ...adminterface.meta, ...{ [camalize(name)]: content } }
}

const onDOMReady = () => {
  const metaTags = ['components', 'translations', 'css_classes', 'countries', 'time_zones']
  const metaVersion = document.querySelector('meta[name="version"]')

  metaTags.forEach((name) => addMeta(name))
  adminterface.version = (metaVersion || {}).content
}

document.addEventListener('DOMContentLoaded', onDOMReady)

export default config
