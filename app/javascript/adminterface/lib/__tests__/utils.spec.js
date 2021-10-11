/* eslint-env jest */
import {
  hasTurbolinks,
  turbolinksVisit,
  queryString,
  queryStringToParams,
  toHTMLAttrString,
  toQueryString,
  serializeArray,
  serializeObject,
  cookieSet,
  cookieGet,
  getObjectValue,
  deepMergeObject,
  toSnakeCase,
  toHTMLCssString,
  setObjectValue,
  camalize
} from '../utils'

describe('utils', () => {
  let windowSpy

  beforeEach(() => {
    windowSpy = jest.spyOn(window, 'window', 'get')
    Object.defineProperty(document, 'cookie', {
      writable: true,
      value: ''
    })
    global.Turbolinks = {
      supported: true,
      visit: path => path
    }
  })

  afterEach(() => {
    windowSpy.mockRestore()
  })

  const windowSpyMockImplement = (URL) => {
    return windowSpy.mockImplementation(() => ({
      location: {
        search: URL
      }
    }))
  }

  test('hasTurbolinks returns boolean value correctly', () => {
    expect(hasTurbolinks()).toBeTruthy()

    global.Turbolinks.supported = false
    expect(hasTurbolinks()).toBeFalsy()
  })

  test('turbolinksVisit triggers Turbolinks api correctly', () => {
    const spyOnTurbolinks = jest.spyOn(global.Turbolinks, 'visit')

    const params = [
      { name: 'Richard', value: 1 },
      { name: 'Nelson', value: 2 }
    ]
    const path = window.location.pathname
    turbolinksVisit(params)

    expect(spyOnTurbolinks).toHaveBeenCalledTimes(1)
    expect(spyOnTurbolinks).toHaveBeenCalledWith(`${path}?Richard=1&Nelson=2`)
  })

  test('queryString returns correctly', () => {
    const exampleURL = '?email=someone@example.com'

    windowSpyMockImplement(exampleURL)
    expect(queryString()).toEqual(exampleURL.replace(/^\?/, ''))
  })

  test('queryStringToParams returns correctly', () => {
    const emailParam = 'email=someone@example.com'
    const searchParam = 'q=Nelson+Richard'
    const mockQueryString = `?${emailParam}&${searchParam}`

    windowSpyMockImplement(mockQueryString)

    const result = [
      { name: 'email', value: 'someone@example.com' },
      { name: 'q', value: 'Nelson Richard' }
    ]

    expect(queryStringToParams()).toEqual(result)
  })

  test('toHTMLAttrString returns correctly', () => {
    const mockObject = {
      name: 'Codey',
      info: {
        email: 'codey@example.com',
        address: 'Tokyo'
      }
    }
    const mockStringifyObject = JSON.stringify(mockObject.info)

    const result = `name='${mockObject.name}' info='${mockStringifyObject}'`

    expect(toHTMLAttrString(mockObject)).toEqual(result)
  })

  test('toQueryString returns query string correctly', () => {
    const params = [
      { name: 'Richard', value: 1 },
      { name: 'Nelson', value: 2 }
    ]
    expect(toQueryString(params)).toEqual('Richard=1&Nelson=2')
  })

  test('serializeArray and serializeObject returns correctly', () => {
    const elements = [
      {
        name: 'Test1',
        disabled: false,
        type: 'file'
      },
      {
        name: 'Test2',
        disabled: false,
        type: 'select-multiple',
        options: [
          {
            selected: true,
            value: 'select-multiple value1'
          },
          {
            selected: true,
            value: 'select-multiple value2'
          }
        ]
      },
      {
        name: 'Test3',
        disabled: false,
        type: 'checkbox',
        checked: true,
        value: 'checkbox value'
      }
    ]
    const form = { elements }

    const resultSerializeArray = [
      {
        name: elements[1].name,
        value: elements[1].options[0].value
      },
      {
        name: elements[1].name,
        value: elements[1].options[1].value
      },
      {
        name: elements[2].name,
        value: elements[2].value
      }
    ]
    expect(serializeArray(form)).toEqual(resultSerializeArray)

    const resultSerializeObject = {
      [resultSerializeArray[1].name]: resultSerializeArray[1].value,
      [resultSerializeArray[2].name]: resultSerializeArray[2].value
    }
    expect(serializeObject(form)).toEqual(resultSerializeObject)
  })

  test('cookieSet returns correctly', () => {
    const expireInSec = 10
    const name = 'Codey'
    const value = 'Du'

    const expireAt = new Date()
    expireAt.setTime(expireAt.getTime() + expireInSec * 1000)

    const result = `${name}=${value};expires=${expireAt.toGMTString()};path=/`
    cookieSet(name, value, expireInSec)
    expect(document.cookie).toEqual(result)
  })

  test('cookieGet returns correctly', () => {
    const name = 'Codey'
    const expires = '2012'
    const path = '/'
    document.cookie = `name=${name};expires=${expires};path=${path}`

    expect(cookieGet('name')).toEqual(name)
    expect(cookieGet('expires')).toEqual(expires)
    expect(cookieGet('path')).toEqual(path)
    expect(cookieGet('something')).toBeNull()
  })

  test('getObjectValue returns correctly', () => {
    const path = 'name.gender.address'
    const data = {
      name: 'Codey',
      gender: 'male',
      address: 'Tokyo'
    }

    expect(getObjectValue(data, path)).toEqual(data.name)
  })

  test('deepMergeObject returns correctly', () => {
    const targetObject = {
      name: 'Anonymous',
      gender: 'Female',
      hair: {
        color: 'brown',
        cut: 'long'
      },
      eyes: 'blue',
      family: ['mom', 'dad']
    }

    const sourceObject = {
      name: 'Codey Du',
      gender: 'Male',
      hair: {
        cut: 'short'
      },
      family: ['wife', 'kids', 'dog']
    }

    const resultObject = {
      name: 'Codey Du',
      gender: 'Male',
      hair: {
        color: 'brown',
        cut: 'short'
      },
      eyes: 'blue',
      family: ['wife', 'kids', 'dog']
    }

    expect(deepMergeObject(targetObject, sourceObject)).toEqual(resultObject)
  })

  test('toSnakeCase returns correctly', () => {
    const testString = 'AToZOneTwoThree123 Codey is in Tokyo 2021'
    const resultString = 'a_to_z_one_two_three123_codey_is_in_tokyo_2021'

    expect(toSnakeCase(testString)).toEqual(resultString)
  })

  test('toHTMLCssString returns correctly', () => {
    const testStringPound = '#div: margin;'
    const resultStringPound = 'div: margin;'

    const testStringDot = '.h1: font-size'
    const resultStringDot = 'h1: font-size'

    expect(toHTMLCssString(testStringPound)).toEqual(resultStringPound)
    expect(toHTMLCssString(testStringDot)).toEqual(resultStringDot)
  })

  test('setObjectValue returns correctly', () => {
    const path = 'info.personal.gender'
    const obj = {}
    const value = 'male'

    const result = {
      info: {
        personal: {
          gender: value
        }
      }
    }

    setObjectValue(obj, path, value)
    expect(obj).toEqual(result)
  })

  test('camalize returns correctly', () => {
    const testString = 'Happy Camal casing 123'
    const resultString = 'happyCamalCasing123'

    expect(camalize(testString)).toEqual(resultString)
  })
})
