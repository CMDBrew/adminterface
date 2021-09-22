/* global Turbolinks */
export function hasTurbolinks () {
  return (typeof Turbolinks !== 'undefined' && Turbolinks.supported)
}

export function turbolinksVisit (params) {
  const path = [window.location.pathname, '?', toQueryString(params)].join('')
  Turbolinks.visit(path)
}

export function queryString () {
  return (window.location.search || '').replace(/^\?/, '')
}

export function queryStringToParams () {
  const decode = (value) => decodeURIComponent((value || '').replace(/\+/g, '%20'))

  return queryString()
    .split('&')
    .map(pair => pair.split('='))
    .map(([key, value]) => {
      return { name: decode(key), value: decode(value) }
    })
}

export function toHTMLAttrString (obj) {
  const object = obj || {}
  const arr = []
  Object.keys(object).forEach((key) => {
    let value = object[key]

    if (typeof (value) === 'object') {
      value = JSON.stringify(value)
    }

    arr.push(`${key}='${value}'`)
  })

  return arr.join(' ')
}

export function toQueryString (params) {
  const encode = (value) => encodeURIComponent(value || '')

  return params
    .map(({ name, value }) => [encode(name), encode(value)])
    .map(pair => pair.join('='))
    .join('&')
}

export function serializeArray (form) {
  const arr = []

  Array.prototype.slice.call(form.elements).forEach((field) => {
    if (!field.name || field.disabled || ['file', 'reset', 'submit', 'button'].indexOf(field.type) > -1) return
    if (field.type === 'select-multiple') {
      Array.prototype.slice.call(field.options).forEach((option) => {
        if (!option.selected) return
        arr.push({
          name: field.name,
          value: option.value
        })
      })
      return
    }
    if (['checkbox', 'radio'].indexOf(field.type) > -1 && !field.checked) return
    arr.push({
      name: field.name,
      value: field.value
    })
  })

  return arr
}

export function serializeObject (form) {
  return serializeArray(form).reduce((obj, item) => {
    obj[item.name] = item.value
    return obj
  }, {})
}

export function cookieSet (name, value, expireInSec) {
  const expireAt = new Date()
  expireAt.setTime(expireAt.getTime() + expireInSec * 1000)
  document.cookie = `${name}=${value};expires=${expireAt.toGMTString()};path=/`
}

export function cookieGet (name) {
  const cookieName = `${name}=`
  const ca = document.cookie.split(';')
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i]
    while (c.charAt(0) === ' ') c = c.substring(1, c.length)
    if (c.indexOf(cookieName) === 0) return c.substring(cookieName.length, c.length)
  }
  return null
}

export function getObjectValue (data, path) {
  const arr = path.split('.')

  for (let i = 0; typeof data === 'object' && i < arr.length; i++) {
    data = data[arr[i]]
  }

  return data
}

export function deepMergeObject (target, source) {
  for (const key of Object.keys(source)) {
    if (source[key] instanceof Object) Object.assign(source[key], deepMergeObject(target[key], source[key]))
  }

  Object.assign(target || {}, source)
  return target
}

export function toSnakeCase (string) {
  return (
    string
      .match(/[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g)
      .map(x => x.toLowerCase())
      .join('_')
  )
}

export function toHTMLCssString (string) {
  return string.replace(/[.#]/, '')
}

export function setObjectValue (obj, path, value) {
  const pList = path.split('.')
  const len = pList.length

  for (let i = 0; i < len - 1; i++) {
    const elem = pList[i]
    if (!obj[elem]) obj[elem] = {}
    obj = obj[elem]
  }

  obj[pList[len - 1]] = value
}

export function camalize (str) {
  return str.toLowerCase().replace(/[^a-zA-Z0-9]+(.)/g, (m, chr) => chr.toUpperCase())
}
