{li} = require 'reactionary'
TodoActions = require '../actions/todo'
classNames = require 'classnames'


module.exports =
React.createClass
  displayName: 'TodoItem'

  _onClick: ->
    TodoActions.select(@props.todo)

  render: ->
    classes = classNames
      'todo-item': true
      'selected': @props.isSelected

    li className: classes, onClick: @_onClick, @props.todo
