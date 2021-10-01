/* eslint-env jest */
import DetachedDropdownClass from '../detached_dropdown'

describe('DetachedDropdown', () => {
  const element = document.createElement('div')
  const options = {
    title: '.title-menu'
  }

  beforeEach(() => {
    global.adminterface = {
      addObserver: jest.fn()
    }
  })

  test('constructor initiates properties and call bind correctly', () => {
    const spyOnBind = jest.spyOn(DetachedDropdownClass.prototype, '_bind')
    spyOnBind.mockImplementation(() => {})
    const DetachedDropdown = new DetachedDropdownClass(element, options)

    expect(DetachedDropdown.element).toEqual(element)
    expect(DetachedDropdown.options).toEqual({
      menu: '.dropdown-menu',
      ...options
    })
    expect(spyOnBind).toHaveBeenCalledTimes(1)
    spyOnBind.mockRestore()
  })

  test('bind method calls adminterface correctly', () => {
    const DetachedDropdown = new DetachedDropdownClass(element, options)

    expect(global.adminterface.addObserver).toHaveBeenCalledWith(
      element,
      DetachedDropdown,
      DetachedDropdown.constructor.name
    )
  })

  test('bind method add event listener correctly', () => {
    const DetachedDropdown = new DetachedDropdownClass(element, options)
    const spyOnAddEventListener = jest.spyOn(
      DetachedDropdown.element,
      'addEventListener'
    )
    DetachedDropdown._bind()

    expect(spyOnAddEventListener).toHaveBeenCalledTimes(2)
    expect(spyOnAddEventListener.mock.calls).toEqual([
      ['show.bs.dropdown', expect.any(Function)],
      ['hidden.bs.dropdown', expect.any(Function)]
    ])
  })

  test('append method calls native WEB API append correctly', () => {
    const testDiv = document.createElement('div')
    const testP = document.createElement('p')
    testDiv.append('Some text', testP)

    const DetachedDropdown = new DetachedDropdownClass(element, options)
    const spyOnAppend = jest.spyOn(document.body, 'append')

    DetachedDropdown._append(document.body, testP)

    expect(spyOnAppend).toHaveBeenCalledTimes(1)
    expect(spyOnAppend).toHaveBeenCalledWith(
      testP.parentElement.removeChild(testP)
    )
  })
})
