import PerPage from '../per_page'
import * as utilModule from '../utils'

describe('CheckboxToggler', () => {
  const mockEvent = {
    preventDefault: jest.fn()
  }
  const mockQueryString = '?email=someone@example.com'
  const value = 1

  let spyOnQueryStringToParams
  let spyOnTurbolinks
  let spyOnTurbolinksVisit
  let spyOnToQueryString
  let params

  beforeEach(() => {
    Object.defineProperty(window, 'location', {
      value: {
        search: mockQueryString
      },
      writable: true
    })

    params = utilModule.queryStringToParams().filter(({ name }) => name !== 'per_page' && name !== 'page')
    params.push({ name: 'per_page', value })

    spyOnQueryStringToParams = jest.spyOn(utilModule, 'queryStringToParams')
    spyOnTurbolinks = jest.spyOn(utilModule, 'hasTurbolinks')
    spyOnTurbolinksVisit = jest.spyOn(utilModule, 'turbolinksVisit')
    spyOnToQueryString = jest.spyOn(utilModule, 'toQueryString')

    PerPage.value = value
  })

  afterEach(() => {
    jest.restoreAllMocks()
    mockEvent.preventDefault.mockClear()
  })

  test('update triggers queryStringToParams', () => {
    PerPage._update(mockEvent)

    expect(spyOnQueryStringToParams).toHaveBeenCalledTimes(1)
  })

  test('hasTurbolinks: true, update triggers preventDefault and turbolinksVisit', () => {
    spyOnTurbolinks.mockImplementation(() => true)
    spyOnTurbolinksVisit.mockImplementation(() => {})

    PerPage._update(mockEvent)

    expect(mockEvent.preventDefault).toHaveBeenCalledTimes(1)

    expect(spyOnTurbolinksVisit).toHaveBeenCalledTimes(1)
    expect(spyOnTurbolinksVisit).toHaveBeenCalledWith(params)

    expect(spyOnToQueryString).not.toHaveBeenCalled()
  })

  test('hasTurbolinks: false, sets window.location.search to toQueryString output', () => {
    spyOnTurbolinks.mockImplementation(() => false)
    spyOnToQueryString.mockImplementation(params => params)

    PerPage._update(mockEvent)

    expect(mockEvent.preventDefault).not.toHaveBeenCalled()
    expect(spyOnTurbolinksVisit).not.toHaveBeenCalled()

    expect(spyOnToQueryString).toHaveBeenCalledTimes(1)
    expect(spyOnToQueryString).toHaveBeenCalledWith(params)

    expect(window.location.search).toStrictEqual(params)
  })
})
