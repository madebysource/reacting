AppDispatcher = require '../dispatcher'
TodoConstants = require '../constants/todo'


module.exports =
  select: (todo) ->
    AppDispatcher.handleViewAction
      actionType: TodoConstants.TODO_SELECT
      todo: todo
