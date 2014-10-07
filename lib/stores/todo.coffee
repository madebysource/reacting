AppDispatcher = require '../dispatcher'
BaseStore = require './base'


class TodoStore extends BaseStore

  constructor: ->
    @_todos = ['one', 'two']
    @_selected = null

    @dispatchToken = AppDispatcher.register(@_register)

  getAll: ->
    @_todos

  getSelected: ->
    @_selected

  _select: (todo) ->
    @_selected = todo
    @emitChange()

  _register: (payload) =>
    action = payload.action

    switch action.actionType
      when 'TODO_SELECT' then @_select(action.todo)

module.exports = new TodoStore()
