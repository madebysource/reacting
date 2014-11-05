{ul, li} = require 'reactionary'
TodoStore = require '../stores/todo'
TodoItem = React.createFactory(require('./todo-item'))
require './todo.less'


getStateFromStores = ->
  todos: TodoStore.getAll()
  selectedTodo: TodoStore.getSelected()


module.exports =
React.createClass
  displayName: 'App'

  getInitialState: ->
    getStateFromStores()

  componentDidMount: ->
    TodoStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    TodoStore.removeChangeListener(@_onChange)

  _onChange: ->
    @setState(getStateFromStores())

  render: ->
    ul className: 'todos',
      for todo in @state.todos
        TodoItem
          key: todo
          todo: todo
          isSelected: Boolean(@state.selectedTodo and todo == @state.selectedTodo)
