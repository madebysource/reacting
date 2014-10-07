{EventEmitter} = require 'events'


module.exports =
class BaseStore extends EventEmitter

  @CHANGE_EVENT = 'change'

  emitChange: ->
    @emit(BaseStore.CHANGE_EVENT)

  addChangeListener: (callback) ->
    @on(BaseStore.CHANGE_EVENT, callback)

  removeChangeListener: (callback) ->
    @removeListener(BaseStore.CHANGE_EVENT, callback)
