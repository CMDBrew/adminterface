/* global adminterface */

class InputCounter {
  constructor (element, options) {
    const defaults = {
      type: 'letter',
      containerClass: '.input-counter-container',
      charCountClass: '.input-counter-char-count',
      charLeftClass: '.input-counter-char-left',
      charLimitClass: '.input-counter-char-limit',
      limit: 150
    }

    this.element = element
    this.options = { ...defaults, ...options }

    this._bind()
  }

  _count () {
    const el = this.element
    const limit = this.options.limit
    let count = 0
    let left = limit
    let trimmedText

    if (el.value) {
      if (this.options.type === 'word') {
        count = el.value.split(' ').length
      } else {
        count = el.value.length
      }
    }

    if (count >= limit) {
      if (this.options.type === 'word') {
        trimmedText = el.value.split(' ').slice(0, limit).join(' ')
      } else {
        trimmedText = el.value.substring(0, limit)
      }

      el.value = trimmedText
      left = 0
      count = limit
    } else {
      left = limit - count
    }

    this._update(count, left)
  }

  _update (count, left) {
    const limit = this.options.limit
    const elContainer = this.element.closest(this.options.containerClass)
    const elCount = elContainer.querySelector(this.options.charCountClass)
    const elLeft = elContainer.querySelector(this.options.charLeftClass)
    const elLimit = elContainer.querySelector(this.options.charLimitClass)

    if (elCount) elCount.innerHTML = count.toString()
    if (elLeft) elLeft.innerHTML = left.toString()
    if (elLimit) elLimit.innerHTML = limit.toString()
  }

  _bind () {
    this._count()
    this.element.addEventListener('keyup', (_e) => this._count())

    adminterface.inputCounter = [...adminterface.inputCounter, this]
  }
}

export default InputCounter
