{ul, li} = require 'reactionary'
TodoStore = require '../stores/todo'
TodoItem = React.createFactory(require('./todo-item'))
PureRenderMixin = require('react/addons').addons.PureRenderMixin
require './todo.less'


getStateFromStores = ->
  todos: TodoStore.getAll()
  selectedTodo: TodoStore.getSelected()


module.exports =
React.createClass
  displayName: 'App'
  mixins: [PureRenderMixin]

  getInitialState: ->
    getStateFromStores()

  componentDidMount: ->
    TodoStore.addChangeListener(@_onChange)

  componentWillUnmount: ->
    TodoStore.removeChangeListener(@_onChange)

  _onChange: ->
    @setState(getStateFromStores())

  render: ->
    todos = @state.todos.map (todo) =>
      TodoItem
        key: todo.id
        todo: todo
        isSelected: @state.selectedTodo and todo is @state.selectedTodo
    ul className: 'todos', todos.toJS()
