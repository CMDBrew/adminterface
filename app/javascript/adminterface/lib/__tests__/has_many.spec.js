import fs from 'fs'
import path from 'path'
import Sortable from 'sortablejs'
import HasManyClass from '../has_many'

jest.mock('sortablejs')

describe('HasMany', () => {
  const html = fs.readFileSync(path.resolve(__dirname, './has_many.html'))
  let element

  const options = {
    list: '.has-many-list',
    item: 'fieldset.has_many_fields',
    addLink: 'a.button.has_many_add',
    removeLink: 'a.button.has_many_remove',
    destroyInput: 'input[name$="[_destroy]"]'
  }

  beforeEach(() => {
    document.documentElement.innerHTML = html
    element = document.querySelector('div')
    global.adminterface = {
      addObserver: jest.fn()
    }
  })

  afterEach(() => {
    jest.restoreAllMocks()
  })

  test('constructor initiates correctly', () => {
    const spyOnBind = jest.spyOn(HasManyClass.prototype, '_bind')
    spyOnBind.mockImplementation(() => {})

    const HasMany = new HasManyClass(element)
    expect(HasMany.element).toStrictEqual(element)

    expect(spyOnBind).toHaveBeenCalledTimes(1)
  })

  test('bind calls bindEvents, initSortable and admininterface', () => {
    const spyOnBindEvents = jest.spyOn(HasManyClass.prototype, '_bindEvents')
    spyOnBindEvents.mockImplementation(() => {})

    const spyOnInitSortable = jest.spyOn(HasManyClass.prototype, '_initSortable')
    spyOnInitSortable.mockImplementation(() => {})

    const HasMany = new HasManyClass(element)

    expect(spyOnBindEvents).toHaveBeenCalledWith(element)
    expect(spyOnInitSortable).toHaveBeenCalledTimes(1)
    expect(global.adminterface.addObserver).toHaveBeenCalledTimes(1)
    expect(global.adminterface.addObserver).toHaveBeenCalledWith(
      element,
      HasMany,
      HasMany.constructor.name,
      []
    )
  })

  test('initSortable assigns new instance of Sortable to sortable property', () => {
    const spyOnBindEvents = jest.spyOn(HasManyClass.prototype, '_bindEvents')
    spyOnBindEvents.mockImplementation(() => {})

    const HasMany = new HasManyClass(element)

    const MockSortableArgument = {
      handle: '.handle',
      animation: 150,
      ghostClass: 'sortable-placeholder',
      dragClass: 'sortable-drag',
      onUpdate: expect.any(Function)
    }

    expect(Sortable).toHaveBeenCalledTimes(1)
    expect(Sortable).toHaveBeenCalledWith(
      document.querySelector(HasMany.options.list),
      MockSortableArgument
    )
    const sortable = new Sortable(
      document.querySelector(HasMany.options.list),
      MockSortableArgument
    )
    expect(HasMany.sortable.toString()).toStrictEqual(sortable.toString())
  })

  test('recomputePosition changes sortableInput value', () => {
    const query = 'input[name$="[address]"]'
    const sortableInput = element.querySelector(query)

    expect(sortableInput.value.length).not.toEqual(0)

    const HasMany = new HasManyClass(element)
    HasMany._recomputePosition()

    expect(sortableInput.value.length).toEqual(0)
  })

  test('bindDestroyEvent called with element and change event added', () => {
    const spyOnBindDestroyEvent = jest.spyOn(
      HasManyClass.prototype,
      '_bindDestroyEvent'
    )
    const destroyInput = document.querySelector(options.destroyInput)
    destroyInput.addEventListener = jest.fn()

    new HasManyClass(element) // eslint-disable-line no-new

    expect(spyOnBindDestroyEvent).toHaveBeenCalledTimes(1)
    expect(spyOnBindDestroyEvent).toHaveBeenCalledWith(destroyInput)

    expect(destroyInput.addEventListener).toHaveBeenCalledTimes(1)
    expect(destroyInput.addEventListener).toHaveBeenCalledWith(
      'change',
      expect.any(Function)
    )
  })

  test('bindRemoveEvent called with element and click event added', () => {
    const spyOnBindRemoveEvent = jest.spyOn(
      HasManyClass.prototype,
      '_bindRemoveEvent'
    )
    const removeLinks = document.querySelector(options.removeLink)
    removeLinks.addEventListener = jest.fn()

    new HasManyClass(element) // eslint-disable-line no-new

    expect(spyOnBindRemoveEvent).toHaveBeenCalledTimes(1)
    expect(spyOnBindRemoveEvent).toHaveBeenCalledWith(removeLinks)

    expect(removeLinks.addEventListener).toHaveBeenCalledTimes(1)
    expect(removeLinks.addEventListener).toHaveBeenCalledWith(
      'click',
      expect.any(Function)
    )
  })

  test('bindRemoveEventCallBack', () => {
    const mockEvent = {
      preventDefault: () => {},
      target: document.body.querySelector('fieldset')
    }
    const spyOnRecomputePosition = jest.spyOn(
      HasManyClass.prototype,
      '_recomputePosition'
    )
    const HasMany = new HasManyClass(element)
    const spyOnDispatch = jest.spyOn(HasMany.element, 'dispatchEvent')

    const fieldSet = mockEvent.target.closest(HasMany.options.item)
    fieldSet.remove = jest.fn()

    const parent = HasMany.element
    const removeBeforeEvent = HasMany.events.removeBefore
    removeBeforeEvent.detail = { fieldSet, parent }
    const removeAfterEvent = HasMany.events.removeAfter
    removeAfterEvent.detail = { fieldSet, parent }

    const output = HasMany._bindRemoveEventCallBack(mockEvent)

    expect(spyOnRecomputePosition).toHaveBeenCalledTimes(1)
    expect(spyOnDispatch).toHaveBeenCalledTimes(2)
    expect(spyOnDispatch.mock.calls).toMatchObject([
      [removeBeforeEvent],
      [removeAfterEvent]
    ])
    expect(fieldSet.remove).toHaveBeenCalledTimes(1)
    expect(output).toBeTruthy()
  })

  test('bindAddEvent called with correctly element and click event added', () => {
    const spyOnBindAddEvent = jest.spyOn(
      HasManyClass.prototype,
      '_bindAddEvent'
    )

    const addLinks = document.querySelector(options.addLink)
    addLinks.addEventListener = jest.fn()

    new HasManyClass(element) // eslint-disable-line no-new

    expect(spyOnBindAddEvent).toHaveBeenCalledTimes(1)
    expect(spyOnBindAddEvent).toHaveBeenCalledWith(addLinks)

    expect(addLinks.addEventListener).toHaveBeenCalledTimes(1)
    expect(addLinks.addEventListener).toHaveBeenCalledWith(
      'click',
      expect.any(Function)
    )
  })

  test('bindAddEventCallBack', () => {
    const mockEvent = {
      preventDefault: () => {},
      target: document.body.querySelector(options.addLink)
    }
    const HasMany = new HasManyClass(element)
    const spyOnDispatchEvent = jest.spyOn(HasMany.element, 'dispatchEvent')
    const $list = HasMany.element.querySelector(HasMany.options.list)
    const spyOnListAppendChild = jest.spyOn($list, 'appendChild')
    const spyOnBindEvents = jest.spyOn(HasMany, '_bindEvents')
    const spyOnRecomputePosition = jest.spyOn(HasMany, '_recomputePosition')
    const beforeAdd = HasMany.events.addBefore
    const parent = HasMany.element
    const datasetHTML = document.createElement('div')

    const output = HasMany._bindAddEventCallBack(mockEvent)

    expect(spyOnDispatchEvent).toHaveBeenCalledTimes(2)
    expect(spyOnDispatchEvent.mock.calls).toMatchObject([
      [beforeAdd, [parent]],
      [HasMany.events.addAfter]
    ])

    expect(spyOnListAppendChild).toHaveBeenCalledTimes(1)
    expect(spyOnListAppendChild).toHaveBeenCalledWith(datasetHTML)
    expect(spyOnBindEvents).toHaveBeenCalledTimes(1)
    expect(spyOnBindEvents).toHaveBeenCalledWith(datasetHTML)
    expect(spyOnRecomputePosition).toHaveBeenCalledTimes(1)
    expect(output).toBeTruthy()
  })
})
