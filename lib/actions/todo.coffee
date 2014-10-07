AppDispatcher = require '../dispatcher'

module.exports =
  select: (todo) ->
    AppDispatcher.handleViewAction
      actionType: 'TODO_SELECT'
      todo: todo
