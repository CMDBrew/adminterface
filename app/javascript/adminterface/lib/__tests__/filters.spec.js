import Filters from '../filters'
import * as utilModule from '../utils'

describe('Filters', () => {
  const mockURL = '?city=tokyo&country=japan'
  const mockEvent = {
    preventDefault: () => {}
  }

  const spyOnLocation = jest.spyOn(window, 'location', 'get')
  spyOnLocation.mockImplementation(() => ({ search: mockURL }))

  const regex = /^(q\[|q%5B|q%5b|page|utf8|commit)/
  const params = utilModule
    .queryStringToParams()
    .filter(({ name }) => !name.match(regex))

  const mockElementList = [
    {
      value: '',
      disabled: false,
      type: 'input'
    }
  ]

  let spyOnQueryStringToParams
  let spyOnHasTurbolinks
  let spyOnTurbolinksVisit
  let spyOnToQueryString
  let spyOnQuerySelectorAll
  let spyOnSerializeArray
  let spyOnClosest
  let spyOnQuerySelector

  beforeEach(() => {
    document.body.innerHTML =
      '<div class="filter_form_field">' +
      '  <input />' +
      '</div>'

    spyOnQueryStringToParams = jest.spyOn(utilModule, 'queryStringToParams')

    spyOnHasTurbolinks = jest.spyOn(utilModule, 'hasTurbolinks')

    spyOnTurbolinksVisit = jest.spyOn(utilModule, 'turbolinksVisit')

    spyOnToQueryString = jest.spyOn(utilModule, 'toQueryString')

    spyOnQuerySelectorAll = jest.spyOn(document, 'querySelectorAll')
    spyOnQuerySelectorAll.mockImplementation(() => [...mockElementList])

    spyOnSerializeArray = jest.spyOn(utilModule, 'serializeArray')
    spyOnSerializeArray.mockImplementation(() => [])

    spyOnClosest = jest.spyOn(document.documentElement, 'closest')
    spyOnClosest.mockImplementation(() => ({
      querySelector: (selector) => document.querySelector(selector)
    }))

    spyOnQuerySelector = jest.spyOn(document, 'querySelector')

    Filters.querySelectorAll = document.querySelectorAll
    Filters.closest = document.documentElement.closest
    Filters.value = 'test value'
  })

  afterEach(() => {
    jest.clearAllMocks()
  })

  test('clearForm: triggers queryStringToParams', () => {
    Filters._clearForm(mockEvent)

    expect(spyOnQueryStringToParams).toHaveBeenCalledTimes(1)
  })

  test('clearForm: hasTurbolinks true triggers turbolinksVisit', () => {
    spyOnHasTurbolinks.mockImplementation(() => true)
    spyOnTurbolinksVisit.mockImplementation(params => params)
    Filters._clearForm(mockEvent)

    expect(spyOnTurbolinksVisit).toHaveBeenCalledTimes(1)
    expect(spyOnTurbolinksVisit).toHaveBeenCalledWith(params)
  })

  test('clearForm: hasTurbolinks false triggers toQueryString', () => {
    spyOnHasTurbolinks.mockImplementation(() => false)
    Filters._clearForm(mockEvent)

    expect(spyOnToQueryString).toHaveBeenCalledTimes(1)
    expect(spyOnToQueryString).toHaveBeenCalledWith(params)
  })

  test('disableEmptyInputFields triggers querySelectorAll', () => {
    const mockSelectors = 'input, textarea, select, button'

    Filters._disableEmptyInputFields(mockEvent)

    expect(spyOnQuerySelectorAll).toHaveBeenCalledTimes(1)
    expect(spyOnQuerySelectorAll).toHaveBeenCalledWith(mockSelectors)
  })

  test('disableEmptyInputFields triggers serializeArray', () => {
    Filters._disableEmptyInputFields(mockEvent)

    expect(spyOnSerializeArray).toHaveBeenCalledTimes(1)
    expect(spyOnSerializeArray).toHaveBeenCalledWith(Filters)
  })

  test('disableEmptyInputFields sets element list disable value to true', () => {
    Filters._disableEmptyInputFields(mockEvent)

    const disabledList = mockElementList.filter(el => el.disabled)
    expect(disabledList).toHaveLength(1)
  })

  test('disableEmptyInputFields triggers turboLinksVisit if hasTurbolinks true', () => {
    spyOnHasTurbolinks.mockImplementation(() => true)
    Filters._disableEmptyInputFields(mockEvent)

    expect(spyOnTurbolinksVisit).toHaveBeenCalledTimes(1)
    expect(spyOnTurbolinksVisit).toHaveBeenCalledWith([])
  })

  test('disableEmptyInputFields does not trigger turboLinksVisit if hasTurbolinks false', () => {
    spyOnHasTurbolinks.mockImplementation(() => false)
    Filters._disableEmptyInputFields(mockEvent)

    expect(spyOnTurbolinksVisit).not.toHaveBeenCalled()
  })

  test('setSearchType calls DOM API closest and querySelector', () => {
    Filters._setSearchType()

    expect(spyOnClosest).toHaveBeenCalledTimes(1)
    expect(spyOnClosest).toHaveBeenCalledWith('.filter_form_field')

    expect(spyOnQuerySelector).toHaveBeenCalledTimes(1)
    expect(spyOnQuerySelector).toHaveBeenCalledWith('input')
  })

  test('setSearchType sets element name correctly', () => {
    const $element = document.querySelector('input')
    expect($element.name).toEqual('')

    Filters._setSearchType()

    expect($element.name).toEqual(`q[${Filters.value}]`)
  })
})
