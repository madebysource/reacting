AppDispatcher = require '../dispatcher'
BaseStore = require './base'
TodoConstants = require '../constants/todo'
Immutable = require 'immutable'


Todo = Immutable.Record
  id: undefined
  title: undefined
  timestamp: new Date()


class TodoStore extends BaseStore

  constructor: ->
    @_todos = Immutable.List.of(new Todo(id: 1, title: 'one'), new Todo(id: 2, title: 'two'))
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
      when TodoConstants.TODO_SELECT then @_select(action.todo)

module.exports = new TodoStore()
