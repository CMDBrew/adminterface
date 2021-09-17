/* global adminterface */
import { toSnakeCase, getObjectValue } from '../../utils'

class Config {
  constructor (configs, options) {
    this.name = configs.name
    this.configs = configs
    this.options = options[toSnakeCase(this.name)]
  }

  attributes () {
    if (!this._enabled()) return {}

    let results

    if (typeof (this.options) === 'object') {
      results = this.options
    } else {
      results = this._defaults()
    }

    return { [`data-aa-${this.name}`]: results }
  }

  _defaults () {
    return this.configs.options || {}
  }

  _enabled () {
    return (
      (!(this.options === false) && this.configs.default === true) ||
        (this.options && this.options === true)
    )
  }
}

class Pluginish {
  constructor (key, options) {
    this.key = key
    this.options = options
  }

  attributes () {
    return Object.assign({}, ...this._configs())
  }

  enabled (name) {
    return getObjectValue(this.attributes(), `data-aa-${name}`)
  }

  _plugins () {
    return getObjectValue(adminterface, `meta.components.inputs.${this.key}.js`)
  }

  _configs () {
    if (this._plugins()) {
      return this._plugins().map((plugin) => (new Config(plugin, this.options)).attributes())
    } else {
      return []
    }
  }
}

export default Pluginish
