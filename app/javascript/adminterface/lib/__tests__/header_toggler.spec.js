import fs from 'fs'
import path from 'path'
import HeaderTogglerClass from '../header_toggler'
import * as utilModule from '../utils'

describe('CheckboxToggler', () => {
  const html = fs.readFileSync(path.resolve(__dirname, './header_toggler.html'))
  const options = { item: 1 }
  const defaults = {
    container: 'body',
    activeClass: 'header-active',
    cookieName: 'header-state',
    cookieExpireSec: 30 * 24 * 60 * 60
  }
  const mockEvent = {
    preventDefault: jest.fn()
  }

  let element
  let $container
  let windowSpy
  let spyOnAdd
  let spyOnRemove
  let spyOnCookieGet
  let spyOnCookieSet

  beforeEach(() => {
    document.body.innerHTML = html
    document.body.classList.remove(defaults.activeClass)
    element = document.body.firstChild
    $container = document.querySelector(defaults.container)

    windowSpy = jest.spyOn(window, 'window', 'get')
    spyOnCookieGet = jest.spyOn(utilModule, 'cookieGet')
    spyOnCookieSet = jest.spyOn(utilModule, 'cookieSet')
    spyOnCookieSet.mockImplementation(() => {})
    spyOnAdd = jest.spyOn(HeaderTogglerClass.prototype, '_add')
    spyOnRemove = jest.spyOn(HeaderTogglerClass.prototype, '_remove')

    global.adminterface = {
      addObserver: jest.fn()
    }
  })

  afterEach(() => {
    jest.restoreAllMocks()
  })

  test('constructor initiates correctly', () => {
    const spyOnBind = jest.spyOn(HeaderTogglerClass.prototype, '_bind')
    spyOnBind.mockImplementation(() => {})

    const HeaderToggler = new HeaderTogglerClass(element, options)

    expect(HeaderToggler.element).toStrictEqual(element)
    expect(HeaderToggler.options).toStrictEqual({ ...defaults, ...options })

    expect(spyOnBind).toHaveBeenCalledTimes(1)
  })

  test('bind calls cookieGet once with correct argument', () => {
    const HeaderToggler = new HeaderTogglerClass(element, options)

    expect(spyOnCookieGet).toHaveBeenCalledTimes(1)
    expect(spyOnCookieGet).toHaveBeenCalledWith(HeaderToggler.options.cookieName)
  })

  test('bind calls add when cookie is activeClass and breakpointHelper is visible', () => {
    windowSpy.mockImplementation(() => ({
      getComputedStyle: () => ({
        visibility: 'visible'
      })
    }))
    spyOnCookieGet.mockImplementation(() => 'header-active')

    new HeaderTogglerClass(element, options) // eslint-disable-line no-new

    expect(spyOnAdd).toHaveBeenCalledTimes(1)
  })

  test('bind does not call add when cookie is not activeClass and breakpoint is visible', () => {
    windowSpy.mockImplementation(() => ({
      getComputedStyle: () => ({
        visibility: 'visible'
      })
    }))
    spyOnCookieGet.mockImplementation(() => 'header-not-active')

    new HeaderTogglerClass(element, options) // eslint-disable-line no-new

    expect(spyOnAdd).not.toHaveBeenCalled()
  })

  test('bind does not call add when cookie is activeClass and breakpointHelper is not visible', () => {
    windowSpy.mockImplementation(() => ({
      getComputedStyle: () => ({
        visibility: 'not-visible'
      })
    }))
    spyOnCookieGet.mockImplementation(() => 'header-active')

    new HeaderTogglerClass(element, options) // eslint-disable-line no-new

    expect(spyOnAdd).not.toHaveBeenCalled()
  })

  test('bind calls addEventListener on element once with click', () => {
    const HeaderToggler = new HeaderTogglerClass(element, options)
    const spyOnElementAddEventListener = jest.spyOn(HeaderToggler.element, 'addEventListener')

    HeaderToggler._bind()

    expect(spyOnElementAddEventListener).toHaveBeenCalledTimes(1)
    expect(spyOnElementAddEventListener).toHaveBeenCalledWith(
      'click',
      expect.any(Function)
    )
  })

  test('bind calls adminterface addObserver once with correct argument', () => {
    const spyOnAddObserver = jest.spyOn(global.adminterface, 'addObserver')

    const HeaderToggler = new HeaderTogglerClass(element, options)

    expect(spyOnAddObserver).toHaveBeenCalledTimes(1)
    expect(spyOnAddObserver).toHaveBeenCalledWith(
      HeaderToggler.element,
      HeaderToggler,
      HeaderToggler.constructor.name
    )
  })

  test('clickCallback calls preventDefault', () => {
    spyOnAdd.mockImplementation(() => {})
    spyOnRemove.mockImplementation(() => {})

    const HeaderToggler = new HeaderTogglerClass(element, options)

    HeaderToggler._clickCallback(mockEvent, $container, HeaderToggler)

    expect(mockEvent.preventDefault).toHaveBeenCalledTimes(1)
  })

  test('clickCallback calls remove when $container class contains activeClass', () => {
    spyOnAdd.mockImplementation(() => {})
    spyOnRemove.mockImplementation(() => {})

    const HeaderToggler = new HeaderTogglerClass(element, options)

    document.body.classList.add(HeaderToggler.options.activeClass)

    spyOnAdd.mockClear()
    HeaderToggler._clickCallback(mockEvent, $container, HeaderToggler)

    expect(spyOnRemove).toHaveBeenCalledTimes(1)
    expect(spyOnAdd).not.toHaveBeenCalled()
  })

  test('clickCallback calls add when $container class does not contain activeClass', () => {
    spyOnAdd.mockImplementation(() => {})
    spyOnRemove.mockImplementation(() => {})

    const HeaderToggler = new HeaderTogglerClass(element, options)

    spyOnAdd.mockClear()
    HeaderToggler._clickCallback(mockEvent, $container, HeaderToggler)

    expect(spyOnRemove).not.toHaveBeenCalled()
    expect(spyOnAdd).toHaveBeenCalledTimes(1)
  })

  test('add calls $container.classList.add and cookieSet', () => {
    const spyOnContainerClassListAdd = jest.spyOn($container.classList, 'add')

    const HeaderToggler = new HeaderTogglerClass(element, options)
    spyOnContainerClassListAdd.mockClear()
    spyOnCookieSet.mockClear()
    HeaderToggler._add()

    expect(spyOnContainerClassListAdd).toHaveBeenCalledTimes(1)
    expect(spyOnContainerClassListAdd).toHaveBeenCalledWith(
      HeaderToggler.options.activeClass
    )

    expect(spyOnCookieSet).toHaveBeenCalledTimes(1)
    expect(spyOnCookieSet).toHaveBeenCalledWith(
      HeaderToggler.options.cookieName,
      HeaderToggler.options.activeClass,
      HeaderToggler.options.cookieExpireSec
    )
  })

  test('remove calls $container.classList.remove and cookieSet', () => {
    const spyOnContainerClassListRemove = jest.spyOn($container.classList, 'remove')

    const HeaderToggler = new HeaderTogglerClass(element, options)
    spyOnCookieSet.mockClear()
    HeaderToggler._remove()

    expect(spyOnContainerClassListRemove).toHaveBeenCalledTimes(1)
    expect(spyOnContainerClassListRemove).toHaveBeenCalledWith(
      HeaderToggler.options.activeClass
    )

    expect(spyOnCookieSet).toHaveBeenCalledTimes(1)
    expect(spyOnCookieSet).toHaveBeenCalledWith(
      HeaderToggler.options.cookieName,
      null,
      0
    )
  })
})
