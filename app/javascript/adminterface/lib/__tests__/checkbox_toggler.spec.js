import fs from 'fs'
import path from 'path'
import CheckboxTogglerClass from '../checkbox_toggler'

describe('CheckboxToggler', () => {
  const html = fs.readFileSync(path.resolve(__dirname, './checkbox_toggler.html'))
  const container = '#find-me'
  const options = 'options'

  beforeEach(() => {
    document.documentElement.innerHTML = html.toString()
  })

  afterEach(() => {
    jest.restoreAllMocks()
  })

  test('constructor initiates correctly', () => {
    const spyOnInit = jest.spyOn(CheckboxTogglerClass.prototype, '_init')
    const spyOnBind = jest.spyOn(CheckboxTogglerClass.prototype, '_bind')

    const CheckboxToggler = new CheckboxTogglerClass(container, options)

    expect(CheckboxToggler.options).toStrictEqual(options)
    expect(CheckboxToggler.container).toStrictEqual(container)

    expect(spyOnInit).toHaveBeenCalledTimes(1)
    expect(spyOnBind).toHaveBeenCalledTimes(1)
  })

  test('init throws error if container is null', () => {
    expect(() => { new CheckboxTogglerClass(null, options) }).toThrow( // eslint-disable-line no-new
      'Container element not found'
    )
  })

  test('init throws error if toggle checkbox missing', () => {
    const element = document.createElement('div')
    element.id = 'find-me'
    document.documentElement.innerHTML = element.outerHTML

    expect(() => { new CheckboxTogglerClass(container, options) }).toThrow( // eslint-disable-line no-new
      '"toggle all" checkbox not found'
    )
  })

  test('init sets $container, $toggleAllCheckbox, $checkboxes', () => {
    const $container = document.querySelector(container)
    const $toggleAllCheckbox = $container.querySelector('.toggle_all')
    const $checkboxes = $container.querySelectorAll('input[type="checkbox"]:not(.toggle_all)')
    const CheckboxToggler = new CheckboxTogglerClass(container, options)

    expect(CheckboxToggler.$container).toStrictEqual($container)
    expect(CheckboxToggler.$toggleAllCheckbox).toStrictEqual($toggleAllCheckbox)
    expect(CheckboxToggler.$checkboxes).toStrictEqual($checkboxes)
  })

  test('bind triggers addEventListener', () => {
    const CheckboxToggler = new CheckboxTogglerClass(container, options)
    const spyOnCheckboxesAddEvent = jest.spyOn(
      CheckboxToggler.$checkboxes[0], 'addEventListener'
    )
    const spyOnToggleAllCheckboxAddEvent = jest.spyOn(
      CheckboxToggler.$toggleAllCheckbox, 'addEventListener'
    )

    CheckboxToggler._bind()

    expect(spyOnCheckboxesAddEvent).toHaveBeenCalledTimes(1)
    expect(spyOnCheckboxesAddEvent).toHaveBeenCalledWith(
      'change',
      expect.any(Function)
    )

    expect(spyOnToggleAllCheckboxAddEvent).toHaveBeenCalledTimes(1)
    expect(spyOnToggleAllCheckboxAddEvent).toHaveBeenCalledWith(
      'change',
      expect.any(Function)
    )
  })

  test('didChangeCheckbox sets toggleAllCheckbox checked to true when all checked', () => {
    const CheckboxToggler = new CheckboxTogglerClass(container, options)
    CheckboxToggler._didChangeCheckbox()

    expect(CheckboxToggler.$toggleAllCheckbox.checked).toBeTruthy()
    expect(CheckboxToggler.$toggleAllCheckbox.indeterminate).toBeFalsy()
  })

  test('didChangeCheckbox sets toggleAllCheckbox checked to false when some checked', () => {
    const inputElementToggleTwo = document.querySelector('input.toggle_two')
    inputElementToggleTwo.checked = false

    const CheckboxToggler = new CheckboxTogglerClass(container, options)
    CheckboxToggler._didChangeCheckbox()

    expect(CheckboxToggler.$toggleAllCheckbox.checked).toBeFalsy()
    expect(CheckboxToggler.$toggleAllCheckbox.indeterminate).toBeTruthy()
  })

  test('didChangeToggleAllCheckbox', () => {
    const CheckboxToggler = new CheckboxTogglerClass(container, options)
    const setting = CheckboxToggler._didChangeToggleAllCheckbox()

    expect(setting).toBeTruthy()
    CheckboxToggler.$checkboxes.forEach(el => {
      expect(el.checked).toStrictEqual(setting)
    })
  })
})
