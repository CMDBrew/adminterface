/* global Turbolinks */

function hasTurbolinks () {
  return (typeof Turbolinks !== 'undefined' && Turbolinks.supported)
}

function turbolinksVisit (params) {
  const path = [window.location.pathname, '?', toQueryString(params)].join('')
  Turbolinks.visit(path)
}

function queryString () {
  return (window.location.search || '').replace(/^\?/, '')
}

function queryStringToParams () {
  const decode = (value) => decodeURIComponent((value || '').replace(/\+/g, '%20'))

  return queryString()
    .split('&')
    .map(pair => pair.split('='))
    .map(([key, value]) => {
      return { name: decode(key), value: decode(value) }
    })
}

function toHTMLAttrString (obj) {
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

function toQueryString (params) {
  const encode = (value) => encodeURIComponent(value || '')

  return params
    .map(({ name, value }) => [encode(name), encode(value)])
    .map(pair => pair.join('='))
    .join('&')
}

function serializeArray (form) {
  const arr = []

  Array.prototype.slice.call(form.elements).forEach(function (field) {
    if (!field.name || field.disabled || ['file', 'reset', 'submit', 'button'].indexOf(field.type) > -1) return
    if (field.type === 'select-multiple') {
      Array.prototype.slice.call(field.options).forEach(function (option) {
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

function serializeObject (form) {
  return serializeArray(form).reduce((obj, item) => {
    obj[item.name] = item.value
    return obj
  }, {})
}

function cookieSet (name, value, expireInSec) {
  const expireAt = new Date()
  expireAt.setTime(expireAt.getTime() + expireInSec * 1000)
  document.cookie = `${name}=${value};expires=${expireAt.toGMTString()};path=/`
}

function cookieGet (name) {
  const cookieName = `${name}=`
  const ca = document.cookie.split(';')
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i]
    while (c.charAt(0) === ' ') c = c.substring(1, c.length)
    if (c.indexOf(cookieName) === 0) return c.substring(cookieName.length, c.length)
  }
  return null
}

export {
  cookieGet,
  cookieSet,
  hasTurbolinks,
  queryString,
  queryStringToParams,
  serializeArray,
  serializeObject,
  toHTMLAttrString,
  toQueryString,
  turbolinksVisit
}
