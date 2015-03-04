{li} = require 'reactionary'
TodoActions = require '../actions/todo'
classNames = require 'classnames'
PureRenderMixin = require('react/addons').addons.PureRenderMixin


module.exports =
React.createClass
  displayName: 'TodoItem'
  mixins: [PureRenderMixin]

  _onClick: ->
    TodoActions.select(@props.todo)

  render: ->
    classes = classNames
      'todo-item': true
      'selected': @props.isSelected

    li className: classes, onClick: @_onClick, @props.todo.title
