{li} = require 'reactionary-atom-fork'
{addons} = require 'react-atom-fork/addons'
TodoActions = require '../actions/todo'


module.exports =
React.createClass
  displayName: 'TodoItem'

  _onClick: ->
    TodoActions.select(@props.todo)

  render: ->
    classes = addons.classSet
      'todo-item': true
      'selected': @props.isSelected

    li className: classes, onClick: @_onClick, @props.todo