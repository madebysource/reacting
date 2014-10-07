{Dispatcher} = require 'flux'

class AppDispatcher extends Dispatcher

  handleViewAction: (action) ->
    @dispatch source: 'VIEW_ACTION', action: action

  handleServerAction: (action) ->
    @dispatch source: 'SERVER_ACTION', action: action

module.exports = new AppDispatcher()