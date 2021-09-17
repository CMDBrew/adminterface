/* global adminterface */
import SelectInput from './select_input'
import { toHTMLAttrString } from '../utils'

class CountryInput extends SelectInput {
  constructor (name, options) {
    super(name, options)
    this.countries = this._getAllCountries()
    this.priorityCountries = this.options.priority_countries || []
    this.exceptCountries = this.options.except || []
    this.onlyCountries = this.options.only || []
  }

  _exceptCountries () {
    const _self = this

    if (Array.isArray(this.exceptCountries) && this.exceptCountries.length) {
      this.countries = this.countries.filter(function (item) {
        return !_self.exceptCountries.includes(item.code)
      })
    }
  }

  _onlyCountries () {
    const _self = this

    if (Array.isArray(this.onlyCountries) && this.onlyCountries.length) {
      this.countries = this.countries.filter(function (item) {
        return _self.onlyCountries.includes(item.code)
      })
    }
  }

  _prioritizeCountries () {
    const priorityCountries = []
    const _self = this

    if (Array.isArray(this.priorityCountries) && this.priorityCountries.length) {
      this.priorityCountries.forEach(function (code) {
        const item = _self.countries.find(item => item.code === code)
        if (item) priorityCountries.push(item)
      })

      const restOfCountries = this.countries.filter(function (item) {
        return !priorityCountries.find(el => el.code === item.code)
      })

      this.countries = priorityCountries.concat(this._divider()).concat(restOfCountries)
    }
  }

  _getAllCountries () {
    const countries = adminterface.meta.countries

    if (countries.error) {
      console.error(countries)
      return []
    } else {
      return countries
    }
  }

  _formatCountries () {
    const _self = this

    this.countries = this.countries.map(function (item) {
      if (item === _self._divider()) {
        return item
      } else {
        return [item.translated_name, item.name]
      }
    })
  }

  _optionsHTML () {
    this._onlyCountries()
    this._exceptCountries()
    this._prioritizeCountries()
    this._formatCountries()

    const collection = this.countries
    return collection.length ? this._optionsForSelect(collection) : ''
  }

  _inputHTML () {
    return `<select ${toHTMLAttrString(this._inputHTMLOptions())}>${this._optionsHTML()}</select>`
  }
}

export default CountryInput
