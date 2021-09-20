/* global adminterface */
import SelectInput from './select_input'
import { toHTMLAttrString } from '../utils'

class TimeZoneInput extends SelectInput {
  constructor (name, options) {
    super(name, options)
    this.timeZones = this._getAllTimeZones()
    this.priorityTimeZones = this.options.priority_zones || []
  }

  _prioritizeTimeZones () {
    const priorityTimeZones = []
    const _self = this

    if (Array.isArray(this.priorityTimeZones) && this.priorityTimeZones.length) {
      this.priorityTimeZones.forEach(function (zone) {
        const item = _self.timeZones.find(item => item.name === zone.name)
        if (item) priorityTimeZones.push(item)
      })

      const restOfTimeZones = this.timeZones.filter(function (item) {
        return !priorityTimeZones.find(el => el.name === item.name)
      })

      this.timeZones = priorityTimeZones.concat(this._divider()).concat(restOfTimeZones)
    }
  }

  _getAllTimeZones () {
    const timeZones = adminterface.meta.timeZones

    if (timeZones.error) {
      console.error(timeZones)
      return []
    } else {
      return timeZones
    }
  }

  _formatTimeZones () {
    const _self = this

    this.timeZones = this.timeZones.map(function (item) {
      if (item === _self._divider()) {
        return item
      } else {
        return [item.translated_name, item.name]
      }
    })
  }

  _optionsHTML () {
    this._prioritizeTimeZones()
    this._formatTimeZones()

    const collection = this.timeZones
    return collection.length ? this._optionsForSelect(collection) : ''
  }

  _inputHTML () {
    return `<select ${toHTMLAttrString(this._inputHTMLOptions())}>${this._optionsHTML()}</select>`
  }
}

export default TimeZoneInput
